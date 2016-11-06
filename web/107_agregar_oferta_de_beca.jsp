<%-- 
    Document   : principal
    Created on : 10-17-2016, 06:14:37 AM
    Author     : next
--%>
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

            <form class="form-horizontal" action="AgregarUsuarioServlet" method="post">
                <fieldset class="custom-border">  
                    <legend class="custom-border">Agregar oferta de beca</legend>
                    <div class="row"> 
                        <div class="col-md-3 text-right">                                   
                            <label for="textinput">Nombre de la oferta : </label>                                
                        </div>
                        <div class="col-md-3">
                            <input id="textinput" name="" type="text" placeholder="ingrese el nombre de la oferta" class="form-control input-md">                                                                
                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Duracion (Meses) : </label>                                
                        </div>
                        <div class="col-md-3 text-right">
                            <input id="textinput" name="" type="text" placeholder="cambiar" class="form-control input-md">                                                                
                        </div>                        
                    </div> 

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Institucion ofertante : </label>                                
                        </div>
                        <div class="col-md-3">

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
                            </select> 

                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Modalidad :</label>                                
                        </div>
                        <div class="col-md-3">

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
                            </select> 

                        </div>  
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Institucion de estudio :</label>                                
                        </div>
                        <div class="col-md-3">                                

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
                            </select> 

                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Fecha inicio de estudio :</label>                                
                        </div>
                        <div class="col-md-3">                                                            
                            <div class="input-group date">
                                <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>              
                    </div>                      

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Tipo de estudio :</label>                                
                        </div>
                        <div class="col-md-3"> 

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
                            </select>

                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Fecha limite para aplicar :</label>                                
                        </div>
                        <div class="col-md-3">                                
                            <div class="input-group date">
                                <input type="text" class="form-control"><span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                            </div>
                        </div>              
                    </div>

                    <br>

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Tipo de beca: </label>                                
                        </div>
                        <div class="col-md-3">                                

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
                            </select>

                        </div>
                        <div class="col-md-3 text-right">
                            <label for="textinput">Idioma :</label>                                
                        </div>
                        <div class="col-md-3">                                

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
                            </select>

                        </div>              
                    </div>

                    <br> 

                    <div class="row">
                        <div class="col-md-3 text-right">
                            <label for="textinput">Financiamiento: </label>                                
                        </div>
                        <div class="col-md-3">                                

                            <select id="selectbasic" name="" class="form-control">
                                <option value=""> a </option>);                                
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
                            <label for="textinput">Perfil de la beca: </label>                                
                        </div>
                        <div class="col-md-9">                                
                            <textarea class="form-control" id="textarea" name="textarea"></textarea>
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
</body>
</html>
