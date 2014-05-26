<%-- 
    Document   : ConsultarFormulario
    Created on : 14-may-2014, 19:53:30
    Author     : JoseAntonio
--%>

<%@page import="app.entity.Pacientes"%>
<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="app.entity.Formulario"%>
<%@page import="app.entity.TipoFormulario"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="app.entity.TipoCita"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<html>
 <meta charset="utf-8">
	<title>TECNOSALUD</title>
	
	
    </head>
    <body>
        <a href="http://localhost:8080/TecnoSalud_Final-war/logoutServlet"> Salida </a>	
        
						<h3 class="fl">Formularios</h3>
											
					  
<% //HistorialMedico lista = (HistorialMedico)request.getAttribute("lista");
                     List<Formulario> listaFormularios = (List<Formulario>) request.getAttribute("listaFormularios");
                    String dni= (String) session.getAttribute("dni");
                    String password = (String) session.getAttribute("password");
                                    
                    if(listaFormularios != null)
                            {
                 %>

            
            <form name="new" action="http://localhost:8080/TecnoSalud_Final-war/ConsultarFormulario method="post">
           
           <fieldset>   
            <label> Seleccione la queja/sugerencia que desea consultar. </label> 
            <br><br>
           
             <table border="1">
            <tr>
                <td>Referencia Sugerencia</td>
                <td>Tipo de Formulario</td>
                <td>Fecha</td>
                <td>Descripcion</td>
                
            </tr>
            
            <%
                for(int i=0;i<listaFormularios.size();i++)
                {
               SimpleDateFormat sdf=new SimpleDateFormat("dd/MM/yyyy"); 
                          String Fecha = sdf.format(listaFormularios.get(i).getFecha());
                     
            %>
             
            <tr>
                <td><%= listaFormularios.get(i).getIdFormulario() %></td>
                <td><%= listaFormularios.get(i).getIdTipoform().getTipo() %></td>
                <td><%= Fecha %></td>
                <td><%= listaFormularios.get(i).getComentario() %></td>
                <td><a href="gestionFormularioPaciente?do=cons&perfil=<%=listaFormularios.get(i).getIdFormulario()%>">Consultar</a>
                <td><a href="gestionFormularioPaciente?do=elim&perfil=<%=listaFormularios.get(i).getIdFormulario()%>">Eliminar</a></td>
            </tr>
            
            <%
                }
                            }
            %>
        </table>
            <%-- Botón buscar --%>
            <input type="submit" name="btnEnviar" value="Enviar">
	</fieldset>

            </form>
           
            
       
    </body>
</html>

