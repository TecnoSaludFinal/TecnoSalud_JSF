<%-- 
    Document   : crear_paciente
    Created on : 2014-05-06, 10:16:01
    Author     : Administrator
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width">
        <title>Personal Administrativo</title>
        <link rel="Stylesheet" type="text/css" href="/TecnoSalud_JSF-war/arkadiusz/style.css" />
    </head>
    <body>
        <%
             PersonalAdministrativo personal = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
      <div id = logo>
            <h1> PERSONAL ADMINISTRATIVO</h1>
              <a href="/TecnoSalud_JSF-war/PersonalAdministrativoLogout" id=logout> Salida </a> 
              <b id = logout><%= personal.getApellidos() + " " + personal.getNombre()+ " " %></b>
              <br>
        </div>
        <div id = pagina_principal>
            <div id = menu>
                <a href ="/TecnoSalud_JSF-war/arkadiusz/crear_paciente.jsp"> Crear Paciente </a>
                <br>
                <a href ="/TecnoSalud_JSF-war/arkadiusz/consultar_paciente2.jsp"> Consultar Paciente</a>
                <br>
                <a href ="/TecnoSalud_JSF-war/ListadoPacientes"> Listar pacientes</a>
            </div>
            <div id = centro>
            <br>
            <% String error = (String) request.getAttribute("error");
            if(error != null)
            {
                out.println(error);
            }
            %>
            <form action="/TecnoSalud_JSF-war/CrearPaciente" method="POST">
                NUHSA:
                <br>
                <input type="text" name="nuhsa"><br>
                Nombre:
                <br>
                <input type="text" name="name" ><br>
                Apellidos:
                <br>
                <input type="text" name="surname"><br>
                Contrasena:
                <br>
                <input type="password" name="password"><br>
                DNI:
                <br>
                <input type="text" name="dni"><br>
                Direccion:
                <br>
                <input type="text" name="direction"><br>
                Fecha de nacimiento:
                <br>
                <input type="text" name="birthday"> Formato: YYYY-MM-DD<br>
                <INPUT TYPE="SUBMIT" VALUE="Crear">
        
            </form>
            </div>
        </div>
    </body>
</html>
