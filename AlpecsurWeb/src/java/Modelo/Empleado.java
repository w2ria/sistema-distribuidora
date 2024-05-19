/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Modelo;

/**
 *
 * @author user
 */
public class Empleado {

    private int idEmpleado;
    private int idUsuario;
    private String nombre;
    private String tipoDocumento;
    private String numDocumento;
    private String direccion;
    private String telefono;
    private String email;
    private String estado;

    // Constructor vacío
    public Empleado() {
    }

    // Constructor con todos los parámetros
    public Empleado(int idEmpleado, int idUsuario, String nombre, String tipoDocumento, String numDocumento, String direccion, String telefono, String email, String estado) {
        this.idEmpleado = idEmpleado;
        this.idUsuario = idUsuario;
        this.nombre = nombre;
        this.tipoDocumento = tipoDocumento;
        this.numDocumento = numDocumento;
        this.direccion = direccion;
        this.telefono = telefono;
        this.email = email;
        this.estado = estado;
    }

    // Getters y Setters
    public int getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(int idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public String getNumDocumento() {
        return numDocumento;
    }

    public void setNumDocumento(String numDocumento) {
        this.numDocumento = numDocumento;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Empleado{"
                + "idEmpleado=" + idEmpleado
                + ", idUsuario=" + idUsuario
                + ", nombre='" + nombre + '\''
                + ", tipoDocumento='" + tipoDocumento + '\''
                + ", numDocumento='" + numDocumento + '\''
                + ", direccion='" + direccion + '\''
                + ", telefono='" + telefono + '\''
                + ", email='" + email + '\''
                + ", estado='" + estado + '\''
                + '}';
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }

        Empleado empleado = (Empleado) o;

        return idEmpleado == empleado.idEmpleado;
    }

    @Override
    public int hashCode() {
        return idEmpleado;
    }
}
