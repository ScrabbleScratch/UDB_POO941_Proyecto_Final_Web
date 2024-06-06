/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author Mario O.
 */

import database.Conexion;

import java.sql.*;

public class EliminarUsuarioDao {
    public static boolean validate(String usuario) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("DELETE FROM usuarios WHERE nombre = ?;");
            ps.setString(1, usuario);
            
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
        } catch (Exception e) { }
        
        return false;
    }
}
