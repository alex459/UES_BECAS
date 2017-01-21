<%-- 
    Document   : 515_Reporte_Institucion_Becarios_Activos
    Created on : 30/10/2016, 04:06:20 PM
    Author     : adminPC
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ConexionBD"%>
<%@page import="DAO.FacultadDAO"%>
<%@page import="POJO.Institucion"%>
<%@page import="DAO.InstitucionDAO"%>
<%@page import="MODEL.AgregarOfertaBecaServlet"%>
<%@page import="POJO.Facultad"%>
<%@page import="MODEL.Utilidades"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    response.setHeader("Cache-Control", "no-store");
    response.setHeader("Cache-Control", "must-revalidate");
    response.setHeader("Cache-Control", "no-cache");

    HttpSession actual = request.getSession();
    String rol = (String) actual.getAttribute("rol");
    String user = (String) actual.getAttribute("user");
    Integer tipo_usuario_logeado = (Integer) actual.getAttribute("id_tipo_usuario");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    ArrayList<String> tipo_usuarios_permitidos = new ArrayList<String>();
    //AGREGAR SOLO LOS ID DE LOS USUARIOS AUTORIZADOS PARA ESTA PANTALLA------
    tipo_usuarios_permitidos.add("7");
    tipo_usuarios_permitidos.add("8");
    tipo_usuarios_permitidos.add("9");
    boolean autorizacion = Utilidades.verificarPermisos(tipo_usuario_logeado, tipo_usuarios_permitidos);
    if (!autorizacion || user == null) {
        response.sendRedirect("logout.jsp");
    }
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("UTF-8");
    Facultad facultad1 = new Facultad();
    AgregarOfertaBecaServlet OfertaServlet = new AgregarOfertaBecaServlet();
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
    <link href="css/menuSolicitudBeca.css" rel="stylesheet">    
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker3.min.css" />
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
<p class="text-right">Rol: <%= rol%></p>
    <p class="text-right">Usuario: <%= user%></p>

    <%-- todo el menu esta contenido en la siguiente linea
         el menu puede ser cambiado en la pagina menu.jsp --%>
    <jsp:include page="menu_corto.jsp"></jsp:include>   
</head>


<body>

    <div class="container-fluid">
        <H3 class="text-center" style="color:#E42217;">Reporte de Instituciones con Becarios Activos</H3>
        <fieldset class="custom-border">
                <legend class="custom-border">Reporte de Instituciones con Becarios Activos</legend>
                    
                    <div class="row">            
                        <div class="col-md-9">
                            <fieldset class="custom-border">
                                <legend class="custom-border">Filtros</legend>
                                <h5 style="color:#E42217">Ingrese los Fitros de Busqueda del Reporte</h5>
                                <form class="form-horizontal" action="515_Reporte_Institucion_Becarios_Activos.jsp" method="post">
                                
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-4">
                                                <br>
                                                <label>Institucion de Estudio:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <br>
                                                <select id="selectbasic" name="INSTITUCION_ESTUDIO" class="form-control">
                                                    <option value="0" selected>Seleccione una institución</option>
                                                    <%
                                                            InstitucionDAO institucionDAO = new InstitucionDAO();
                                                            ArrayList<Institucion> listaInstitucion = new ArrayList();
                                                            listaInstitucion = institucionDAO.consultarActivosPorTipo("ESTUDIO");
                                                            for (int i = 0; i < listaInstitucion.size(); i++) {
                                                                out.write("<option value=" + listaInstitucion.get(i).getIdInstitucion() + ">" + listaInstitucion.get(i).getNombreInstitucion() + "</option>");
                                                                    
                                                            }
                                                    %>
                                                    
                                                    
                                                </select>      
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="col-md-4">
                                                <br>
                                                <label>Pais:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <br>
                                                <select class="form-control">
                                                    <option>Seleccione Pais</option>
                                                    <option>Pais 1</option>
                                                    <option>Pais 2</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="col-md-4">
                                                <br>
                                                <label>Facultad:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <br>
                                                <select id="selectbasic" name="ID_FACULTAD" class="form-control">
                                                            <option value="0">Selecione Facultad</option>    
                                                                <%
                                                                    FacultadDAO facultadDao = new FacultadDAO();
                                                                    ArrayList<Facultad> listaFacultades = new ArrayList<Facultad>();
                                                                    listaFacultades = facultadDao.consultarTodos();
                                                                    for (int i = 0; i < listaFacultades.size(); i++) {
                                                                        out.write("<option value=" + listaFacultades.get(i).getIdFacultad() + ">" + listaFacultades.get(i).getFacultad() + "</option>");
                                                                    }
                                                                %>                    
                                               </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="col-md-4">
                                                <br>
                                                <label>Tipo de Estudio Realizado:</label>
                                            </div>
                                            <div class="col-md-8">
                                                <br>
                                                <select  name="TIPO_ESTUDIO" id="TIPO_ESTUDIO" class="form-control">
                                                    <option value="">Seleccione Tipo de Estudio</option>
                                                    <option value="MAESTRIA">Maestria</option>
                                                    <option value="DOCTORADO">Doctorado</option>
                                                    <option value="ESPECIALIZACION">Especializacion</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>

                                    

                                    <div class="row text-center">
                                        <br>
                                       <input type="submit" class="btn btn-primary" name="submit" value="Buscar"> 
                                        </div>

                                </form>
                            </fieldset>
                        </div>
 <%
                
                String tipoEstudio;
                // String pais;
                Integer id_institucion_estudio;
                Integer id_facultad;
                // DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                ConexionBD conexionbd = null;
               
                ResultSet rs = null;   
                 String queryParam=""; 
                    
                String consultaSql2 = ""; 
                try{
                    tipoEstudio = request.getParameter("TIPO_ESTUDIO");
                    id_institucion_estudio = Integer.parseInt(request.getParameter("INSTITUCION_ESTUDIO"));
                    id_facultad = Integer.parseInt(request.getParameter("ID_FACULTAD"));
                    
                    String consultaSql="";
                    
                   // if(tipoEstudio!=null) {} else {tipoEstudio="";};
                    //if(tipoEstudio!=null) {} else {tipoEstudio="";};
                    //if(tipoBecario!=null) {} else {tipoBecario="";};
                    //if(documento!=null) {} else {documento="";};
                    
                    //consultaSql = "SELECT CONCAT(DU.NOMBRE1_DU,' ', DU.NOMBRE2_DU,' ', DU.APELLIDO1_DU,' ', DU.APELLIDO2_DU) AS NOMBRE, OF.TIPO_OFERTA_BECA, OF.FECHA_INICIO, I.PAIS, OF.NOMBRE_OFERTA, TD.TIPO_DOCUMENTO, OBS.OBSERVACION_O, F.FACULTAD FROM DETALLE_USUARIO DU JOIN FACULTAD  F ON DU.ID_FACULTAD=F.ID_FACULTAD JOIN USUARIO U ON DU.ID_USUARIO=U.ID_USUARIO JOIN TIPO_USUARIO TU ON U.ID_TIPO_USUARIO=TU.ID_TIPO_USUARIO JOIN SOLICITUD_DE_BECA SB ON U.ID_USUARIO=SB.ID_USUARIO JOIN EXPEDIENTE  E ON SB.ID_EXPEDIENTE=E.ID_EXPEDIENTE JOIN PROGRESO P ON E.ID_PROGRESO=P.ID_PROGRESO JOIN OFERTA_BECA OF ON SB.ID_OFERTA_BECA=OF.ID_OFERTA_BECA JOIN DOCUMENTO  D ON D.ID_EXPEDIENTE=E.ID_EXPEDIENTE JOIN TIPO_DOCUMENTO  TD ON D.ID_TIPO_DOCUMENTO=TD.ID_TIPO_DOCUMENTO JOIN INSTITUCION I ON OF.ID_INSTITUCION_ESTUDIO=I.ID_INSTITUCION JOIN OBSERVACIONES OBS ON OBS.ID_EXPEDIENTE=E.ID_EXPEDIENTE WHERE U.ID_TIPO_USUARIO = 2 AND E.ESTADO_EXPEDIENTE='ABIERTO' AND D.ESTADO_DOCUMENTO='PENDIENTE' AND OF.TIPO_OFERTA_BECA LIKE '%" + tipoBeca + "%' AND P.ESTADO_BECARIO LIKE '%" + tipoBecario + "%' " ;

                               
                              //  + "AND OF.TIPO_OFERTA_BECA LIKE '%" + tipoBeca + "%' AND P.ESTADO_BECARIO LIKE '%" + tipoBecario + "%'";
                    
                  consultaSql = "SELECT I.NOMBRE_INSTITUCION, I.PAIS, I.EMAIL, COUNT(P.ESTADO_BECARIO) AS NUMERO_DE_BECARIOS "
                                + "FROM DETALLE_USUARIO DU "
                                + "JOIN FACULTAD  F ON DU.ID_FACULTAD=F.ID_FACULTAD "
                                + "JOIN USUARIO U ON DU.ID_USUARIO=U.ID_USUARIO "
                                + "JOIN TIPO_USUARIO TU ON U.ID_TIPO_USUARIO=TU.ID_TIPO_USUARIO "
                                + "JOIN SOLICITUD_DE_BECA SB ON U.ID_USUARIO=SB.ID_USUARIO "
                                + "JOIN EXPEDIENTE  E ON SB.ID_EXPEDIENTE=E.ID_EXPEDIENTE "
                                + "JOIN PROGRESO P ON E.ID_PROGRESO=P.ID_PROGRESO "
                                + "JOIN OFERTA_BECA OF ON SB.ID_OFERTA_BECA=OF.ID_OFERTA_BECA "
                                + "JOIN DOCUMENTO  D ON D.ID_EXPEDIENTE=E.ID_EXPEDIENTE "
                                + "JOIN TIPO_DOCUMENTO  TD ON D.ID_TIPO_DOCUMENTO=TD.ID_TIPO_DOCUMENTO "
                                + "JOIN INSTITUCION I ON OF.ID_INSTITUCION_ESTUDIO=I.ID_INSTITUCION "
                                + "JOIN OBSERVACIONES OBS ON OBS.ID_EXPEDIENTE=E.ID_EXPEDIENTE "
                               
                                + "WHERE P.ESTADO_BECARIO='ACTIVO' AND E.ESTADO_EXPEDIENTE='ABIERTO' ";
                               // + "AND OF.TIPO_OFERTA_BECA LIKE '%" + tipoBeca + "%' AND P.ESTADO_BECARIO LIKE '%" + tipoBecario + "%'";
                    
                               
                               
                               
                    if (request.getParameter("TIPO_ESTUDIO").toString().length()>0) {
                           
                            tipoEstudio = request.getParameter("TIPO_ESTUDIO");
                            consultaSql2 = consultaSql2.concat(" AND OF.TIPO_ESTUDIO = '" + tipoEstudio + "' ");
                   
                        }
                    
                    if (id_institucion_estudio == 0) {

                    } else {
                        consultaSql2 = consultaSql2.concat(" AND I.ID_INSTITUCION = " + id_institucion_estudio + " ");
                    }
                               
                               
                    if (id_facultad == 0) {

                    } else {
                        consultaSql2 = consultaSql2.concat(" AND DU.ID_FACULTAD = " + id_facultad);
                    }   
                
                consultaSql = consultaSql.concat(consultaSql2);
                    consultaSql = consultaSql.concat(";");
                conexionbd = new ConexionBD();
                rs = conexionbd.consultaSql(consultaSql);
                
                }
                catch(Exception ex){
                    
                }






                    %>

                        <div class="col-md-3 text-center">
                            <fieldset class="custom-border">
                                <legend class="custom-border">Acciones</legend>
                                <div class="col-md-6">
                                    <br>
                                    <label class="">PDF</label>
                                    <button type="submit" class="btn btn-success form-control">
                                       <span class="glyphicon glyphicon-file"></span> 
                                       PDF
                                    </button><br><br>
                                    <label>Enviar Por Correo</label>
                                    <button type="submit" class="btn btn-success form-control">
                                       <span class="glyphicon glyphicon-file"></span> 
                                       E-mail
                                    </button>
                                </div>
                                <div class="col-md-6">
                                    <label>Hoja de Cálculo</label>
                                    <button type="submit" class="btn btn-success form-control">
                                       <span class="glyphicon glyphicon-file"></span> 
                                       Excel
                                    </button><br><br>
                                    <br>
                                    <label>Imprimir</label>
                                    <button type="submit" class="btn btn-success form-control">
                                       <span class="glyphicon glyphicon-print"></span> 
                                       Imprimir
                                    </button>
                                    
                                </div>                                                                
                            </fieldset>
                        </div>
                    </div>
                    
                   

                    <div class="row">
                        <h5>Resultados de la busqueda</h5>
                        <div class="col-md-12">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th>No.</th>
                                        <th>Institucion</th>
                                        <th>Pais</th>
                                        <th>Pagina Web</th>
                                        <th>Cantidad de becarios</th>
                                    </tr>  
                                </thead>
                                <tbody>
                                          <%
                                        try {
                                            Integer i = 0;
                                            while (rs.next()) {
                                                i = i + 1;
                                                out.write("<tr>");
                                                out.write("<td>" + i + "</td>");
                                                out.write("<td>" + rs.getString(1) + "</td>");
                                                out.write("<td>" + rs.getString(2) + "</td>");
                                                out.write("<td>" + rs.getString(3) + "</td>");
                                                out.write("<td>" + rs.getString(4) + "</td>");
                                                
                                            }
                                        }
                                        catch (Exception ex){
                                            System.out.println("error: " + ex);
                                        }
                                        
                                        %>
                                </tbody>
                            </table>
                        </div>
                    </div>
        </fieldset>
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
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
<script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#fIngresoIni').datepicker({
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            todayHighlight: true,
            autoclose: true
        }).on('change.dp', function (e) {
            $('#fIngresoFin').datepicker('setStartDate', new Date($(this).val()));
        });
        $('#fIngresoFin').datepicker({
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            todayHighlight: true,
            autoclose: true
        }).on('change.dp', function (e) {
            $('#fIngresoIni').datepicker('setEndDate', new Date($(this).val()));
        });
        $('#fCierreIni').datepicker({
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            todayHighlight: true,
            autoclose: true
        }).on('change.dp', function (e) {
            $('#fCierreFin').datepicker('setStartDate', new Date($(this).val()));
        });
        $('#fCierreFin').datepicker({
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            todayHighlight: true,
            autoclose: true,
            startDate: new Date()
        }).on('change.dp', function (e) {
            $('#fCierreIni').datepicker('setEndDate', new Date($(this).val()));
        });
    });
</script>


</body>
</html>
