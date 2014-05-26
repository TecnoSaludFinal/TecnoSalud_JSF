<%-- 
    Document   : NuevoFormulario
    Created on : 14-may-2014, 11:19:37
    Author     : JoseAntonio
--%>

<%@page import="app.entity.Pacientes"%>
<%@page import="java.util.Calendar"%>
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
        
						<h3 class="fl">Nuevo formulario</h3>
											
					  
<% //HistorialMedico lista = (HistorialMedico)request.getAttribute("lista");
                     List<TipoFormulario> lista = (List<TipoFormulario>) request.getAttribute("lista");
                    Calendar Cal= Calendar.getInstance(); 
                    String fec= Cal.get(Cal.YEAR)+"-"+(Cal.get(Cal.MONTH)+1)+"-"+Cal.get(Cal.DATE); 
                
                    String dni= (String) session.getAttribute("dni2");
                    String password = (String) session.getAttribute("password2"); 
                    
                    Pacientes p = (Pacientes) session.getAttribute("entidad");
                    Integer idRol = (Integer) session.getAttribute("id");
                    
                    if(lista != null)
                            {
                 %>

            
            <form name="new" action="http://localhost:8080/TecnoSalud_Final-war/nuevoFormulario" method="post">
           
           <fieldset>   
            <label> Nos encantaría conocer tu sugerencia para mejorar nuestro servicio. </label> 
            <br><br>
            <label> Rellena el siguiente formulario y le atenderemos personalmente. </label> 
            Tipo de Sugerencia 
            <br><br>
            
            
            <%-- OJO QUE EL NUSHA TIENE QUE SER EL SESSION --%>
            
            <input type="hidden" name="Nusha" value="<%= p.getNuhsa() %>">
            <input type="hidden" name="fec" value="<%=fec%>">
            <select name="listaFormulario">
            <% for(int i=0;i<lista.size();i++)		               
            {                
            %> 
               <option value="<%=lista.get(i).getIdTipoform()%>"><%=lista.get(i).getTipo()%></option>
            <%
            }
                            } %>>
            </select>
            <br><br>
            <br><textarea name="Comentario" rows="10" cols="40" value=""></textarea>
            <br><br>
     
            
            <%-- Botón buscar --%>
            <input type="submit" name="btnEnviar" value="Enviar">
	</fieldset>

            </form>
           
            
       
    </body>
</html>
