<%-- 
    Document   : modificar_paciente
    Created on : 2014-05-06, 10:18:01
    Author     : Administrator
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Pacientes"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                Pacientes paciente = (Pacientes) request.getAttribute("pac");
                PersonalAdministrativo personal = (PersonalAdministrativo) session.getAttribute("entidad");
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
        <% String error = (String) request.getAttribute("error");
            if(error != null)
            {
                out.println(error);
            }
        %>
        <form action="/TecnoSalud_Final-war/ModificarPaciente" method="POST">
            Nuhsa:
            <br>
            <input type="text" name="nuhsa" value="<%= paciente.getNuhsa() %>">
            <br>
            Nombre:
            <br>
            <input type="text" name="name" value="<%= paciente.getNombre() %>">
            <br>
            Apellidos:
            <br>
            <input type="text" name="surname" value="<%= paciente.getApellidos() %>">
            <br>
            Contrasena:
            <br>
            <input type="password" name="password" value="<%= paciente.getContrasena() %>"><br>
            DNI:
            <br>
            <input type="text" name="dni" value="<%= paciente.getDni() %>">
            <br>
            Direccion:
            <br>
            <input type="text" name="direction" value="<%= paciente.getDireccion() %>">
            <br>
            Fecha de nacimiento:
            <br>
            <input type="text" name="birthday" value="<%= paciente.getFechaNacimiento() %>">Formato: YYYY-MM-DD
            <br>
            <INPUT TYPE="SUBMIT" VALUE="Modificar">
      
        </form>
           </div>
        </div>
   
    </body>
</html>
