<%-- 
    Document   : consultar_paciente
    Created on : 2014-05-08, 21:47:04
    Author     : Administrator
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="app.entity.Pacientes"%>
<%@page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <title>Personal Administrativo</title>
        <link rel="Stylesheet" type="text/css" href="/TecnoSalud_Final-war/arkadiusz/style.css" />
    </head>    
    <body>
        <%
            PersonalAdministrativo personal = (PersonalAdministrativo) session.getAttribute("entidad");
            List<Pacientes> pacientes = (List<Pacientes>) request.getAttribute("pac");
        %>
              <div id = logo>
            <h1> PERSONAL ADMINISTRATIVO</h1>
              <a href="/TecnoSalud_Final-war/PersonalAdministrativoLogout" id=logout> Salida </a> 
              <b id = logout><%= personal.getApellidos() + " " + personal.getNombre()+ " " %></b>
              <br>
        </div>
        <div id = pagina_principal>
            <div id = menu>
                <a href ="/TecnoSalud_Final-war/arkadiusz/crear_paciente.jsp"> Crear Paciente </a>
                <br>
                <a href ="/TecnoSalud_Final-war/arkadiusz/consultar_paciente2.jsp"> Consultar Paciente</a>
                <br>
                <a href ="/TecnoSalud_Final-war/ListadoPacientes"> Listar pacientes</a>
            </div>
            <div id = centro>
  
        
            <br>
        <a href ="/TecnoSalud_Final-war/OrdenPacientesFecha"> Orden por Fecha</a>
            <table border = 1>
                <th>Nuhsa</th>
                <th>Nombre </th>
                <th>Apellidos</th>
                <th>Contrasena </th>
                <th>Dni </th>
                <th>Direccion </th>
                <th>Fecha de nacimiento </th>
                <th>Modificar</th>
                <th>Eliminar</th>
                <%
                for(int i = 0; i < pacientes.size(); i++)
                {
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    String fecha = sdf.format(pacientes.get(i).getFechaNacimiento());
                %>

                   
               <tr>
                  <td><a href="./ConsultarPaciente?nuhsa=<%= pacientes.get(i).getNuhsa() %>"> <%= pacientes.get(i).getNuhsa() %></a></td>
                  <td><%= pacientes.get(i).getNombre() %></td>
                  <td><%= pacientes.get(i).getApellidos() %></td>
                  <td><%= pacientes.get(i).getContrasena() %></td>
                  <td><%= pacientes.get(i).getDni() %></td>
                  <td><%= pacientes.get(i).getDireccion() %></td>
                  <td><%= fecha %></td>
                  <td><a href="./ModificarPaciente2?nuhsa=<%= pacientes.get(i).getNuhsa() %>">Modify</a></td>
                  <td><a href="./BorrarPaciente?nuhsa=<%= pacientes.get(i).getNuhsa() %>">Delete</a></td>

               </tr>
            <% } %>
        
            </table>
            </div>
        </div>
           
            
    </body>
</html>