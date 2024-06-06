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

public class RolDao {
    public static boolean validate(RolBean bean) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("UPDATE rolparams "
                    + "SET max_prestamos = ?, max_dias = ?, mora_diaria = ? "
                    + "WHERE rol = ?;");
            ps.setString(1, bean.getPrestamos());
            ps.setString(2, bean.getDias());
            ps.setString(3, bean.getMora());
            ps.setString(4, bean.getId());
            
            int result = ps.executeUpdate();
            
            if (result > 0)
                return true;
        } catch (Exception e) { }
        
        return false;
    }
    
    public static RolBean fetch(RolBean bean) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("SELECT * FROM roles AS R "
                    + "LEFT JOIN rolparams AS P ON P.rol = R.id "
                    + "WHERE R.id = ?;");
            ps.setString(1, bean.getId());
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                bean.setNombre(rs.getString("nombre"));
                bean.setDescripcion(rs.getString("descripcion"));
                bean.setPrestamos(rs.getString("max_prestamos"));
                bean.setDias(rs.getString("max_dias"));
                bean.setMora(rs.getString("mora_diaria"));
                
                return bean;
            }
        } catch (Exception e) { }
        
        return null;
    }
}
