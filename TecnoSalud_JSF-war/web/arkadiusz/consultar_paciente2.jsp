<%-- 
    Document   : consultar_paciente2
    Created on : 2014-05-10, 20:43:09
    Author     : Administrator
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Panel Administrativo</title>
        <link rel="Stylesheet" type="text/css" href="/TecnoSalud_Final-war/arkadiusz/style.css" />
    </head>
    <body>
         <%
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
            <form action="../ConsultarPaciente" method="POST">
                NUHSA:
                <br>
                <input type="text" name="nuhsa"><br>
                <INPUT TYPE="SUBMIT" VALUE="Mostrar Datos">
            </form>
            </div>
        </div>
    </body>
</html>
