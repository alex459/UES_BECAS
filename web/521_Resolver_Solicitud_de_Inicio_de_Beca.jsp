<%-- 
    Document   : 521_Resolver_Solicitud_de_Inicio_de_Beca
    Created on : 2/01/2017, 11:19:44 PM
    Author     : adminPC
--%>

<%@page import="DAO.DocumentoDAO"%>
<%@page import="POJO.Documento"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ConexionBD"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- inicio proceso de seguridad de login -->
<%@page import="MODEL.Utilidades"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.variablesDeSesion"%>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Cache-Control", "must-revalidate");
    response.setHeader("Cache-Control", "no-cache");
    HttpSession actual = request.getSession();
    String id_usuario_login = (String) actual.getAttribute("id_user_login");
    String rol = (String) actual.getAttribute("rol");
    String user = (String) actual.getAttribute("user");
    Integer tipo_usuario_logeado = (Integer) actual.getAttribute("id_tipo_usuario");
    ArrayList<String> tipo_usuarios_permitidos = new ArrayList<String>();
    //AGREGAR SOLO LOS ID DE LOS USUARIOS AUTORIZADOS PARA ESTA PANTALLA------
    tipo_usuarios_permitidos.add("8"); //consejo de becas
    tipo_usuarios_permitidos.add("9"); //admin
    boolean autorizacion = Utilidades.verificarPermisos(tipo_usuario_logeado, tipo_usuarios_permitidos);
    if (!autorizacion || user == null) {
        response.sendRedirect("logout.jsp");
    }
%>
<!-- fin de proceso de seguridad de login -->

<%
    
    String id_documento = request.getParameter("ID_DOCUMENTO");
    
    ConexionBD conexionBD = new ConexionBD();
    
    String consultaSql = "SELECT CONCAT(DU.NOMBRE1_DU,' ', DU.NOMBRE2_DU, ' ', DU.APELLIDO1_DU, ' ', DU.APELLIDO2_DU) AS NOMBRES, U.NOMBRE_USUARIO, E.ID_EXPEDIENTE,CONCAT(DU.DEPARTAMENTO, ' ',F.FACULTAD ) AS UNIDAD, TD.TIPO_DOCUMENTO, D.FECHA_SOLICITUD, P.ID_PROGRESO FROM DETALLE_USUARIO DU JOIN FACULTAD  F ON DU.ID_FACULTAD=F.ID_FACULTAD JOIN USUARIO U ON DU.ID_USUARIO=U.ID_USUARIO JOIN SOLICITUD_DE_BECA SB ON U.ID_USUARIO=SB.ID_USUARIO JOIN EXPEDIENTE  E ON SB.ID_EXPEDIENTE=E.ID_EXPEDIENTE JOIN DOCUMENTO  D ON D.ID_EXPEDIENTE=E.ID_EXPEDIENTE JOIN TIPO_DOCUMENTO  TD ON D.ID_TIPO_DOCUMENTO=TD.ID_TIPO_DOCUMENTO JOIN PROGRESO P ON E.ID_PROGRESO = P.ID_PROGRESO WHERE D.ID_DOCUMENTO = " + id_documento;
    ResultSet rs = null;

    
    String nombres = new String();
    String codigo_usuario = new String();
    String unidad = new String();
    String id_expediente = new String();
    String tipo_documento = new String();
    String fecha_solicitud = new String();
    String id_progreso = new String();
    Integer id_pro;
    try {
        rs = conexionBD.consultaSql(consultaSql);
        while (rs.next()) {
            nombres = rs.getString(1);
            codigo_usuario = rs.getString(2);
            id_expediente = rs.getString(3);
            unidad =  rs.getString(4);
            tipo_documento = rs.getString(5);
            fecha_solicitud = rs.getString(6);
            id_progreso = rs.getString(7);
        }
    } catch (Exception ex) {
        System.err.println("error: " + ex);
    }
    
   // id_pro = Integer.parseInt(request.getParameter("id_progreso"));
    
//    out.write(id_progre);
    //out.write(id_usuario);
    //out.write(id_progreso);
    //out.write(id_pro);
    //out.write(tipo_documento);
    //out.write(fecha_solicitud);
    
    /*
    DocumentoDAO docComision = new DocumentoDAO();
    ArrayList<Documento> publicos = new ArrayList<Documento>();

    switch(id_p){
    
        case 2:
            publicos =  docComision.consultarConsejoBecas2(id_expedie);
        break;
            
        case 5:
            publicos =  docComision.consultarConsejoBecas5(id_expedie);
        break;
        
        case 12:
            publicos =  docComision.consultarConsejoBecas12(id_expedie);
        break;
        
        case 14:
            publicos =  docComision.consultarConsejoBecas15(id_expedie);
        break;
        
        case 21:
            publicos =  docComision.consultarConsejoBecas21(id_expedie);
        break;
        default:
        break;
    }
   
String accion="insertar";*/
    DocumentoDAO docDao = new DocumentoDAO();
    Documento acuerdo =docDao.obtenerInformacionDocumentoPorId(Integer.parseInt(id_documento));
%>
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
        
    <jsp:include page="cabecera.jsp"></jsp:include>

    <p class="text-right" style="font-weight:bold;">Rol: <%= rol%></p>
    <p class="text-right" style="font-weight:bold;">Usuario: <%= user%></p>


    <%-- todo el menu esta contenido en la siguiente linea
         el menu puede ser cambiado en la pagina menu.jsp --%>
    <jsp:include page="menu_corto.jsp"></jsp:include>
    </head>
    <body ng-app="resolverCierreApp" ng-controller="CierreCtrl">
     <div class="container-fluid">
            <div class="row"><!-- TITULO DE LA PANTALLA -->
            <h3 class="text-center" style="color:#cf2a27">
                Resolver Solicitud de Inicio de Beca
            </h3>

            <br></br>

        </div><!-- TITULO DE LA PANTALLA --> 
        <div class="col-md-12">
            
            <fieldset class="custom-border">
                <legend class="custom-border">Solicitud</legend>
                
                    <div class="row">    <!-- TABLA RESULTADOS --> 
                        <div class="col-md-1"></div> 
                        <div class="col-md-10">
                            <table class="table table-bordered">
                                <tbody>
                                    <tr>
                                    <td>Solicitante: </td>
                                    <td><%=nombres%> </td>
                                    <td>Código de Empleado: </td>
                                    <td><%=codigo_usuario%> </td>
                                    </tr>
                                    
                                    <tr>
                                    <td>Unidad: </td>
                                    <td><%=unidad%> </td>
                                    <td>Expediente: </td>
                                    <td><%=id_expediente%> </td>
                                    </tr>
                                    
                                    <tr>
                                    <td>Solicitud: </td>
                                    <td>INICIO DE BECA </td>
                                    <td>Fecha Solicitud: </td>
                                    <td><%=fecha_solicitud%> </td>
                                    </tr>
                                    
                                </tbody>    
                            </table>
                        </div>
                    </div>
                    
                    
                   

                    <div class="row">
                        <div class="col-md-1"></div>
                        <div class="col-md-10">
                            <fieldset class="custom-border">
                                <legend class="custom-border"> Información del Documento</legend>
                
                                    <div class="row">
                                        <div class="col-md-12">
                                            <table class="table">
                                                        <thead>
                                                            <tr>
                                                                <th>Tipo de Documento</th>
                                                                <th>Resolución</th>
                                                                <th>Observación</th>
                                                                <th>Documento Digital</th>
                                                            </tr>   
                                                        </thead>
                                                        <tbody >
                                                            <tr>
                                                                <td><%=acuerdo.getIdTipoDocumento().getTipoDocumento() %></td>
                                                                <td><%=acuerdo.getEstadoDocumento()%></td>
                                                                <td><%=acuerdo.getObservacion()%></td>
                                                                <td><form action="VerDocumentoCierre" method="post" target="_blank">
                                                                        <input type = "hidden" name="ID_DOCUMENTO" value="<%= id_documento%>">
                                                                        <input type="submit" class="btn btn-success" value="Ver Documento ">
                                                                    </form>
                                                                </td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                        </div>
                                    </div>


                                    <div class="row">
                                            <div class="col-md-1"></div>
                                            <div class="col-md-10">
                                                <fieldset class="custom-border">
                                                    <legend class="custom-border"> Resolución</legend>
                                                    <form  name="resolverInicio" action="ResolverInicioBeca" method="POST" novalidate>           
                                                        <div class="row text-center">
                                                            <div class="col-md-1"></div>
                                                            <div class="col-md-10 btn-group text-center" data-toggle="buttons">
                                                                
                                                                <div class="col-md-6">
                                                                    <label class="btn btn-danger" ng-click="CambiarEstadoCierre()">
                                                                        <input type="radio" name="resolucion" value="APROBADO" autocomplete="off" ng-model="resolucion" ng-required="true"> APROBAR INICIO
                                                                    </label>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <label class="btn btn-primary" ng-click="CambiarEstadoCorreccion()">
                                                                        <input type="radio" name="resolucion" value="CORRECCION" autocomplete="off" ng-model="resolucion" ng-required="true"> Solicitar Correccion
                                                                    </label>
                                                                </div>
                                                            </div>
                                                            <div class="col-md-1"></div>   
                                                        </div>
                                                        <div class="row text-center">
                                                            <span class="text-danger" ng-show="!resolverInicio.$pristine && resolverInicio.resolucion.$error.required">Debe Seleccionar una Resolucion.</span>
                                                        </div> 
                                                        <div class="row text-center">
                                                            <br>
                                                        </div>
                                                        <div class="row text-center">
                                                            <input type="hidden" name="id_documento" value="<%=id_documento%>">
                                                            <input type="submit" value="Guardar" class="btn btn-success" ng-disabled="!resolverInicio.$valid">
                                                        </div>  
                                                    </form>    
                                                </fieldset>
                                            </div>
                                            <div class="col-md-1"></div>
                                    </div>
         
           
                            </fieldset>      
                        </div>
                    </div>
                <div class="col-md-1"></div>
            </fieldset>
        </div>  

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
<script src="js/angular.min.js"></script>
<script src="js/resolverInicioBeca.js"></script>


</body>
</html>