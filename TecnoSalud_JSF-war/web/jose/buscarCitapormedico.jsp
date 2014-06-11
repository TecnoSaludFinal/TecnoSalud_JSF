<%-- 
    Document   : buscarporpaciente
    Created on : 15-may-2014, 2:49:56
    Author     : JoseAntonio
--%>

<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.Medicos"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.entity.Citas"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />        
	<title>Historial paciente</title>
	<script	type="text/javascript">	</script>
        <link rel="stylesheet" href="estilo/style.css" type="text/css">
        
	
    </head>
    <body>
            <% 
                
                List<Citas> listaCitas = (List<Citas>) request.getAttribute("listaCitas");
                List<Medicos> listaMedico = (List<Medicos>) request.getAttribute("listaMedico");
                List<Medicos> listacompleta = (List<Medicos>) request.getAttribute("listacompleta");
                String valor = (String) request.getAttribute("valor");
                String dni= (String) session.getAttribute("dni2");
                Integer idRol = (Integer) session.getAttribute("id");
                    String password = (String) session.getAttribute("password2");
           
                %>
<!-- navigation --> 
           <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
                    <div id="trees"></div>
            </div>
            
            <!-- navigation -->
            <% if (idRol==1)
                          {  
                          Pacientes p = (Pacientes) session.getAttribute("entidad");%>
                          
                                
                                 <div id="navcontainer">
                   
        <ul class="mi-menu">
          <li><a href="principal.jsp"> Inicio </a></li>
          <li>
            <a href="#">Perfil</a>
           <ul>
          <li> <a href="faces/deiver_jsf/pacientePersonal.xhtml">Datos personales</a></li>
          
           </ul>
          </li>
          <li><a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Historial Médico</a></li>
          <li>
            <a href="#"> Consulta de Citas </a>
            <ul>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Gestión citas</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Citas para hoy</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Buscar por próximas</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Buscar por pasadas</a> </li>
           </ul>
          </li>
          <li>
            <a href="#"> Formularios/Quejas </a>
            <ul>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listar?do=cons">Nuevo formulario)</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=personal&perfil=<%=p.getNuhsa()%>">Historial formulario personales</a> </li>   
        </ul>
        </div>

            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %>
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>
            
            <!-- topoffers -->
            <div id="topoffers">
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        
                        <div id="estate1-box">
                          <h3> Datos Personales </h3>
                         <a href=faces/deiver_jsf/pacientePersonal.xhtml"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                         <p> Pinchando en este enlace podrás consultar sus datos personales.<br/><br/>
                        </div>
                        
                        <div id="estate2-box">
                            <h3> Historial Paciente </h3>
                            <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p> Pinchando en este enlace podrás consultar su historial médico.<br/><br/>
                                <%--AQUI PONGO LA DIRRECCION--%>
                        </div>
                        <div id="estate2-box">
                            <h3> Mostrar citas de hoy </h3>
                             <a href="ConsultarListadoCitas?do=all"><img src="estilo/images/consultar.jpg" alt="Deluxe Properties" /></a>
                             <p> Pinchando en este enlace podrás consultar el día de hoy <br/><br/><br/><br/>
                        </div>
                                 <div id="estate4-box">
                             <h3> Gestión citas</h3>
                             <a href="http://localhost:8080/TecnoSalud_JSF-war/listado"><img src="estilo/images/consultar.jpg" alt="Deluxe Properties" /></a>
                             <p> Pinchando en este enlace podrás gestionar todas tus citas <br/><br/><br/><br/>
                            
                        </div>
                                                <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div>   
        
     
                         <%} 
                          else if (idRol==2)
                         { 
                               Medicos m = (Medicos) session.getAttribute("entidad");%>
                          
                         
                           <div id="navcontainer">
                   
        <ul class="mi-menu">
          <li><a href="principal.jsp"> Inicio </a></li>
          <li>
            <a href="#">Perfil</a>
           <ul>
          <li><a href =" faces/jose/ConsultarPerfil.xhtml">Datos personales</a></li>
          <li><a href =" faces/jose/CrearSolicitud.xhtml">Crear solicitud cambios de datos</a></li>
           </ul>
          </li>
          <li><a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Historial Médico</a></li>
          <li>
            <a href="#"> Consulta de Citas </a>
            <ul>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Citas para hoy</a></li><br>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>

            </ul>
          </li>
        </ul>
        </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= m.getNombre() +" "+ m.getApellidos() +" -- "+ m.getIdRol().getTipoRol() %>
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>
            
            <!-- topoffers -->
            <div id="topoffers">
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        
                        <div id="estate1-box">
                            <h3> Consultar historial paciente </h3>
                            <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p> Pinchando en este enlace podrás consultar el historial personal de un paciente.<br/><br/>
                        </div>
                        <div id="estate2-box">
                            <h3> Mostrar citas de hoy </h3>
                             <a href="ConsultarListadoCitas?do=all"><img src="estilo/images/consultar.jpg" alt="Deluxe Properties" /></a>
                             <p> Si quieres ver las citas que tienes para el día de hoy <br/><br/><br/><br/>
                        </div>
                        <div id="estate3-box">
                            <h3> Perfil </h3>
                            <a href=" faces/jose/ConsultarPerfil.xhtml"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p> Pinchando en este enlace podrás consultar sus datos personales.<br/><br/>
                                <%--AQUI PONGO LA DIRRECCION--%>
                        </div>
                                 <div id="estate4-box">
                            <h3> Buscar cita </h3>
                            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p> Pinchando en este enlace podrás consultar las citas para una fecha deseada.<br/><br/>
                        </div>
                                                <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div>   
        
     
                          <%} 
                          else if (idRol==3)
                         { 
                            PersonalAdministrativo ad = (PersonalAdministrativo) session.getAttribute("entidad");%>
                          
                         
                          <div id="navcontainer">
                   
        <ul class="mi-menu">
          <li><a href="principal.jsp"> Inicio </a></li>
          <li>
            <a href="#">Perfil</a>
           <ul>
          <li><a href =" #">Datos personales</a></li>
          <li><a href =" #">Crear solicitud cambios de datos</a></li>
           </ul>
          </li>
          <li><a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Historial Médico</a></li>
          <li>
            <a href="#"> Consulta de Citas </a>
            <ul>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Gestión citas</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Citas para hoy</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Buscar próximas</a></li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Buscar pasadas</a> </li>
                <li> <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=paci">Buscar por paciente</a> </li>
                <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi">Buscar por médico</a> </li>
            </ul>
          </li>
           <li>
            <a href="#">Pacientes</a>
           <ul>
            <li><a href =" arkadiusz/bienvenido.jsp">Menu de Pacientes</a></li>
           </ul>
          </li>
        </ul>
        </div>
            <div class="search">  
        
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        <%= ad.getNombre() +" "+ ad.getApellidos() +" -- "+ ad.getIdRol().getTipoRol() %>
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>
            
            <!-- topoffers -->
            <div id="topoffers">
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        
                        <div id="estate1-box">
                            <h3> Gestión citas</h3>
                             <a href="http://localhost:8080/TecnoSalud_JSF-war/listado"><img src="estilo/images/consultar.jpg" alt="Deluxe Properties" /></a>
                             <p> Pinchando en este enlace podrás gestionar todas tus citas <br/><br/><br/><br/>
                        </div>
                        
                        <div id="estate2-box">
                             <h3> Mostrar citas de hoy </h3>
                             <a href="ConsultarListadoCitas?do=all"><img src="estilo/images/consultar.jpg" alt="Deluxe Properties" /></a>
                             <p> Si quieres ver las citas que tienes para el día de hoy <br/><br/><br/><br/>
                                <%--AQUI PONGO LA DIRRECCION--%>
                        </div>
                        <div id="estate3-box">
                           <h3> Perfil </h3>
                            <a href=" # "><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p> Pinchando en este enlace podrás consultar sus datos personales.<br/><br/>
                        </div>
                                 <div id="estate4-box">
                            <h3> FALTA </h3>
                            <a href="#"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p> Pinchando en este enlace podrás consultar el historial personal de un paciente.<br/><br/>
                        </div>
                                                <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href=""><img src="estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div>   
        
                          <%} 
                          else if (idRol==4)
                         { 
                              Administrador a = (Administrador) session.getAttribute("entidad");%>
                          
                         
                          <!-- navigation -->
            <div id="navcontainer">
                   
                    <ul class="mi-menu">
                        <li><a href="principal.jsp"> Inicio </a></li>
                     
                             <li>
                            <a href="#"> Citas </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Gestión citas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Buscar para hoy</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=fec">Buscar por fecha determinada</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Buscar próximas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Buscar pasadas</a> </li>
                            <li> <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=paci">Buscar por paciente</a> </li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi">Buscar por médico</a> </li>
                        
                            </ul>
                     </li>
                     <li><a href="ListadoMensajes.xhtml">Mensajes</a>
                            
                            <li>
                        <a href="#"> Formularios </a>
                        <ul>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=all">Consultar todos los formularios recibidos</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=quejas">Consultar los formularios de quejas</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=sug">Consultar los formularios de sugerencias</a></li>
                            <li><a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=feli">Consultar los formularios de felicitaciones</a></li>                               
                        
                            </ul>
                      </li>
                            <li>
                            <a href="#">Listados</a>
                                <ul>
                                <li><a href="face/inma/ListadoMedicos.xhtml">Listado de Medicos del hospital</a></li>
                                <li><a href="face/inma/ListadoPA.xhtml">Listado de Personal Administrativo del hospital</a></li>
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
                <div id="topoffers-left-arrow"><a href=""><img src="estilo/images/arrow_left.jpg" alt="more" /></a></div>
                <div id="topoffers-content">
                    <div id="topoffers-content-box">
                        <div id="estate1-box">
                            <h3>Consultar Personal Administrativo</h3>
                            <a href="inma/ConsultarPersonalAdmin.jsp"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrás consultar los datos personales del personal
                                administrativo del hospital.<br/><br/>
                              
                        </div>
                        <div id="estate2-box">
                            <h3>Consultar Médico</h3>
                             <a href="inma/ConsultarMedico.jsp"><img src="estilo/images/consultar.jpg" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrás consultar los datos personales de medico.<br/><br/>
                             
                        </div>
                        <div id="estate3-box">
                            <h3>Crear Médico</h3>
                           <a href="inma/NuevoMedico.jsp"> <img src="estilo/images/crear_nuevo.jpg" alt="Deluxe Properties" /></a>
                            <p>Pinchando en este enlace podrás dar de alta a un médico nuevo<br/><br/><br/><br/>
                               
                        </div>
                        <div id="estate4-box">
                             <h3>Crear Personal Administrativo</h3>
                             <a href="inma/NuevoPersonalAdmin.jsp"><img src="estilo/images/crear_nuevo.jpg" alt="Commercial Properties" /></a>
                            <p>Pinchando en este enlace podrás dar de alta a un nuevo personal administrativo del hospital.<br/><br/>
                               
                            
                        </div>
                        
                        
                        <div class="clear"></div>
                    </div>
                </div>
                <div id="topoffers-right-arrow"><a href><img src="estilo/images/arrow_right.jpg" alt="more" /></a></div>
            </div>
            <div class="clear"></div> 
 <%} %>

                        <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                        
<%
     if(listaCitas==null && listaMedico == null)
              
                {%> 
 <form name="edit" action="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=medi" method="post">
            <%-- Datos del paciente a buscar --%>
         <div class="property">
            <div class="property_left">
              </div>
                <div class="clear"></div>
                  </div> 
               
            <label> Selecciona los apellidos del médico que desea buscar:</label> 
            <br><br>
            
           
            <select name="apellidos">
            <% for(int i=0;i<listacompleta.size();i++)		               
            {                
            %> 
            <option  value="<%= listacompleta.get(i).getApellidos() %>" ><%= listacompleta.get(i).getNombre() + " " + listacompleta.get(i).getApellidos()%></option>
            <%
            }
                %>
            </select>
           
             <div>
                 <br>
            <%-- Botón buscar --%>
            <input type="submit" name="btnBuscar" value="Buscar">
	</div>
            </form>
           
            <%}
           if (listaMedico != null)
                {%>
                <h2 class="fl">Listado Medicos</h2>
                <table border="1" width=100%>
                    
                        <tr>
                          <td><strong>Identificador</strong></td>
                          <td><strong>Medico</strong></td>
                          <td><strong>Especialidad</strong></td>
                                                 </tr>
                         
                         <div class="property">
                        <%
                for(int i=0;i<listaMedico.size();i++)
                { %>
           
                 <div class="property_left">
                          <tr>          
                         <td> <%= listaMedico.get(i).getIdMedicos()%></td>
                         <td> <%= listaMedico.get(i).getNombre() + " " + listaMedico.get(i).getApellidos()  %></td>
                         <td> <%= listaMedico.get(i).getIdEspecialidad().getNombre()%></td>
                         <td> <a href="ConsultarListadoCitas?do=medi&perfil=<%=listaMedico.get(i).getIdMedicos()%>">Filtrar...</a> </td>
                         </tr>
                         </div>
                                    <div class="clear"></div>
                                
                           
                                    
              <%
                }%>
              </div> </table>      
              <%  }
                if (listaCitas != null)
                {%> 
                
                    <%----%>
                    <br><h2 class="fl">Listado Citas</h2>
                <table border="1" width=100%>
                   
                        <tr>
                          <td><strong>Cita</strong></td>
                          <td><strong>NUSS</strong></td>
                          <td><strong>Paciente</strong></td>
                          
                          <td><strong>Medico</strong></td>
                          <td><strong>Fecha</strong></td>
                          <td><strong>Hora</strong></td>
                          <td><strong>Especialidad</strong></td>
                          <td><strong>Consulta</strong></td>
                        </tr>  
                          <div class="property"></div>
                        <%
                for(int i=0;i<listaCitas.size();i++)
                {    
                   SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); 
                   String Fecha = sdf.format(listaCitas.get(i).getFecha());
                          
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(listaCitas.get(i).getIdHora().getHora());
                    Integer hr = cal.get(Calendar.HOUR);
                    Integer mi = cal.get(Calendar.MINUTE);
                    Integer se = cal.get(Calendar.SECOND);
                %>
                         
                                    <div class="property_left"> </div>
                
                        
                         <tr>
                         <td> <%= listaCitas.get(i).getIdCitas()%></td>
                         <td> <%= listaCitas.get(i).getNushaPaciente().getNuhsa() %></td>
                         <td> <%= listaCitas.get(i).getNushaPaciente().getNombre() + " " + listaCitas.get(i).getNushaPaciente().getApellidos() %></td>
                         <td> <%= listaCitas.get(i).getIdMedicos().getNombre() + " " + listaCitas.get(i).getIdMedicos().getApellidos() %></td>
                         <td> <%= Fecha %></td>
                         <td> <%= hr + ":"+mi+":"+se %></td>
                         <td> <%= listaCitas.get(i).getIdEspecialidad().getNombre() %></td>
                         <td> <%= listaCitas.get(i).getLocalizacion() %></td>
                    <%
                }
                    
                }
                    
                    %>
       </tr>
                    <div class="clear"></div>
                                
                            </table>
</div>
                </div>
            </div>
            <div id="pravy-stlpec-box">
                <div id="pravy-stlpec">
                    <div id="find_property">
                        <form id="form_163050" class="appnitro"  method="post" action="#">
                            <h2>Buscar por...</h2>
                            <div>
                                    <label class="description" for="element_1">Country </label>
                            </div>
                            <div>
                                    <select class="element select medium" id="element_1" name="element_1">
                                            <option value="1" selected="selected">- Select -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_2">City </label>  
                            </div>
                            <div>
                                    <select class="element select medium" id="element_2" name="element_2">
                                            <option value="1" selected="selected">- Select -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_3">Zip code </label>
                            </div>
                            <div>
                                    <select class="element select medium" id="element_3" name="element_3">
                                            <option value="1" selected="selected">- Select -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_4">Price </label>
                            </div>
                            <div>
                                    <select class="element select small" id="element_4" name="element_4">
                                            <option value="1" selected="selected">- Min -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_5">Price </label>
                            </div>
                            <div>
                                    <select class="element select small" id="element_5" name="element_5">
                                            <option value="1" selected="selected">- Max -</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <label class="description" for="element_6">Bedrooms </label>
                            </div>
                            <div>
                                    <select class="element select small" id="element_6" name="element_6">
                                            <option value="1" selected="selected">2</option>
                                            <option value="2">Second option</option>
                                            <option value="3">Third option</option>
                                    </select>
                            </div>
                            <div class="clear"></div>
                            <div>
                                    <input id="saveForm" class="button_text" type="submit" name="submit" value="Submit" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            
        </div>
        <div class="clear"></div>
        <!-- footer -->
		<div id="footer">
			<p>M&aacute;s <a href="http://www.mejoresplantillasgratis.es" title="MPG - plantillas web y plantillas Flash" target="_blank">Plantillas Web Gratis</a> en MPG.</p>
			<p><a href="http://www.x-reality.sk">xreality</a></p>
		</div>
                    
                    
    </body>
</html>
