<%-- 
    Document   : principal
    Created on : 10-17-2016, 06:14:37 AM
    Author     : next
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.ConexionBD"%>
<%@page import="POJO.TipoUsuario"%>
<%@page import="DAO.TipoUsuarioDao"%>
<%@page import="DAO.FacultadDAO"%>
<%@page import="POJO.Facultad"%>
<%@page import="java.util.ArrayList"%>
<!-- inicio proceso de seguridad de login -->
<%@page import="MODEL.Utilidades"%>
<%@page import="java.util.ArrayList"%>
<%@page import="MODEL.variablesDeSesion"%>
<%
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
    tipo_usuarios_permitidos.add("7");
    tipo_usuarios_permitidos.add("8");
    tipo_usuarios_permitidos.add("9");
    boolean autorizacion = Utilidades.verificarPermisos(tipo_usuario_logeado, tipo_usuarios_permitidos);
    if (!autorizacion || user==null) {
        response.sendRedirect("logout.jsp");        
    }
%>
<!-- fin de proceso de seguridad de login -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
<body ng-app="ActualizarUsuarioApp" ng-controller="ActualizarUsuarioCtrl">

    
    <%
        
        String id_usuario = request.getParameter("ID_USUARIO");
        String id_detalle_usuario = request.getParameter("ID_DETALLE_USUARIO");
        ConexionBD conexionBD = new ConexionBD();
        String consultaSql = "SELECT DU.CARNET, DU.NOMBRE1_DU, DU.NOMBRE2_DU, DU.APELLIDO1_DU, DU.APELLIDO2_DU, U.CLAVE, U.ID_TIPO_USUARIO, TU.TIPO_USUARIO, DU.ID_FACULTAD, F.FACULTAD, DU.GENERO, DU.EMAIL FROM DETALLE_USUARIO DU NATURAL JOIN USUARIO U NATURAL JOIN FACULTAD F NATURAL JOIN TIPO_USUARIO TU WHERE U.ID_USUARIO = "+id_usuario;
        ResultSet rs = null;
        //out.write(consultaSql);
        String carnet=new String();
        String nombre1=new String();
        String nombre2=new String();
        String apellido1=new String();
        String apellido2=new String();
        String clave=new String();
        String id_tipo_usuario=new String();
        String tipo_usuario=new String();
        String id_facultad=new String();
        String facultad=new String();
        String genero = new String();
        String email = new String();        
        try{
            rs = conexionBD.consultaSql(consultaSql);  
            while(rs.next()){
                carnet = rs.getString(1);
                nombre1 = rs.getString(2);
                nombre2 = rs.getString(3);
                apellido1 = rs.getString(4);
                apellido2 = rs.getString(5);
                clave = rs.getString(6);
                id_tipo_usuario = rs.getString(7);
                tipo_usuario = rs.getString(8);
                id_facultad = rs.getString(9);
                facultad = rs.getString(10);
                genero = rs.getString(11);
                email = rs.getString(12);                
            }
        }catch(Exception ex){
            System.err.println("error: "+ex);
        }
        
        

        
        
    
    %>
    
    <div class="container-fluid">
        <div class="row"><!-- TITULO DE LA PANTALLA -->
            <h3>
                <p class="text-center" style="color:#cf2a27">Modificar Roles</p>
            </h3>

            <br></br>

        </div><!-- TITULO DE LA PANTALLA -->  

        <div class="col-md-12">

            <form name= "ActualizarUsuario" class="form-horizontal" action="ModificarRolesServlet" method="post" novalidate>
                <fieldset class="custom-border">  
                    <legend class="custom-border">Paso 2: Seleccione el nuevo rol y su facultad.</legend>
                    <div class="row"> 
                        <div class="col-md-3 text-right">                                   
                            <label for="textinput">Código de Usuario : </label>                                
                        </div>
                        <div class="col-md-3">
                            <input value = "<%=carnet%>" type="text" class="form-control input-md" ng-disabled="true">                            
                            <input id="CARNET" name="CARNET" value = "<%=carnet%>" type="hidden">
                        </div>
                        <div class="col-md-3 text-right">                                   
                            <label for="textinput">Email : </label>                                
                        </div>
                        <div class="col-md-3">
                            <input id="EMAIL" name="EMAIL" type="email" ng-init="datos.correo = '<%=email%>'"  placeholder="ingrese el correo electronico" class="form-control input-md"  ng-model="datos.correo" ng-required="true"  minlength="3" maxlength="30" ng-disabled="true">
                            <span class="text-danger" ng-show="!ActualizarUsuario.$pristine && ActualizarUsuario.EMAIL.$error.required">El correo electronico requerido.</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.EMAIL.$error.minlength">Minimo 3 caracteres</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.EMAIL.$error.email">Solo permite formato: ejemplo usuario@ues.com).</span>
                        </div>                       
                    </div> 

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Primer Nombre : </label>                             
                        </div>
                        <div class="col-md-3">
                            <input id="NOMBRE1_DU" name="NOMBRE1_DU" type="text" ng-init="datos.nombre1 = '<%=nombre1%>'" placeholder="Ingrese el Primer Nombre" class="form-control input-md" ng-model="datos.nombre1" ng-required="true" ng-pattern="/^[A-ZÑÁÉÍÓÚ]*$/" maxlength="20" minlength="3" ng-disabled="true"> 
                            <span class="text-danger" ng-show="!ActualizarUsuario.$pristine && ActualizarUsuario.NOMBRE1_DU.$error.required">El Primer Nombre es requerido.</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.NOMBRE1_DU.$error.minlength">Mínimo 3 Caracteres.</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.NOMBRE1_DU.$error.pattern">Solo se Permiten Letras Mayúsculas. (A-Z).</span>
                            <small id="help2"></small>
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Segundo nombre :</label>                                
                        </div>
                        <div class="col-md-3">
                            <input id="NOMBRE2_DU" name="NOMBRE2_DU" type="text" ng-init="datos.nombre2 = '<%=nombre2%>'" placeholder="Ingrese el Segundo Nombre" class="form-control input-md" ng-model="datos.nombre2"  ng-pattern="/^[A-ZÑÁÉÍÓÚ]*$/" maxlength="20" minlength="3" ng-disabled="true">    
                            <span class="text-danger" ng-show="ActualizarUsuario.NOMBRE2_DU.$error.minlength">Mínimo 3 Caracteres</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.NOMBRE2_DU.$error.pattern">Solo se Permiten Letras Mayúsculas. (A-Z).</span>
                            <small id="help3"></small>
                        </div>  
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Primer Apellido :</label>                                
                        </div>
                        <div class="col-md-3">                                
                            <input id="APELLIDO1_DU" name="APELLIDO1_DU" type="text" ng-init="datos.apellido1 = '<%=apellido1%>'" placeholder="Ingrese el Primer Apellido" class="form-control input-md" ng-model="datos.apellido1" ng-required="true" ng-pattern="/^[A-ZÑÁÉÍÓÚ]*$/" maxlength="20" minlength="3" ng-disabled="true"> 
                            <span class="text-danger" ng-show="!ActualizarUsuario.$pristine && ActualizarUsuario.APELLIDO1_DU.$error.required">El Primer Apellido es Requerido.</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.APELLIDO1_DU.$error.minlength">Mínimo 3 Caracteres.</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.APELLIDO1_DU.$error.pattern">Solo se Permiten Letras Mayúsculas. (A-Z).</span>
                            <small id="help4"></small>
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Segundo apellido :</label>                                                            
                        </div>
                        <div class="col-md-3">                                
                            <input id="APELLIDO2_DU" name="APELLIDO2_DU" type="text" ng-init="datos.apellido2 = '<%=apellido2%>'" placeholder="Ingrese el Segundo Apellido" class="form-control input-md"ng-model="datos.apellido2" ng-pattern="/^[A-ZÑÁÉÍÓÚ]*$/" maxlength="20" minlength="3" ng-disabled="true"> 
                            <span class="text-danger" ng-show="ActualizarUsuario.APELLIDO2_DU.$error.minlength">Mínimo 3 caracteres.</span>
                            <span class="text-danger" ng-show="ActualizarUsuario.APELLIDO2_DU.$error.pattern">Solo se Permiten Letras Mayúsculas. (A-Z).</span>
                            <small id="help5"></small>
                        </div>              
                    </div>                      

                    <br>

                    <div class="row" ng-init="datos.tipoUsuario='<%=id_tipo_usuario%>';  datos.facultad='<%=id_facultad%>'; mostrarfacultades()">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Rol del Usuario :</label>                                
                        </div>
                        <div class="col-md-3">                                

                            <select id="selectbasic" name="ID_TIPO_USUARIO" class="form-control" ng-model="datos.tipoUsuario" ng-required="true" ng-change="mostrarfacultades()">
                            <%
                                TipoUsuarioDao tipoUsuarioDao = new TipoUsuarioDao();
                                ArrayList<TipoUsuario> listaTiposDeUsuarios = new ArrayList<TipoUsuario>();
                                listaTiposDeUsuarios = tipoUsuarioDao.consultarTodosMenosBecarios();                                                                
                                for (int i = 0; i < listaTiposDeUsuarios.size(); i++) {
                                    out.write("<option value=" + listaTiposDeUsuarios.get(i).getIdTipoUsuario() + ">" + listaTiposDeUsuarios.get(i).getTipoUsuario() + "</option>");
                                }
                            %>    
                        </select> 
                        <span class="text-danger" ng-show="ActualizarUsuario.ID_TIPO_USUARIO.$error.required">El Tipo de Usuario es Requerido.</span>
                    </div>
                    <div class="col-md-3 text-right">
                        <label for="textinput">Facultad :</label>                                
                    </div>
                    <div class="col-md-3">                                

                        <select id="selectbasic" name="ID_FACULTAD" class="form-control" ng-model="datos.facultad" ng-required="true">
                            <option ng-repeat="option in facultades" value="{{option.id}}">{{option.nombre}}</option>                                   
                        </select>                       
                        <span class="text-danger" ng-show="ActualizarUsuario.ID_FACULTAD.$error.required">La Facultad es Requerida.</span>
                    </div>              
                </div>                
                
                <br> 

                <div class="row">
                    <div class="col-md-12 text-center">
                        <input type="hidden" name="ID_USUARIO" value="<%=id_usuario%>">
                        <input type="hidden" name="ID_DETALLE_USUARIO" value="<%=id_detalle_usuario%>">                        
                        <input type="submit" class="btn btn-primary" name="submit" value="Modificar Rol" ng-disabled="!ActualizarUsuario.$valid">

                    </div>
                </div>

            </fieldset>
        </form>                    
    </div>
</div>







<br></br>







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
<script src="js/actualizarUsuario.js"></script>
</body>
</html>
