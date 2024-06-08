/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Mario O.
 */

import database.Conexion;

import java.sql.*;

public class EliminarUsuarioDao {
    public static boolean validate(String usuario) {
        boolean data = false;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL eliminar_usuario(?);");
            ps.setString(1, usuario);
            
            int result = ps.executeUpdate();
            
            if (result > 0)
                data = true;
        } catch (Exception e) {
            data = false;
        }
        Conexion.desconectar();
        return data;
    }
}
