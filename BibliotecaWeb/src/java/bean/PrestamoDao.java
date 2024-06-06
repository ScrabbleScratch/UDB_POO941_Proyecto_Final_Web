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
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class PrestamoDao {
    public static boolean validate(PrestamoBean bean) {
        try {
            int[] params = usuarioParams(bean);
            
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            LocalDateTime returnDate = LocalDateTime.now().plusDays(params[1]);
            
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("INSERT INTO prestamos_" + bean.getCategoria() + " "
                    + "(usuario, fecha_devolucion, item_id) VALUES "
                    + "(?, ?, ?);");
            ps.setInt(1, params[0]);
            ps.setString(2, dtf.format(returnDate));
            ps.setString(3, bean.getId());
            
            int resultado = ps.executeUpdate();
            
            if (resultado > 0)
                return true;
        } catch (Exception e) { }
        
        return false;
    }
    
    public static int[] usuarioParams(PrestamoBean bean) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("SELECT U.id, max_prestamos, max_dias FROM usuarios AS U "
                    + "LEFT JOIN rolparams AS R ON R.rol = U.rol "
                    + "WHERE U.nombre = ?;");
            ps.setString(1, bean.getUsuario());
            
            ResultSet rs = ps.executeQuery();
            
            if (!rs.next())
                return null;
            
            int userId = rs.getInt("id");
            int maxDias = rs.getInt("max_dias");
            
            return new int[] {userId, maxDias};
        } catch (Exception e) { }
        
        return null;
    }
}
