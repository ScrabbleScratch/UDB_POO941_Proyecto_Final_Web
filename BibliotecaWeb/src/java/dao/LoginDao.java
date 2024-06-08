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
    public static boolean validate(LoginBean bean) {
        boolean admin = false;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL validar_usuario(?, ?);");
            ps.setString(1, bean.getUsuario());
            ps.setString(2, bean.getPass());
            
            ResultSet rs = ps.executeQuery();
            
            if (rs.next())
                admin = rs.getString("rol").equals("1");
        } catch (Exception e) {
            admin = false;
        }
        Conexion.desconectar();
        return admin;
    }
}
