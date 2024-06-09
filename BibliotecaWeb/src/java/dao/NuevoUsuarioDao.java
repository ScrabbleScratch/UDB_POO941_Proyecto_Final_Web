/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

/**
 *
 * @author Miguel A.
 */

import bean.UsuarioBean;
import database.Conexion;

import java.sql.*;

public class NuevoUsuarioDao {
    public static boolean validate(UsuarioBean bean) {
        boolean data = false;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL crear_usuario(?, ?, ?);");
            ps.setString(1, bean.getUsuario());
            ps.setString(2, bean.getPass());
            ps.setString(3, bean.getRol());
            
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
