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

import bean.LoginBean;
import database.Conexion;

import java.sql.*;

public class LoginDao {
    public static String validate(LoginBean bean) {
        String role = null;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL validar_usuario(?, ?);");
            ps.setString(1, bean.getUsuario());
            ps.setString(2, bean.getPass());
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
                role = rs.getString("rol");
        } catch (Exception e) {
            role = null;
        }
        Conexion.desconectar();
        return role;
    }
}
