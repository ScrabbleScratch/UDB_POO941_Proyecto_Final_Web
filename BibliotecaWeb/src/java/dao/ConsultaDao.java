/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package dao;

/**
 *
 * @author Mario
 */

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.List;
import java.util.ArrayList;

import database.Conexion;

public class ConsultaDao {
    public static List<String[]> dataCategoria(String categoria) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("CALL consultar_items(?);");
            ps.setString(1, categoria);
            ResultSet rs = ps.executeQuery();
            
            ResultSetMetaData rsm = rs.getMetaData();
            int colCount = rsm.getColumnCount();
            
            String[] colNames = new String[colCount];
            for (int i = 0; i < colCount; i++) {
                colNames[i] = rsm.getColumnName(i + 1);
            }
            
            List<String[]> data = new ArrayList<>();
            data.add(colNames);
            
            while (rs.next()) {
                String[] rowData = new String[colCount];
                for (int i = 0; i < colCount; i++) {
                    rowData[i] = rs.getString(colNames[i]);
                }
                data.add(rowData);
            }
            
            return data;
        } catch (Exception e) { }
        
        return null;
    }
    
    public static List<String[]> prestamosCategoria(String categoria, String usuario) {
        try {
            Connection con = Conexion.establecerConexion();
            
            PreparedStatement ps = con.prepareStatement("CALL consultar_prestamos(?, ?);");
            ps.setString(1, categoria);
            ps.setString(2, usuario);
            ResultSet rs = ps.executeQuery();
            
            ResultSetMetaData rsm = rs.getMetaData();
            int colCount = rsm.getColumnCount();
            
            String[] colNames = new String[colCount];
            for (int i = 0; i < colCount; i++) {
                colNames[i] = rsm.getColumnName(i + 1);
            }
            
            List<String[]> data = new ArrayList<>();
            data.add(colNames);
            
            while (rs.next()) {
                String[] rowData = new String[colCount];
                for (int i = 0; i < colCount; i++) {
                    rowData[i] = rs.getString(colNames[i]);
                }
                data.add(rowData);
            }
            
            return data;
        } catch (Exception e) { }
        
        return null;
    }
}
