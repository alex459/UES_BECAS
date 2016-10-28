package DAO;

import MODEL.variablesDeSesion;
import POJO.TipoUsuario;
import POJO.Usuario;
import java.sql.ResultSet;

public class UsuarioDAO extends ConexionBD {

    //consultar por id
    public Usuario consultarPorId(int id) {
        Usuario usuario = new Usuario();
        this.abrirConexion();
        try {
            stmt = conn.createStatement();
            String sql = "SELECT ID_USUARIO, ID_TIPO_USUARIO, NOMBRE_USUARIO, CLAVE FROM usuario where ID_USUARIO = " + id;
            ResultSet rs = stmt.executeQuery(sql);
            this.cerrarConexion();

            while (rs.next()) {

                int ID_USUARIO = rs.getInt("ID_USUARIO");
                int ID_TIPO_USUARIO = rs.getInt("ID_TIPO_USUARIO");
                String NOMBRE_USUARIO = rs.getString("NOMBRE_USUARIO");
                String CLAVE = rs.getString("CLAVE");

                usuario.setIdUsuario(ID_USUARIO);
                usuario.setIdTipoUsuario(ID_TIPO_USUARIO);
                usuario.setNombreUsuario(NOMBRE_USUARIO);
                usuario.setClave(CLAVE);
            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return usuario;
    }
    
    //obtener el siguiente id (autoincremental)
    public Integer getSiguienteId() {
        Integer siguienteId = -1;
        this.abrirConexion();
        try {
            stmt = conn.createStatement();
            String sql = "SELECT MAX(ID_USUARIO) AS ID_USUARIO FROM USUARIO";
            ResultSet rs = stmt.executeQuery(sql);
            this.cerrarConexion();

            while (rs.next()) {
                siguienteId = rs.getInt("ID_USUARIO") + 1;                
            }

        } catch (Exception e) {
            System.out.println("Error " + e);
        }

        return siguienteId;
    }
    
    public boolean ingresar(Usuario usuario){
        boolean exito = false;
        
        this.abrirConexion();
        try {
            stmt = conn.createStatement();
            String sql = "INSERT INTO USUARIO(ID_USUARIO, ID_TIPO_USUARIO, NOMBRE_USUARIO, CLAVE) VALUES("+usuario.getIdUsuario()+", "+usuario.getIdTipoUsuario()+", '"+usuario.getNombreUsuario()+"', '"+usuario.getClave()+"')";
            stmt.execute(sql);
            exito = true;
            this.cerrarConexion();
        }catch (Exception e) {
            System.out.println("Error " + e);
        }finally{
            this.cerrarConexion();
        }
        return exito;
    }
    

    public boolean login(String nombre, String clave) {
        boolean logeo = false;
        Usuario usuario = new Usuario();
        TipoUsuario tipoUsuario = new TipoUsuario();
        this.abrirConexion();
        try {
            stmt = conn.createStatement();
            String sql = "SELECT ID_USUARIO, ID_TIPO_USUARIO, NOMBRE_USUARIO, CLAVE FROM usuario where NOMBRE_USUARIO = '" + nombre + "' AND CLAVE='" + clave + "'";
            ResultSet rs = stmt.executeQuery(sql);
            this.cerrarConexion();
            while (rs.next()) {

                int ID_USUARIO = rs.getInt("ID_USUARIO");
                int ID_TIPO_USUARIO = rs.getInt("ID_TIPO_USUARIO");
                String NOMBRE_USUARIO = rs.getString("NOMBRE_USUARIO");
                String CLAVE = rs.getString("CLAVE");

                usuario.setIdUsuario(ID_USUARIO);
                usuario.setIdTipoUsuario(ID_TIPO_USUARIO);
                usuario.setNombreUsuario(NOMBRE_USUARIO);
                usuario.setClave(CLAVE);
                logeo = true;

            }

            if (logeo) {

                this.abrirConexion();
                stmt = conn.createStatement();
                sql = "SELECT ID_TIPO_USUARIO, TIPO_USUARIO, DESCRIPCION_TIPO_USUARIO FROM TIPO_USUARIO where ID_TIPO_USUARIO = " + usuario.getIdTipoUsuario();
                rs = stmt.executeQuery(sql);
                this.cerrarConexion();

                while (rs.next()) {

                    int ID_TIPO_USUARIO = rs.getInt("ID_TIPO_USUARIO");
                    String TIPO_USUARIO = rs.getString("TIPO_USUARIO");
                    String DESCRIPCION_TIPO_USUARIO = rs.getString("DESCRIPCION_TIPO_USUARIO");

                    tipoUsuario.setIdTipoUsuario(ID_TIPO_USUARIO);
                    tipoUsuario.setTipoUsuario(TIPO_USUARIO);
                    tipoUsuario.setDescripcionTipoUsuario(DESCRIPCION_TIPO_USUARIO);
                }

                variablesDeSesion.usuarioActual.setIdUsuario(usuario.getIdUsuario());
                variablesDeSesion.usuarioActual.setNombreUsuario(usuario.getNombreUsuario());
                variablesDeSesion.usuarioActual.setClave(usuario.getClave());
                variablesDeSesion.usuarioActual.setIdTipoUsuario(usuario.getIdTipoUsuario());
                
                variablesDeSesion.tipoUsuarioActual.setIdTipoUsuario(tipoUsuario.getIdTipoUsuario());
                variablesDeSesion.tipoUsuarioActual.setTipoUsuario(tipoUsuario.getTipoUsuario());
                variablesDeSesion.tipoUsuarioActual.setDescripcionTipoUsuario(tipoUsuario.getDescripcionTipoUsuario());
            }

        } catch (Exception e) {
            System.out.println("Error : " + e);
        }
        return logeo;
    }

}