<%-- 
    Document   : BorrarMedicoMuestra
    Created on : 28-abr-2014, 19:02:45
    Author     : Inma
--%>
<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Borrar Medico</title>
        <script	type="text/javascript">	</script>
        <link rel="stylesheet" href="../estilo/style.css">
    </head>
    <body>
         <%
            Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
      <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="../estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
                    <div id="trees"></div>
            </div>
            
            <!-- navigation -->
            <div id="navcontainer">
                    <ul class="navlist"> 
                            <li>
                                <a href="principal.jsp"> <%--id="current"--%>
                                    INICIO
                                </a>
                            </li>
                            <li>CITAS</a>
                                <ul>
                                    <li><a href="http://localhost:8080/TecnoSalud_JSFl-war/ConsultarListadoCitas?do=all">
                                    Consultar citas de hoy
                                    </a>
                                    </li>                                
                                    <li><a href="jose/buscarCitaporfecha.jsp">
                                    Consultar citas de una fecha determinada
                                    </a>
                                    </li>
                                    <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">
                                    Consultar citas pasadas
                                    </a>
                                    </li>
                                    <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">
                                    Consultar citas próxima
                                    </a>
                                    </li>
                                    <li><a href="jose/buscarCitaporpaciente.jsp">
                                    Consultar citas por paciente
                                    </a>
                                    </li>
                                    <li><a href="jose/buscarCitapormedico.jsp">
                                    Consultar citas por médico
                                    </a>
                                    </li>
                                </ul>
                            <li><a href="ListadoMensajes.xhtml">MENSAJES</a>
                            </li>
                            <li><a href="#">FORMULARIOS</a>
                                <ul id="navlist2"><a href="jose/especifico.jsp">
                                    Consultar formularios de paciente especifico
                                    </a>
                                </ul>
                                <ul id="navlist2"><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=all">
                                    Consultar todos los formularios recibidos
                                    </a>
                                </ul>
                                <ul id="navlist2"><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=quejas">
                                    Consultar los formularios de quejas
                                    </a>
                                </ul>
                                <ul id="navlist2"><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=sug">
                                    Consultar los formularios de sugerencias
                                    </a>
                                </ul>
                                <ul id="navlist2"><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=feli">
                                    Consultar los formularios de felicitaciones
                                    </a>
                                </ul>                               
                            </li>
                            <li><a href="#">LISTADOS</a>
                                <ul id="navlist2"><a href="face/inma/ListadoMedicos.xhtml">
                                    Listado de Medicos del hospital
                                    </a>
                                </ul>
                                <ul id="navlist2"><a href="face/inma/ListadoPA.xhtml">
                                    Listado de Personal Administrativo del hospital
                                    </a>
                                </ul>
                            </li>                            
                    </ul>
            </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %>
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>  
         <!-- topoffers -->
            <div id="topoffers">
                <div id="topoffers-left-arrow"><a href=""><img src="../estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        <div id="estate1-box">
                            
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar Médico</h3>
                            <img src="../estilo/images/temp_estate.jpg" alt="Commercial Properties" />
                            <p>A través de este enlace podrá realizar la consulta de los datos personales del médico 
                                seleccionado.<br/><br/>
                                <a href="ConsultarMedico.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate3-box">
                            <h3>Crear Médico</h3>
                            <img src="../estilo/images/temp_estate.jpg" alt="Deluxe Properties" />
                            <p>Pinchando en este enlace podrá crear un médico nuevo<br/><br/><br/><br/>
                                <a href="NuevoMedico.jsp">Ir ...</a></p>
                        </div>
                        <div id="estate4-box">
                            
                        </div>
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="../estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div>   
        
             <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                        <h2>Buscar médico</h2>
                        <div class="property">
                            <div class="property_left">
   
                                <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/BorrarMedico" method="post">
                                   

                                        <%
                                               Medicos medico = (Medicos) request.getAttribute("m");
                                        %>
                                                  <legend align= "center">
                                                           Datos del medico a eliminar 
                                                  </legend>
                                                  <br>
                                                  Identificado del médico:
                                                  <input type="label" name="id_med" value="<%= medico.getIdMedicos() %>  ">
                                                  <br><br>                                   
                                                  Nombre:                          
                                                  <input type="label" name="nombre" value="<%= medico.getNombre() %>  ">
                                                  <br><br>                           
                                                  Apellidos:         
                                                  <input type="label" name="Apellidos" value="<%= medico.getApellidos() %> ">
                                                  <br><br>          
                                                  Especialidad:          
                                                  <input type="label" name="Especialidad" value=" <%= medico.getIdEspecialidad().getNombre() %> ">        
                                                  <br><br>  

                                                 
                                       </form>
             <%-- Boton  --%>  
             <input type="submit" value="Borrar" name="Borrar"> 
                     
            <br>          
            <%-- Opcion volver --%>
            
            <a href="PanelAdminMedicos.jsp">Volver al panel administracion</a>
                                
                        
  
    </body>
</html>