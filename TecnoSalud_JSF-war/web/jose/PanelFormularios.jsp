<%-- 
    Document   : PanelFormularios
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
       
						<h3 class="fl">Formularios Quejas/Sugerencias</h3>
											
					  
                                        
                                        
<%-- aqui hay que controlar que rol accede 

<%  if (session == "Administrador o administrativo")
                 { %>
           
            <form name="edit" action="" method="post">
               // <input type="hidden" name="Nusha" value="1">
             
            <label for="nuhsa">Introduzca el numero de la seguridad social del paciente que desea consultar sus formularios:</label>
            <input type="text" name="nuhsa" value="">
            <br><br>

   


           <fieldset>   
            <label> Eliga la opcion que desee realizar</label> 
            <br><br>
            <a href="jose/especifico.jsp">Consultar formularios de paciente especifico</a> </td><br><br>   
            <a href="ConsultarFormulario?do=all">Consultar todos los formularios</a> </td>  <br><br>
            <a href="ConsultarFormulario?do=quejas">Consultar los formularios de quejas</a> </td> <br><br>
            <a href="ConsultarFormulario?do=sug">Consultar los formularios de sugerencias</a> </td> <br><br>
            <a href="ConsultarFormulario?do=feli">Consultar los formularios de felicitaciones</a> </td> <br><br>
            </fieldset>

            </form>


<%  }if (session == "Paciente")
                 { %>

--%>
<%
    
    String dni =(String) session.getAttribute("dni");
    String password =(String) session.getAttribute("password");
    Pacientes p = (Pacientes) session.getAttribute("entidad");
    Integer idRol = (Integer) session.getAttribute("id");
    
    
    %>
            
            
            <form name="edit" action="" method="post">
              <%--   <input type="hidden" name="Nusha" value="">
            OJO QUE HAY QUE BUSCAR EL NUSHA DEPENDIENDO DEL UUSARIO QUE ESTE CONECTADO --%>
           <fieldset>   
            <label> Eliga la opcion que desee realizar</label> 
            <br><br>
            <a href="listar?do=cons">Crear nuevo formulario (Queja/Sugerencia)</a> </td><br><br>
            <a href="ConsultarFormulario?do=personal">Consultar historial de formularios personales</a> </td>  <br><br>   
            
            </fieldset>

 <%--           </form>
           
    <%  }%>     --%>   
       
    </body>
</html>

