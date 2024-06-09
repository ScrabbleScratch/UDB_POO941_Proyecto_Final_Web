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

import bean.RolBean;
import database.Conexion;

import java.sql.*;

public class RolDao {
    public static boolean validate(RolBean bean) {
        boolean data = false;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL actualizar_rol(?, ?, ?, ?);");
            ps.setString(1, bean.getId());
            ps.setString(2, bean.getPrestamos());
            ps.setString(3, bean.getDias());
            ps.setString(4, bean.getMora());
            
            int result = ps.executeUpdate();
            
            if (result > 0)
                data = true;
        } catch (Exception e) {
            data = false;
        }
        Conexion.desconectar();
        return data;
    }
    
    public static RolBean fetch(RolBean bean) {
        RolBean data = null;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL consultar_rol(?);");
            ps.setString(1, bean.getId());
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean.setNombre(rs.getString("nombre"));
                bean.setDescripcion(rs.getString("descripcion"));
                bean.setPrestamos(rs.getString("max_prestamos"));
                bean.setDias(rs.getString("max_dias"));
                bean.setMora(rs.getString("mora_diaria"));
                
                data = bean;
            }
        } catch (Exception e) {
            data = null;
        }
        Conexion.desconectar();
        return data;
    }
}
