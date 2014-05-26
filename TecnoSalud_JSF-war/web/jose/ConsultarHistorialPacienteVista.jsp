<%-- 
    Document   : ConsultarHistorialPacienteVista
    Created on : 28-abr-2014, 19:42:22
    Author     : JoseAntonio
--%>

<%@page import="app.entity.Medicos"%>
<%@page import="app.entity.Pacientes"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.HistorialMedico"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <meta charset="utf-8">
	<title>TECNOSALUD</title>
	
	
    </head>
    <body>
        <a href="http://localhost:8080/TecnoSalud_Final-war/logoutServlet"> Salida </a>
        
						<h3 class="fl">Listado Historial Médico</h3>
											
				

  		
                
                <% //HistorialMedico lista = (HistorialMedico)request.getAttribute("lista");
                     List<HistorialMedico> lista = (List<HistorialMedico>) request.getAttribute("lista");
                    String dni= (String) session.getAttribute("dni2");
                    String password = (String) session.getAttribute("password2");
                    //Pacientes p = (Pacientes) session.getAttribute("entidad");
                    Integer idRol = (Integer) session.getAttribute("id");
                    if(lista == null)
                            {
                 %>
                 <tr>
                     <tr>
                          <td><strong>Nombre</strong></td>
                          <td><strong>Apellidos</strong></td>
                          <td><strong>HistorialMedico</strong></td>
                     </tr>   
                        <td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                 </tr>
                        
                 <%
                    }
                    else
                    {
                        
             
                        for(int i=0;i<lista.size();i++)
                {    
                    
                %>
                        <table border="1">
                        <tr>
                          <td><strong>Numero Seguridad Social</strong></td>
                          <td><strong>Nombre</strong></td>
                          <td><strong>Apellidos</strong></td>
                          <td><strong>HistorialMedico</strong></td>
                        </tr> 
                        
                         <tr>
                          <td> <%= lista.get(i).getNuhsaPaciente().getNuhsa()%></td>
                          <td> <%= lista.get(i).getNuhsaPaciente().getNombre() %></td>
                          <td> <%= lista.get(i).getNuhsaPaciente().getApellidos() %> </td>
                          <td><%= lista.get(i).getDescripcion() %></td>
                          <% if (idRol==1)
                          {
                              %>
                               <td> <a href="gestionHistorialPaciente?do=cons&perfil=<%=lista.get(i).getNuhsaPaciente().getNuhsa()%>">Consultar</a> </td>
                         <%} 
                          else if (idRol==2)
                         { %>
                          
                          <td> <a href="gestionHistorialPaciente?do=cons&perfil=<%=lista.get(i).getNuhsaPaciente().getNuhsa()%>">Consultar</a> </td>
                          <td> <a href="gestionHistorialPaciente?do=editar&perfil=<%=lista.get(i).getNuhsaPaciente().getNuhsa()%>">Modificar</a> </td>
                          
                          <%} %>
                        </tr> 
                
                         </table>
 
                <%      }
                    }         
                                          %>
                    
	
  		</tbody>
  	</table>
            
       
    </body>
</html>
