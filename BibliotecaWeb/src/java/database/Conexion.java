/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

/**
 *
 * @author Mario O.
 */

import java.sql.*;

public class Conexion {
    private static Connection con;
    
    public static Connection conectar() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "biblioteca", "biblioteca");
        } catch (Exception e) { }
        return con;
    }
    
    public static void desconectar() {
        try {
            con.close();
        } catch (Exception e) { }
    }
}
