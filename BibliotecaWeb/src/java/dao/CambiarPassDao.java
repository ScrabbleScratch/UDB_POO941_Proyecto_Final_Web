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

public class CambiarPassDao {
    public static boolean validate(LoginBean bean) {
        boolean data = false;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL cambiar_pass(?, ?);");
            ps.setString(1, bean.getUsuario());
            ps.setString(2, bean.getPass());
            
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
