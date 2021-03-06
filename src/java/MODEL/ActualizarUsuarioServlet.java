/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import DAO.DetalleUsuarioDAO;
import DAO.ExpedienteDAO;
import DAO.FacultadDAO;
import DAO.TipoUsuarioDao;
import DAO.UsuarioDAO;
import POJO.DetalleUsuario;
import POJO.Facultad;
import POJO.TipoUsuario;
import POJO.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author next
 */
@WebServlet("/ActualizarUsuarioServlet")
public class ActualizarUsuarioServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8"); //lineas importantes para leer tildes y ñ
        request.setCharacterEncoding("UTF-8"); //lineas importantes para leer tildes y ñ
        
        Usuario usuarioActualizado = new Usuario();
        DetalleUsuario detalleUsuarioActualizado = new DetalleUsuario();
        UsuarioDAO usuarioDao = new UsuarioDAO();
        DetalleUsuarioDAO detalleUsuarioDao = new DetalleUsuarioDAO();
        String clave2 = new String();
        
        boolean bandera1 = false;
        boolean bandera2 = false;
        
        boolean validacion1 = false; //no se puede actualizar candidatos ni becarios con procesos activos de becas
        boolean validacion2 = false; //claves iguales
        boolean validacion3 = false; //tipo usuario con facultad
        boolean validacion4 = false; //evitar autoactualizacion
        String mensaje = new String();
        
        //parte de lectura desde el jsp y guardado en bd     
        try{
        usuarioActualizado.setIdUsuario(Integer.parseInt(request.getParameter("ID_USUARIO")));
        usuarioActualizado.setIdTipoUsuario(Integer.parseInt(request.getParameter("ID_TIPO_USUARIO")));
        usuarioActualizado.setNombreUsuario(request.getParameter("CARNET"));
        usuarioActualizado.setClave(request.getParameter("CLAVE"));
        clave2 = request.getParameter("CLAVE2");
        
        detalleUsuarioActualizado.setIdDetalleUsuario(Integer.parseInt(request.getParameter("ID_DETALLE_USUARIO")));
        detalleUsuarioActualizado.setIdUsuario(Integer.parseInt(request.getParameter("ID_USUARIO")));
        detalleUsuarioActualizado.setIdFacultad(Integer.parseInt(request.getParameter("ID_FACULTAD")));
        detalleUsuarioActualizado.setCarnet(request.getParameter("CARNET"));
        detalleUsuarioActualizado.setNombre1Du(request.getParameter("NOMBRE1_DU"));
        detalleUsuarioActualizado.setNombre2Du(request.getParameter("NOMBRE2_DU"));
        detalleUsuarioActualizado.setApellido1Du(request.getParameter("APELLIDO1_DU"));
        detalleUsuarioActualizado.setApellido2Du(request.getParameter("APELLIDO2_DU"));
        detalleUsuarioActualizado.setEmail(request.getParameter("EMAIL"));
        detalleUsuarioActualizado.setGenero(request.getParameter("GENERO"));
        }catch(Exception e){
            e.printStackTrace();
            Utilidades.mostrarMensaje(response, 2, "Error", "No se pudo actualizar el usuario. Ingrese una facultad " + mensaje);
        }
        
        //validacion 1 //que sea un becario o candidato que tiene un proceso de beca
        Usuario usuarioAnterior = new Usuario();
        DetalleUsuario detalleUsuarioAnterior = new DetalleUsuario();
        usuarioAnterior = usuarioDao.consultarPorId(usuarioActualizado.getIdUsuario());
        detalleUsuarioAnterior = detalleUsuarioDao.consultarPorId(detalleUsuarioActualizado.getIdDetalleUsuario());
        if(usuarioAnterior.getIdTipoUsuario() != usuarioActualizado.getIdTipoUsuario()){
            if(usuarioAnterior.getIdTipoUsuario() == 1 || usuarioAnterior.getIdTipoUsuario() == 2){
                ExpedienteDAO expedienteDao = new ExpedienteDAO();
                if(expedienteDao.expedienteAbiertoPorIdUsuario(usuarioAnterior.getIdUsuario())){
                    mensaje = mensaje.concat("No se puede actualizar el tipo del usuario si tiene un proceso de beca en curso.");
                    validacion1 = false;
                }else{
                    validacion1 = true;
                }
            }else{
                validacion1 = true;
            }
        }else{
            validacion1 = true;
        }
        
        //validacion 2
        if (clave2.equals(usuarioActualizado.getClave())) {
            validacion2 = true;
        } else {
            mensaje = mensaje.concat("  Las claves no coniciden. ");
        }
        
        //validacion 3
        Integer t_u = usuarioActualizado.getIdTipoUsuario();
        Integer fac = detalleUsuarioActualizado.getIdFacultad();
        if(t_u==1 || t_u==2 || t_u==3 || t_u==4){
            if(fac == 13){
                mensaje = mensaje.concat("  Los candidatos, becarios, comisiones o juntas directivas deben tener una facultad que no sea Administrativa.");
            }else{
                validacion3 = true;
            }
        }else{            
                validacion3 = true;
                detalleUsuarioActualizado.setIdFacultad(13);            
        }
        
        //validacion 4
        if(request.getSession().getAttribute("user").equals(usuarioAnterior.getNombreUsuario())){
            mensaje = mensaje.concat("No se puede actualizar su usuario mientras se encuentra logeado.");
            validacion4 = false;
        }else{
            validacion4 = true;
        }
        
        if (validacion1 && validacion2 && validacion3 && validacion4) {
            int id_user_login = Integer.parseInt(request.getSession().getAttribute("id_user_login").toString());
            
            bandera1 = usuarioDao.actualizar(usuarioActualizado); //guardando usuario
            bandera2 = detalleUsuarioDao.actualizarOpcion2(detalleUsuarioActualizado); //guardando detalle usuario            
            
            
            //Redireccionando a la pagina de mensaje general    
            if (bandera1 && bandera2) {
            TipoUsuario tipoUsuario = new TipoUsuario();
            TipoUsuarioDao tipoUsuarioDao = new TipoUsuarioDao();
            tipoUsuario = tipoUsuarioDao.consultarPorId(usuarioActualizado.getIdTipoUsuario());
            Utilidades.nuevaBitacora(2, Integer.parseInt(request.getSession().getAttribute("id_user_login").toString()) , "Se actualizo el usuario "+usuarioActualizado.getNombreUsuario() +".",""); 
            Utilidades.mostrarMensaje(response, 1, "Exito", "Se actualizó el usuario correctamente.");
            } else {
                Utilidades.mostrarMensaje(response, 2, "Error", "No se pudo actualizar el usuario.");
                usuarioDao.actualizar(usuarioAnterior);
                detalleUsuarioDao.actualizarOpcion2(detalleUsuarioAnterior);
            }

        }else{
            Utilidades.mostrarMensaje(response, 2, "Error", "No se pudo actualizar el usuario. " + mensaje);
        }
        
            
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
