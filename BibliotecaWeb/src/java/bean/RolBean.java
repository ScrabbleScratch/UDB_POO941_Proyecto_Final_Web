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
public class RolBean {
    private String id, nombre, descripcion, prestamos, dias, mora;
    
    public String getId() {
        return this.id;
    }
    
    public void setId(String id) {
        this.id = id;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String getPrestamos() {
        return prestamos;
    }

    public void setPrestamos(String prestamos) {
        this.prestamos = prestamos;
    }
    
    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
    public String getDias() {
        return this.dias;
    }
    
    public void setDias(String dias) {
        this.dias = dias;
    }
    
    public String getMora() {
        return mora;
    }

    public void setMora(String mora) {
        this.mora = mora;
    }
}
