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
            
            PreparedStatement ps = con.prepareStatement("CALL devolver_item(?, ?, ?);");
            ps.setString(1, bean.getCategoria());
            ps.setString(2, bean.getId());
            ps.setString(3, dtf.format(LocalDateTime.now()));
            
            int resultado = ps.executeUpdate();
            
            if (resultado > 0)
                return true;
        } catch (Exception e) { }
        
        return false;
    }
}
