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

import bean.PrestamoBean;
import database.Conexion;

import java.sql.*;

public class PrestamoDao {
    public static boolean validate(PrestamoBean bean) {
        boolean data = false;
        try {
            Connection con = Conexion.conectar();
            
            PreparedStatement ps = con.prepareStatement("CALL registrar_prestamo(?, ?, ?);");
            ps.setString(1, bean.getCategoria());
            ps.setString(2, bean.getUsuario());
            ps.setString(3, bean.getId());
            
            int resultado = ps.executeUpdate();
            
            if (resultado > 0)
                data = true;
        } catch (Exception e) {
            data = false;
        }
        Conexion.desconectar();
        return data;
    }
}
