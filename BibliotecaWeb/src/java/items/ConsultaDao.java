/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package items;

/**
 *
 * @author Mario
 */

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.List;
import java.util.ArrayList;

import database.Conexion;

public class ConsultaDao {
    public static List<String[]> dataCategoria(String category) {
        try {
            String consulta = "SELECT * FROM " + category + "_consulta;";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
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
    
    public static List<String[]> prestamosCategoria(String category, String usuario) {
        try {
            String consulta;
            if (usuario.isEmpty()) {
                consulta = "SELECT * FROM " + category + "_prestamos WHERE Activo = 'SI';";
            } else {
                consulta = "SELECT * FROM " + category + "_prestamos WHERE Activo = 'SI' AND Usuario = '" + usuario + "';";
            }
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
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
    
    public static String[] idsCategoria(String category) {
        try {
            String consulta = "SELECT id FROM " + category.toString() + ";";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
            ResultSet rs = ps.executeQuery();
            List<String> ids = new ArrayList<>();
            while (rs.next()) {
                ids.add(rs.getString("id"));
            }
            String[] toReturn = new String[ids.size()];
            toReturn = ids.toArray(toReturn);
            return toReturn;
        } catch (Exception e) { }
        
        return null;
    }
    
    public static String[] librosDescriptiveStr(String id) {
        try {
            String consulta = "SELECT "
                    + "CONCAT(A.titulo, ' | ', A.autor, ' | ', A.editorial) AS 'descripcion', "
                    + "IF(P.activos IS NULL OR A.unidades > P.activos, 'Si', 'No') AS 'disponibilidad' "
                    + "FROM libros AS A "
                    + "LEFT JOIN ( "
                        + "SELECT item_id, COUNT(*) AS activos "
                        + "FROM prestamos_libros "
                        + "WHERE fecha_devuelto IS NULL "
                        + "GROUP BY item_id "
                    + ") AS P ON P.item_id = A.id "
                    + "WHERE A.id = ?;";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new String[] { rs.getString("descripcion"), rs.getString("disponibilidad") };
            }
        } catch (Exception e) { }
        
        return null;
    }
    
    public static String[] obrasDescriptiveStr(String id) {
        try {
            String consulta = "SELECT "
                    + "CONCAT(A.titulo, ' | ', A.autor, ' | ', A.editorial) AS 'descripcion', "
                    + "IF(P.activos IS NULL OR A.unidades > P.activos, 'Si', 'No') AS 'disponibilidad' "
                    + "FROM obras AS A "
                    + "LEFT JOIN ( "
                        + "SELECT item_id, COUNT(*) AS activos "
                        + "FROM prestamos_obras "
                        + "WHERE fecha_devuelto IS NULL "
                        + "GROUP BY item_id "
                    + ") AS P ON P.item_id = A.id "
                    + "WHERE A.id = ?;";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new String[] { rs.getString("descripcion"), rs.getString("disponibilidad") };
            }
        } catch (Exception e) { }
        
        return null;
    }
    
    public static String[] revistasDescriptiveStr(String id) {
        try {
            String consulta = "SELECT "
                    + "CONCAT(A.titulo, ' | ', A.editorial) AS 'descripcion', "
                    + "IF(P.activos IS NULL OR A.unidades > P.activos, 'Si', 'No') AS 'disponibilidad' "
                    + "FROM revistas AS A "
                    + "LEFT JOIN ( "
                        + "SELECT item_id, COUNT(*) AS activos "
                        + "FROM prestamos_revistas "
                        + "WHERE fecha_devuelto IS NULL "
                        + "GROUP BY item_id "
                    + ") AS P ON P.item_id = A.id "
                    + "WHERE A.id = ?;";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new String[] { rs.getString("descripcion"), rs.getString("disponibilidad") };
            }
        } catch (Exception e) { }
        
        return null;
    }
    
    public static String[] cdsDescriptiveStr(String id) {
        try {
            String consulta = "SELECT "
                    + "CONCAT(A.titulo, ' | ', A.autor, ' | ', A.genero) AS 'descripcion', "
                    + "IF(P.activos IS NULL OR A.unidades > P.activos, 'Si', 'No') AS 'disponibilidad' "
                    + "FROM cds AS A "
                    + "LEFT JOIN ( "
                        + "SELECT item_id, COUNT(*) AS activos "
                        + "FROM prestamos_cds "
                        + "WHERE fecha_devuelto IS NULL "
                        + "GROUP BY item_id "
                    + ") AS P ON P.item_id = A.id "
                    + "WHERE A.id = ?;";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new String[] { rs.getString("descripcion"), rs.getString("disponibilidad") };
            }
        } catch (Exception e) { }
        
        return null;
    }
    
    public static String[] tesisDescriptiveStr(String id) {
        try {
            String consulta = "SELECT "
                    + "CONCAT(A.titulo, ' | ', A.fecha_publicacion, ' | ', A.institucion, ' | ', A.facultad) AS 'descripcion', "
                    + "IF(P.activos IS NULL OR A.unidades > P.activos, 'Si', 'No') AS 'disponibilidad' "
                    + "FROM tesis AS A "
                    + "LEFT JOIN ( "
                        + "SELECT item_id, COUNT(*) AS activos "
                        + "FROM prestamos_tesis "
                        + "WHERE fecha_devuelto IS NULL "
                        + "GROUP BY item_id "
                    + ") AS P ON P.item_id = A.id "
                    + "WHERE A.id = ?;";
            PreparedStatement ps = Conexion.establecerConexion().prepareStatement(consulta);
            ps.setInt(1, Integer.parseInt(id));
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return new String[] { rs.getString("descripcion"), rs.getString("disponibilidad") };
            }
        } catch (Exception e) { }
        
        return null;
    }
}
