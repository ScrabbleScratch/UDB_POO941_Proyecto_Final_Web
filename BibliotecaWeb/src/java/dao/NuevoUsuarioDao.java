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

import bean.UsuarioBean;
import database.Conexion;

import java.sql.*;

public class NuevoUsuarioDao {
    public static boolean validate(UsuarioBean bean) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO usuarios(nombre, passwd, rol) VALUES (?, ?, ?);");
            ps.setString(1, bean.getUsuario());
            ps.setString(2, bean.getPass());
            ps.setString(3, bean.getRol());
            
            int result = ps.executeUpdate();
            if (result > 0)
                return true;
        } catch (Exception e) { }
        
        return false;
    }
}
