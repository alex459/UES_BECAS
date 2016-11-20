<%-- 
    Document   : principal
    Created on : 10-17-2016, 06:14:37 AM
    Author     : next
--%>
<%@page import="POJO.OfertaBeca"%>
<%@page import="DAO.BecaDAO"%>
<%@page import="DAO.InstitucionDAO"%>
<%@page import="POJO.Institucion"%>
<%@page import="DAO.IdiomaDAO"%>
<%@page import="POJO.Idioma"%>
<%@page import="java.util.ArrayList"%>
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
    <link rel="stylesheet" type="text/css" href="css/bootstrap-datepicker3.min.css" />

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



<p class="text-right">Rol: </p>
<p class="text-right">Usuario: </p>


<%-- todo el menu esta contenido en la siguiente linea
     el menu puede ser cambiado en la pagina menu.jsp --%>
<jsp:include page="menu.jsp"></jsp:include>

</head>
<body>


    <div class="container-fluid">
        <div class="row"><!-- TITULO DE LA PANTALLA -->
            <h2>
                <p class="text-center" style="color:#cf2a27">Agregar Oferta de Beca</p>
            </h2>

            <br></br>

        </div><!-- TITULO DE LA PANTALLA -->  

        <div class="col-md-12">

            <form class="form-horizontal" action="AgregarOfertaBecaServlet" method="post">
                <fieldset class="custom-border">  
                    <legend class="custom-border">Agregar oferta de beca</legend>
                    <div class="row"> 
                        <div class="col-md-3 text-right">                                   
                            <label for="nombreOferta">Nombre de la oferta : </label>                                
                        </div>
                        <div class="col-md-3">
                            <input id="nombreOferta" name="nombreOferta" type="text" placeholder="ingrese el nombre de la oferta" class="form-control input-md">                                                                
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="duracion">Duracion (Meses) : </label>                                
                        </div>
                        <div class="col-md-3 text-right">
                            <input id="duracion" name="duracion" type="text" placeholder="cambiar" class="form-control input-md">                                                                
                        </div>                        
                    </div> 
                    <br>
                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="institucionOfertante">Institucion ofertante : </label>                                
                        </div>
                        <div class="col-md-3">
                        <select id="institucionOferente" name="institucionOferente" class="form-control">
                            <%
                                InstitucionDAO institucionDAO = new InstitucionDAO();
                                ArrayList<Institucion> listaInstitucion = new ArrayList();
                                listaInstitucion = institucionDAO.consultarPorTipo("ofertante");
                                for (int i = 0; i < listaInstitucion.size(); i++) { %>
                                    <option value="<%=listaInstitucion.get(i).getNombreInstitucion()%>"> <%=listaInstitucion.get(i).getNombreInstitucion()%></option>
                                    <%   }
                            %>    
                        </select>     
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="modalidad">Modalidad :</label>                                
                        </div>
                        <div class="col-md-3">
                         <select id="modalidad" name="modalidad" class="form-control">
                                <option value="Presencial">Presencial</option>  
                                <option value="Semipresencial">Semipresencial</option>
                                <option value="Virtual">Virtual</option>
                         </select>  
                        </div>  
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="institucionEstudio">Institucion de estudio :</label>                                
                        </div>
                        <div class="col-md-3">                                
                            <select id="institucionEstudio" name="institucionEstudio" class="form-control">
                            <%
                                InstitucionDAO institucionDAO2 = new InstitucionDAO();
                                ArrayList<Institucion> listaInstitucion2 = new ArrayList();
                                listaInstitucion2 = institucionDAO2.consultarPorTipo("estudio");
                                for (int i = 0; i < listaInstitucion2.size(); i++) {  %>
                                    <option value="<%=listaInstitucion2.get(i).getNombreInstitucion()%>"> <%= listaInstitucion2.get(i).getNombreInstitucion()%> </option>
                               <% }
                            %>    
                            </select>
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="fechaInicio">Fecha inicio de estudio :</label>                                
                        </div>
                        <div class="col-md-3">                                                            
                            <div class="input-group date">
                                        <input type="text" name="fechaInicio" id="fechaInicio" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" ng-model ="data.fecha_nacimiento"></i></span>
                        </div>
                        </div>              
                    </div>   
                    <br>
                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="tipoEstudio">Tipo de estudio :</label>                                
                        </div>
                        <div class="col-md-3"> 
                            <select id="tipoEstudio" name="tipoEstudio" class="form-control">
                               <option value="Maestria">Maestria</option>
                               <option value="Doctorado">Doctorado</option>
                               <option value="Especialización">Especialización</option>
                            </select>
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="fechaCierre">Fecha limite para aplicar :</label>                                
                        </div>
                        <div class="col-md-3">                                
                            <div class="input-group date">
                                        <input type="text" name="fechaCierre" id="fechaCierre" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar" ng-model ="data.fecha_nacimiento"></i></span>
                        </div>
                        </div>              
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="tipoBeca">Tipo de beca: </label>                                
                        </div>
                        <div class="col-md-3">    
                            <select id="tipoBeca" name="tipoBeca" class="form-control">
                                <option value="Interna">Interna</option>
                                <option value="Externa">Externa</option>                                
                            </select>
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="idioma">Idioma :</label>                                
                        </div>
                        <div class="col-md-3"> 
                            <select id="idioma" name="idioma" class="form-control">
                             <%
                                IdiomaDAO idiomaDAO = new IdiomaDAO();
                                ArrayList<Idioma> listaIdioma = new ArrayList<Idioma>();
                                listaIdioma = idiomaDAO.consultarTodos();
                                for (int i = 0; i < listaIdioma.size(); i++) { %>
                                <option value="<%=listaIdioma.get(i).getIdioma()%>"><%=listaIdioma.get(i).getIdioma()%></option>
                             <%   }
                            %>                              
                            </select>
                        </div>              
                    </div>
                    <br> 
                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="financiamiento">Financiamiento: </label>                                
                        </div>
                        <div class="col-md-3">         
                            <select id="financiamiento" name="financiamiento" class="form-control">
                                <option value="Beca completa">Beca completa</option>
                                <option value="Media beca">Media beca</option>
                                <option value="Cuarto de beca">Cuarto de beca</option>
                            </select>
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Archivo de la oferta :</label>                                
                        </div>
                        <div class="col-md-3">      
                            <input type="submit" class="btn btn-primary" name="submit" value="Seleccionar archivo">
                        </div>              
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="perfil">Perfil de la beca: </label>                                
                        </div>
                        <div class="col-md-9">                                
                            <textarea class="form-control" id="perfilBeca" name="perfilBeca"></textarea>
                        </div>                                    
                    </div>
                    <br>
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <input type="submit" class="btn btn-primary" name="submit" value="Agregar oferta">
                            <input type="submit" class="btn btn-danger" name="submit" value="Cancelar">
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
    <script src="js/scripts.js"></script>
    <script type="text/javascript" src="js/bootstrap-datepicker.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('.input-group.date').datepicker({            
            format: 'yyyy-mm-dd',
            calendarWeeks: true,
            todayHighlight: true,
            autoclose: true
        });
    });
</script>
</body>
</html>
