/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package database;

/**
 *
 * @author Mario O.
 */

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

public class Conexion {
    private static Connection con;
    
    public static Connection establecerConexion() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/biblioteca", "biblioteca", "biblioteca");
            //JOptionPane.showMessageDialog(null,"Conexión exitosa con la base de datos");
        } catch (Exception e) {
            JOptionPane.showMessageDialog(null, "No es posible conectar con la base de datos" + e.toString());
        }
        return con;
    }
}
