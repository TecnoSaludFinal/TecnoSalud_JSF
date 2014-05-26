<%-- 
    Document   : PanelConsultarCitas
    Created on : 14-may-2014, 13:49:50
    Author     : JoseAntonio
--%>

<%@page import="app.entity.Pacientes"%>
<html>
 <meta charset="utf-8">
	<title>TECNOSALUD</title>
	
	
    </head>
    <body>
        <a href="http://localhost:8080/TecnoSalud_Final-war/logoutServlet"> Salida </a>
        
						<h3 class="fl">Consulta de Citas</h3>
											
					</div> <!-- end content-module-heading -->    
                                        
                                        
<%
            
            Integer id = (Integer) session.getAttribute("id");
            
            if(id == 1)
            {
               // Pacientes p = (Pacientes) session.getAttribute("entidad");
        %>
            <form name="edit" action="" method="post">
               // <input type="hidden" name="Nusha" value="1">
           <fieldset>   
            <label> Eliga la opcion que desee realizar</label> 
            <br><br>
            <a href="ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br><br>
            <a href="buscarCitaporfecha.jsp">Consultar las citas en una fecha determinada</a> </td><br><br>
            <a href="ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br><br>
            <a href="ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br><br>
            <a href="buscarCitaporpaciente.jsp">Consultar las citas por paciente</a> </td> <br><br>  
            <a href="buscarCitapormedico.jsp">Consultar las citas por medico</a> </td> <br><br>
            </fieldset>

            </form>
            

<%--
<%  }if (session == "Administrador o administrativo")
                 { %>

--%>

            
            
           

 <%--           </form>
           
    <%  }%>     --%>   
       
    </body>
</html>

