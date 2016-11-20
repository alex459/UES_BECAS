<%-- 
    Document   : menu
    Created on : 10-17-2016, 06:49:53 AM
    Author     : next
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <%@page import="MODEL.variablesDeSesion"%>
        <%
            response.setHeader("Cache-Control", "no-store");
            response.setHeader("Cache-Control", "must-revalidate");
            response.setHeader("Cache-Control", "no-cache");
            HttpSession actual = request.getSession();
            String r = (String) actual.getAttribute("rol");
            String u = (String) actual.getAttribute("user");           
            Integer t = (Integer) actual.getAttribute("id_tipo_usuario");
            if (u == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            
            Integer id_candidato = 1;
            Integer id_becario = 2;
            Integer id_comision = 3;
            Integer id_junta = 4;
            Integer id_csu = 5;
            Integer id_fiscalia = 6;
            Integer id_colaborador_consejo = 7;
            Integer id_director_consejo = 8;
            Integer id_admin = 9;
            Integer id_inactivo = 10;
            

        %>    
            
    <nav class="navbar navbar-custom" role="navigation">
        
        
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            
            <%                                
                
                //menu administracion                
                if(t==id_colaborador_consejo || t==id_director_consejo || t==id_admin){
                    out.write("<ul class='nav navbar-nav'>");
                    out.write("<li class='dropdown'>");
                    out.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Administración<strong class='caret'></strong></a>");
                    out.write("<ul class='dropdown-menu'>");
                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#' >===Administración de usuarios===</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='101_agregar_usuario.jsp'>Agregar usuario</a></li>");                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='112_consulta_para_actualizar_usuario.jsp'>Actualizar usuarios</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='103_consultar_usuario.jsp'>Consultar usuarios</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='113_consulta_para_dar_de_baja_usuario.jsp'>Dar de baja usuarios</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='114_consulta_para_modificar_roles.jsp'>Modificar roles</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='106_bitacora.jsp'>Bitacora</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Administración de becas===</a></li>");                    
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='107_agregar_oferta_de_beca.jsp'>Agregar oferta de beca</a></li>");
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='108_modificar_oferta_de_beca.jsp'>Modificar oferta de beca</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='109_consultar_oferta_de_beca.jsp'>Consultar oferta de beca</a></li>");
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='111_reporte_de_beca.jsp'>Reporte de oferta de becas</a></li>");
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Administración de becarios===</a></li>");
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='201_consultar_expediente.jsp'>Consultar expediente</a></li>");
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='202_modificar_estado_de_becario.jsp'>Modificar estado de becario</a></li>");
                    if(t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='203_suspender_becario.jsp'>Suspender becario</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Administración de instituciones===</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='204_agregar_institucion.jsp'>Agregar institución</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='205_modificar_institucion.jsp'>Modificar institución</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='206_consultar_institucion.jsp'>Consultar institución</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='207_eliminar_institucion.jsp'>Eliminar institución</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Administración de documentos===</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='208_agregar_documento.jsp'>Agregar documento</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='209_modificar_documento.jsp'>Modificar documento</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='210_consultar_documento.jsp'>Consultar documento</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='211_eliminar_documento.jsp'>Eliminar documento</a></li>");                    
                    
                    out.write("</ul>");
                    out.write("</li>");
                    out.write("</ul>");
                }
                

                //menu informacion_publica (basicamente todos pueden)
                if(true){
                    out.write("<ul class='nav navbar-nav'>");
                    out.write("<li class='dropdown'>");
                    out.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Información pública<strong class='caret'></strong></a>");
                    out.write("<ul class='dropdown-menu'>");
                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Ofertas de becas</a></li>");                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Documentos</a></li>");                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Acerca de</a></li>");                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Ofertas de becas</a></li>");                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Login/Logout</a></li>");                    
                    
                    out.write("</ul>");
                    out.write("</li>");
                    out.write("</ul>");
                }
                
                //menu de candidatos. todos menos el becarios
                if(t==id_candidato || t==id_comision || t==id_csu || t==id_fiscalia || t==id_director_consejo || t==id_admin){                                                            
                    out.write("<ul class='nav navbar-nav'>");
                    out.write("<li class='dropdown'>");
                    out.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Candidatos<strong class='caret'></strong></a>");
                    out.write("<ul class='dropdown-menu'>");
                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Ofertas de becas</a></li>");                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Estado de solicitudes</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Estado de proceso de beca</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitud de Permiso Inicial</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitud de autorizacion inicial</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitud de dictamen de propuesta</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitud de beca</a></li>");
                    
                    out.write("</ul>");
                    out.write("</li>");
                    out.write("</ul>");
                }
                
                //menu de Becarios
                if(t==id_becario || t==id_director_consejo || t==id_admin){                                                            
                    out.write("<ul class='nav navbar-nav'>");
                    out.write("<li class='dropdown'>");
                    out.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Becarios<strong class='caret'></strong></a>");
                    out.write("<ul class='dropdown-menu'>");
                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitud acuerdo de año fiscal</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitud prorroga</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Agregar documentos de finalizacion de beca</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitar inicio de servicio contractual</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitar acuerdo de gestion de compromiso contractual</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitar Acuerdo de gestion de liberacion</a></li>");
                    
                    out.write("</ul>");
                    out.write("</li>");
                    out.write("</ul>");
                }
                
                //menu de Solicitudes y acuerdos
                if(t==id_comision || t==id_junta || t==id_csu || t==id_fiscalia || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin){                                                            
                    out.write("<ul class='nav navbar-nav'>");
                    out.write("<li class='dropdown'>");
                    out.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Solicitudes y acuerdos<strong class='caret'></strong></a>");
                    out.write("<ul class='dropdown-menu'>");
                    
                    if(t==id_comision || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Comision de Becas===</a></li>");
                    if(t==id_comision || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitudes de dictamenes pendientes</a></li>");
                    if(t==id_comision || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Resolver solicitudes de dictamenes pendientes</a></li>");
                    if(t==id_comision || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Buscar dictamenes emitidos</a></li>");
                    if(t==id_junta || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Junta Directiva===</a></li>");
                    if(t==id_junta || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitudes de acuerdos pendientes</a></li>");
                    if(t==id_junta || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Resolver solicitudes de acuerdos</a></li>");
                    if(t==id_junta || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Buscar acuerdos emitidos</a></li>");
                    if(t==id_csu || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Consejo Superior Universitario===</a></li>");
                    if(t==id_csu || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitudes de acuerdos pendientes</a></li>");
                    if(t==id_csu || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitudes de acuerdos pendientes</a></li>");
                    if(t==id_csu || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Resolver solicitudes de acuerdos</a></li>");
                    if(t==id_csu || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Buscar acuerdos emitidos</a></li>");
                    if(t==id_fiscalia || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>===Fiscalia===</a></li>");
                    if(t==id_fiscalia || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitudes de asesorias de contrato de beca</a></li>");
                    if(t==id_fiscalia || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Resolver solicitudes de asesoria de contrato de beca</a></li>");
                    if(t==id_fiscalia || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Buscar contrato de beca</a></li>");
                    if(t==id_fiscalia || t==id_colaborador_consejo || t==id_director_consejo || t==id_admin)out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Buscar acta de reintegro de beca</a></li>");                    
                    
                    out.write("</ul>");
                    out.write("</li>");
                    out.write("</ul>");
                }
                
                //menu de consejo de becas
                if(t==id_colaborador_consejo || t==id_director_consejo || t==id_admin){                                                            
                    out.write("<ul class='nav navbar-nav'>");
                    out.write("<li class='dropdown'>");
                    out.write("<a href='#' class='dropdown-toggle' data-toggle='dropdown'>Consejo de Becas<strong class='caret'></strong></a>");
                    out.write("<ul class='dropdown-menu'>");
                    
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Solicitudes de acuerdos pendientes</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Resolver solicitud de acuerdo pendiente</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Buscar acuerdo</a></li>");
                    out.write("<li><a style='background-color: #cf2a27; color:white' href='#'>Reportes</a></li>");
                    
                    out.write("</ul>");
                    out.write("</li>");
                    out.write("</ul>");
                }
 

            %>
            
            <!--
            <ul class="nav navbar-nav">                                
                <li class="dropdown">                    
                        
                    <ul class="dropdown-menu">                                                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#" >===Administración de usuarios===</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="101_agregar_usuario.jsp">Agregar usuario</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="112_consulta_para_actualizar_usuario.jsp">Actualizar usuarios</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="103_consultar_usuario.jsp">Consultar usuarios</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="113_consulta_para_dar_de_baja_usuario.jsp">Dar de baja usuarios</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="114_consulta_para_modificar_roles.jsp">Modificar roles</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="106_bitacora.jsp">Bitacora</a>
                        </li> 
                                                
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Administración de becas===</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="107_agregar_oferta_de_beca.jsp">Agregar oferta de beca</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="108_modificar_oferta_de_beca.jsp">Modificar oferta de beca</a>
                        </li> 
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="109_consultar_oferta_de_beca.jsp">Consultar oferta de beca</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="110_eliminar_oferta_de_beca.jsp">Eliminar oferta de beca</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="111_reporte_de_beca.jsp">Reporte de oferta de becas</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Administración de becarios===</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="201_consultar_expediente.jsp">Consultar expediente</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="202_modificar_estado_de_becario.jsp">Modificar estado de becario</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="203_suspender_becario.jsp">Suspender becario</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Administración de instituciones===</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="204_agregar_institucion.jsp">Agregar institución</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="205_modificar_institucion.jsp">Modificar institución</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="206_consultar_institucion.jsp">Consultar institución</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="207_eliminar_institucion.jsp">Eliminar institución</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Administración de documentos===</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="208_agregar_documento.jsp">Agregar documento</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="209_modificar_documento.jsp">Modificar documento</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="210_consultar_documento.jsp">Consultar documento</a>
                        </li>
                        
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="211_eliminar_documento.jsp">Eliminar documento</a>
                        </li>
                        
                    </ul>
                </li>
            </ul>
            
              

            <ul class="nav navbar-nav">
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Información pública<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Ofertas de becas</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Documentos</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Acerca de</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Login/Logout</a>
                        </li>
                    </ul>
                </li>
            </ul>

            
            
            <ul class="nav navbar-nav">
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Candidatos<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Ofertas de becas</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Estado de solicitudes</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Estado de proceso de beca</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitud de Permiso Inicial</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitud de autorizacion inicial</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitud de dictamen de propuesta</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitud de beca</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav">
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Becarios<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitud acuerdo de año fiscal</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitud prorroga</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Agregar documentos de finalizacion de beca</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitar inicio de servicio contractual</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitar acuerdo de gestion de compromiso contractual</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitar Acuerdo de gestion de liberacion</a>
                        </li>                                   
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav">
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Solicitudes y acuerdos<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Comision de Becas===</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitudes de dictamenes pendientes</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Resolver solicitudes de dictamenes pendientes</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Buscar dictamenes emitidos</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Junta Directiva===</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitudes de acuerdos pendientes</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Resolver solicitudes de acuerdos</a>
                        </li>                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Buscar acuerdos emitidos</a>
                        </li>                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Consejo Superior Universitario===</a>
                        </li>                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitudes de acuerdos pendientes</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Resolver solicitudes de acuerdos</a>
                        </li>                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Buscar acuerdos emitidos</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">===Fiscalia===</a>
                        </li>                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitudes de asesorias de contrato de beca</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Resolver solicitudes de asesoria de contrato de beca</a>
                        </li>                                    
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitudes de reintegracion de beca</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Buscar contrato de beca</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Buscar acta de reintegro de beca</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav">
                </li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">Consejo de Becas<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Solicitudes de acuerdos pendientes</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Resolver solicitud de acuerdo pendiente</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Buscar acuerdo</a>
                        </li>
                        <li>
                            <a style='background-color: #cf2a27; color:white' href="#">Reportes</a>
                        </li>                                    
                    </ul>
                </li>
            </ul>

            -->
            
            <ul class="nav navbar-nav navbar-right">						
                <li>
                    <a href="logout.jsp">Salir</a>
                </li>                            
            </ul>
            
            
            
        </div>
    </nav>


</head>

</html>
