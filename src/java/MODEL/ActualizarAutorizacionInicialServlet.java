/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package MODEL;

import DAO.DocumentoDAO;
import DAO.ExpedienteDAO;
import DAO.TipoDocumentoDAO;
import POJO.Documento;
import POJO.Expediente;
import POJO.TipoDocumento;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 *
 * @author MauricioBC
 */
@WebServlet("/ActualizarAutorizacionInicialServlet")
@MultipartConfig(maxFileSize = 16177215)
public class ActualizarAutorizacionInicialServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       response.setContentType("text/html;charset=UTF-8");
        try {
            //Recuperando datos del formulario
            int idExpediente = Integer.parseInt(request.getParameter("idExpediente"));
            String accCarta = request.getParameter("accCarta");
            String accCartaEscuela = request.getParameter("accCartaEscuela");
            String accCartaInstitucion = request.getParameter("accCartaInstitucion");
            String accDui = request.getParameter("accDui");
            String accNombramiento = request.getParameter("accNombramiento");
            String accCartaJefe = request.getParameter("accCartaJefe");
            String accConstanciaExpediente = request.getParameter("accConstanciaExpediente");
            String accConstanciaMedica = request.getParameter("accConstanciaMedica");

            int id_documento = 0;
            Date fechaHoy = new Date();
            java.sql.Date sqlDate = new java.sql.Date(fechaHoy.getTime());
            int idDoc = 0;
            String obs = "";
            int tip=0;

            InputStream archivo = null;
            Part filePart = null;

            DocumentoDAO documentoDao = new DocumentoDAO();
            Documento documento = new Documento();
            TipoDocumento tipo = new TipoDocumento();
            TipoDocumentoDAO tipoDao = new TipoDocumentoDAO();
            ExpedienteDAO expDao = new ExpedienteDAO();
            Expediente expediente = new Expediente();
            
            expediente = expDao.consultarPorId(idExpediente);

            //Carta de Solicitud del candidato
            switch (accCarta) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 104);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("cartaSolicitud");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 104);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "CARTA DE SOLICITUD DEL expediente " + idExpediente;
                        tip= 104;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            
            //Titulo de la UES
            switch (accCartaEscuela) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 124);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("cartaEscuela");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 124);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 124;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            
            //Certificación de Notas
            switch (accCartaInstitucion) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 128);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("CartaInstitucion");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 128);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 128;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            //DUI
            switch (accDui) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 126);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("Dui");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 126);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 126;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            //Tipo Nombramiento
            switch (accNombramiento) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 161);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("Nombramiento");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 161);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 161;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            //Carta Jefe Escuela o Departamento
            switch (accCartaJefe) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 123);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("CartaJefe");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 123);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 123;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            //Constancia que refleje que no tiene pendiente Expediente disciplinario abierto
            switch (accConstanciaExpediente) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 160);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("ConstanciaExpediente");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 160);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 160;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            //Constancia médica extendida por Bienestar Universitario
            switch (accConstanciaMedica) {
                case "ninguna":
                    //No hacer nada
                    break;
                case "eliminar":
                    //Obteniendo el id del documento
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 129);
                    if (id_documento != 0) {
                        //eliminar
                        documentoDao.eliminarDocumento(id_documento);
                    } else {
                        //nada
                    }
                    break;
                case "actualizar":
                    //Actualizar Documento
                    //Obteniendo el id del documento y el documento                    
                    filePart = request.getPart("ConstanciaMedica");
                    if (filePart != null) {
                        archivo = filePart.getInputStream();
                    }
                    id_documento = documentoDao.ExisteDocumento(idExpediente, 129);
                    if (id_documento != 0) {
                        //Actualizar
                        documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                        documento.setDocumentoDigital(archivo);
                        documento.setFechaIngreso(sqlDate);
                        documentoDao.ActualizarDocDig(documento);
                    } else {
                        //Agregar
                        idDoc = documentoDao.getSiguienteId();
                        obs = "DOCUMENTO ADJUNTO DEL expediente " + idExpediente;
                        tip= 129;
                        tipo = tipoDao.consultarPorId(tip);

                        documento.setIdDocumento(idDoc);
                        documento.setIdTipoDocumento(tipo);
                        documento.setDocumentoDigital(archivo);
                        documento.setIdExpediente(expediente);
                        documento.setObservacion(obs);
                        documento.setEstadoDocumento("INGRESADO");
                        documentoDao.Ingresar(documento);
                    }
                    break;
                default:
                    break;
            }
            
            if(accCarta.equals("ninguna") && accCartaEscuela.equals("ninguna") && accCartaInstitucion.equals("ninguna") && accDui.equals("ninguna") && accNombramiento.equals("ninguna") && accCartaJefe.equals("ninguna") && accConstanciaExpediente.equals("ninguna") && accConstanciaMedica.equals("ninguna")){
                //no se realizo ninguna accion, Conservar estado y progreso 
            } else{
                //CAMBIAR DOCUMENTO,PROGRESO Y ESTADO A PENDIENTE
                id_documento = documentoDao.ExisteDocumento(idExpediente, 105);
                documento = documentoDao.obtenerInformacionDocumentoPorId(id_documento);
                documento.setEstadoDocumento("PENDIENTE");
                documentoDao.ActualizarEstadoDocumento(documento);
                
                expediente.setIdProgreso(2);
                expediente.setEstadoProgreso("EN PROCESO");
                expDao.actualizarExpediente(expediente);
            }
            
            Utilidades.mostrarMensaje(response, 1, "Exito", "Se Actualizo correctamente la Solicitud.");

        } catch (Exception e) {
            Utilidades.mostrarMensaje(response, 2, "Error", "No se pudo Actualizar la Solicitud.");
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
