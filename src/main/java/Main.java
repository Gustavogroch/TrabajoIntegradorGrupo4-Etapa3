import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.*;
import java.util.Scanner;
import java.util.HashMap;

public class Main {
    public static void main(String[] args) throws IOException, SQLException {

        //Path listaP = Paths.get("partidos.txt");//Conecta con Archivos
        //Scanner lector = new Scanner(listaP);

        //lector.useDelimiter("[,;\\n]");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost/Tpiprode", "root", "root");
        Statement st = conn.createStatement();

        ResultSet rs = st.executeQuery("select * from partidos");

        Ronda lista = new Ronda();

        System.out.println("");
        System.out.println("GRUPO C - FASE DE GRUPOS");
        System.out.println("");

        /*while (lector.hasNextInt()) {
            int nPar = lector.nextInt();
            String e1 = lector.next();
            int r1 = lector.nextInt();
            int r2 = lector.nextInt();
            String e2 = lector.next();
            Partido nuevo = new Partido(nPar,e1,r1,e2,r2);//Genera un nuevo Partido
            lista.agregarPartido(nuevo);
            System.out.println("Partido nº " + nPar + " : " +  nuevo);
        }
           */
        while (rs.next()) {
            int nPar = rs.getInt("id");
            String e1 = rs.getString("Equipo1");
            int r1 = rs.getInt("golesequipo1");
            int r2 = rs.getInt("golesequipo2");
            String e2 = rs.getString("equipo2");

            Partido nuevo = new Partido(nPar,e1,r1,e2,r2);//Genera un nuevo Partido
            lista.agregarPartido(nuevo);
            System.out.println("Partido nº " + nPar + " : " +  nuevo);
        }
        rs.close();


        //Carga Pronosticos

       // Path listaPro = Paths.get("pronostico.txt");
        //Scanner lectorPro = new Scanner(listaPro);

       // lectorPro.useDelimiter("[,;\\n]");

        Statement st1 = conn.createStatement();

        ResultSet rs1 = st.executeQuery("select * from pronosticos");

        ResultadosPro listaPronostico = new ResultadosPro();

        /*while (lectorPro.hasNextLine()) {
            String line = lectorPro.nextLine();
            String[] parts = line.split(";");//Divide la línea en diferentes partes
            int parPro = Integer.parseInt(parts[0]);//Se convierte el primer elemento del array de partes a un entero
            String nomPro = parts[2];
            String resPro = parts[1];

            Pronostico nuevo2 = new Pronostico(parPro,resPro,nomPro);//Genera nuevos Pronosticos
            listaPronostico.agregarPronostico(nuevo2);
        }*/
        while (rs1.next()){

            int parPro = rs1.getInt("partido");
            String nomPro = rs1.getString("participante");
            String resPro = rs1.getString("Resultado");

            Pronostico nuevo2 = new Pronostico(parPro,resPro,nomPro);//Genera nuevos Pronosticos
            listaPronostico.agregarPronostico(nuevo2);
        }

        conn.close();

        System.out.println("");

        String equipoGanador = "";
        HashMap<String, Integer> puntajesJugadores = new HashMap<>();//Almacena puntaje jugadores

        for (int i = 1; i < lista.cantidadPartido()+1 ; i++) {//Recorre todos los partidos
            Partido partido = lista.partidos.get(i);
            int resEquipo1 = partido.getGoles1();
            int resEquipo2 = partido.getGoles2();

            if (resEquipo1 > resEquipo2) { //Calcula equipos ganadores
                equipoGanador = partido.getEquipo1();
                System.out.println("Resultado nº " + i + " : " +  equipoGanador);
            } else {
                if (resEquipo1 == resEquipo2) {
                    equipoGanador = "Empate";
                    System.out.println("Resultado nº " + i + " : " +  equipoGanador);
                } else {
                    equipoGanador = partido.getEquipo2();
                    System.out.println("Resultado nº " + i + " : " +  equipoGanador);
                }
            }
            HashMap<String, String> jugadores = listaPronostico.pronosticos.get(i);
            for (String jugador : jugadores.keySet()) { //Recorre pronosticos por jugador
                String resultadoJugador = jugadores.get(jugador);
                if (resultadoJugador.trim().equals(equipoGanador.trim())) {
                    int puntajeActual = puntajesJugadores.getOrDefault(jugador, 0);//Acumula puntaje por jugador
                    puntajesJugadores.put(jugador, puntajeActual + 1);
                    System.out.println("Jugador : "+ jugador + " +1");
                }else {
                    int puntajeActual = puntajesJugadores.getOrDefault(jugador, 0);
                    puntajesJugadores.put(jugador, puntajeActual);
                    System.out.println("Jugador : "+ jugador + " (" + resultadoJugador + ")");
                }
            }
            System.out.println("");

        }
        for (String jugador : puntajesJugadores.keySet()) {//Mustra puntaje por jugador
            int puntaje = puntajesJugadores.get(jugador);
            System.out.println("Puntaje de "+jugador+": "+puntaje);
        }
    }
}
