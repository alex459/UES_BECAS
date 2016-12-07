<%-- 
    Document   : 801_agregar_documeto_finalizaciom_beca
    Created on : 12-04-2016, 07:03:26 AM
    Author     : Manuel Miranda
--%>

<%@page import="POJO.Expediente"%>
<%@page import="DAO.ExpedienteDAO"%>
<%@page import="MODEL.variablesDeSesion"%>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Cache-Control", "must-revalidate");
    response.setHeader("Cache-Control", "no-cache");
    HttpSession actual = request.getSession();
    String rol=(String)actual.getAttribute("rol");
    String user=(String)actual.getAttribute("user");
     if(user==null){
     response.sendRedirect("login.jsp");
        return;
     }
     
     boolean expedienteAbierto = false;
     try{
        // Comprobando si tiene un proceso de beca abierto
        ExpedienteDAO expDao = new ExpedienteDAO();
        expedienteAbierto = expDao.expedienteAbierto(user);
    } catch (Exception e){
        e.printStackTrace();
    }
    //Si no ha iniciado un proceso de beca lo reenvia a la pagina de las ofertas
    if(expedienteAbierto == false){
        response.sendRedirect("301_inf_publica_ofertas_beca.jsp");
        return;
    }
    
    //obtener el expediente
    ExpedienteDAO expDao = new ExpedienteDAO();
    Expediente expediente = expDao.obtenerExpedienteAbierto(user);
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Sistema informático para la administración de becas de postgrado</title>

        <meta name="description" content="Source code generated using layoutit.com">
        <meta name="author" content="LayoutIt!">

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style.css" rel="stylesheet">
        <link href="css/customfieldset.css" rel="stylesheet">
        <div class="row">
            <div class="col-md-4">
                <img alt="Bootstrap Image Preview" src="img/logo.jpg" align="middle"  class="img-responsive center-block">
                <h3 class="text-center" >
                    <p class="text-danger">Universidad De El Salvador</p>
                </h3>
            </div>
            <div class="col-md-8">
                <div class="col-xs-12" style="height:50px;"></div>
                <h2 class="text-center">
                    <p class="text-danger" style="text-shadow:3px 3px 3px #666;">Consejo de Becas y de Investigaciones Científicas <br> Universidad de El Salvador</p>
                </h2>
                <h3 class="text-center">
                    <p class="text-danger" style="text-shadow:3px 3px 3px #666;">Sistema informático para la administración de becas de postgrado</p>
                </h3>
            </div>
        </div>

        <p class="text-right" style="font-weight:bold;">Rol: <%= rol %></p>
        <p class="text-right" style="font-weight:bold;">Usuario: <%= user %></p>

        <%-- todo el menu esta contenido en la siguiente linea
             el menu puede ser cambiado en la pagina menu.jsp --%>
        <jsp:include page="menu_corto.jsp"></jsp:include>
    </head>
    <body ng-app="AgregarDocFinalizacionbeca">
        <div class="container-fluid">
            <div class="row"><!-- TITULO DE LA PANTALLA -->
                <h2>
                    <p class="text-center" style="color:#cf2a27">Agregar documentos finalización de beca</p>
                </h2>
                <br></br> 
            </div><!-- TITULO DE LA PANTALLA -->  

            <div class="col-md-12"  ng-controller="AgregarDocFinalizacionBecaCtrl"><!-- CONTENIDO DE LA PANTALLA -->
                <fieldset class="custom-border">
                    <legend class="custom-border">Adjuntar documentos necesarios</legend>
                    <%if(expediente.getIdProgreso() == 3){%>
                    <% if(expediente.getEstadoProgreso().equals("EN PROCESO")){%>
                        <div class="text-center">
                            <h3 class="text-danger"> Ya ha realizado una Solicitud de Dictamen de Propuesta ante Junta Directiva</h3>
                            <a href="303_candidato_estado_solicitudes.jsp" class="btn btn-primary">Ver Estado de Solicitud</a>
                        </div>
                    <%}else{%>
                        <form class="form-horizontal" action="AgregarDocumentoFinalizacionBecaServlet" method="post" enctype="multipart/form-data">
                        <div class="col-md-8 col-md-offset-2 row">
                            <div class="row">
                                <div class="col-md-5">
                                    Titulo obtenido:
                                </div>
                                <div class="col-md-7">
                                    <input type="file" name="doc_digital" accept="application/pdf" valid-file ng-required="true">
                                </div>
                            </div>

                            <div class="row">
                                <div class="row text-right">
                                    <div class="col-md-10">
                                        <a ng-click="agregar()" ng-show="verAgregar">Agregar Otro Documento</a><br>
                                    </div>
                                    <div class="col-md-2"></div>                    
                                </div>

                                <div class="row text-left" ng-repeat="x in anexos">
                                    <div class="col-md-3" style="padding-left: 30px;">
                                        <label>Tipo de Documento: </label><br>
                                    </div>
                                    <div class="col-md-4">
                                        <select  name="{{x.tipo}}" class="form-control">
                                            <option value="">Seleccione el tipo de documento</option>
                                            <option value="131">Certificación de notas</option>
                                            <option value="132">Acta de evaluación de tesis</option>
                                            <option value="133">Constancia de egresado</option>
                                        </select><br>
                                    </div>
                                    <div class="col-md-3">
                                        <input type="file" name="{{x.nombre}}" accept="application/pdf"><br>
                                    </div>
                                    <div class="col-md-1">
                                        <a class="btn btn-danger" ng-click="eliminar(x)">Eliminar</a><br>
                                    </div>
                                    <div class="col-md-1"></div>  
                                </div>   
                            </div>
                            <div class="row text-center">
                                <input type="submit" class="btn btn-success" name="submit" value="Emviar">
                            </div>
                        </div>
                        </form>
                    <%}%>
                <%}else{%>
                    <div class="text-center">
                        <h3 class="text-danger">No corresponde solicitar este documento </h3>
                        <a href="305_candidato_estado_proceso.jsp" class="btn btn-primary">Ver Estado del Proceso de Beca</a>
                    </div>
                <%}%>    
                </fieldset>   
            </div><!-- CONTENIDO DE LA PANTALLA -->
        </div>

            <div class="row" style="background:url(img/pie.jpg) no-repeat center top scroll;background-size: 99% auto;">
                    <div class="col-md-6">
                            <h3>
                                    Dirección
                            </h3>
                            <p>
                                    2016 Universidad De El Salvador  <br/>
                                    Ciudad Universitaria, Final de Av.Mártires y Héroes del 30 julio, San Salvador, El Salvador, América Central. 
                            </p>
                    </div>
                    <div class="col-md-6">
                            <h3>
                                    Información de contacto
                            </h3>
                            <p>
                                    Universidad De El Salvador
                                    Tél: +(503) 2511-2000 <br/>
                                    Consejo de becas
                                    Tél: +(503) 2511- 2016
                            </p>
                    </div>
            </div>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/scripts.js"></script>
        <script src="js/angular.min.js"></script>
        <script src="js/agregarDocumentoFinalizacionBeca.js"></script>
    </body>
</html>