<%-- 
    Document   : consultar_paciente
    Created on : 2014-05-08, 21:47:04
    Author     : Administrator
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Pacientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Personal Administrativo</title>
        <link rel="Stylesheet" type="text/css" href="/TecnoSalud_Final-war/arkadiusz/style.css" />
    </head>
    <body>
        <%
            Pacientes paciente = (Pacientes) request.getAttribute("pac");
            PersonalAdministrativo personal = (PersonalAdministrativo) session.getAttribute("entidad");
            
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            String fecha = sdf.format(paciente.getFechaNacimiento());
        
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
                <tr>
                  <td><a href="/TecnoSalud_Final-war/arkadiusz/consultar_paciente.jsp"> <%= paciente.getNuhsa() %></a></td>
                  <td><%= paciente.getNombre() %></td>
                  <td><%= paciente.getApellidos() %></td>
                  <td><%= paciente.getContrasena() %></td>
                  <td><%= paciente.getDni() %></td>
                  <td><%= paciente.getDireccion() %></td>
                  <td><%= fecha %></td>
                  <td><a href="/TecnoSalud_Final-war/ModificarPaciente2?nuhsa=<%= paciente.getNuhsa() %>">Modify</a></td>
                  <td><a href="/TecnoSalud_Final-war/BorrarPaciente?nuhsa=<%= paciente.getNuhsa() %>">Delete</a></td>
                  
                </tr>
              
            </table>
            </div>
        </div>
    </body>
</html>
