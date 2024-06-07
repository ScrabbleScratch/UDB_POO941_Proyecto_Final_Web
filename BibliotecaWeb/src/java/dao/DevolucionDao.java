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

import bean.DevolucionBean;
import database.Conexion;

import java.sql.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class DevolucionDao {
    public static boolean validate(DevolucionBean bean) {
        try {
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("UPDATE prestamos_" + bean.getCategoria() + " SET fecha_devuelto = ? WHERE id = ?;");
            ps.setString(1, dtf.format(LocalDateTime.now()));
            ps.setString(2, bean.getId());
            
            int resultado = ps.executeUpdate();
            
            if (resultado > 0)
                return true;
        } catch (Exception e) { }
        
        return false;
    }
}
