<%-- 
    Document   : principal
    Created on : 16-may-2014, 11:19:48
    Author     : Deiver
--%>

<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.Administrador"%>
<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.Medicos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Página principal</title>
    </head>
    <body>
        <h1>Página principal</h1>
        
        <%
            
            Integer id = (Integer) session.getAttribute("id");
            
            if(id == 1)
            {
                Pacientes p = (Pacientes) session.getAttribute("entidad");
        %>
        <h1>Bienvenido: <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %></h1>
        
        <a href="faces/deiver_jsf/pacientePersonal.xhtml">Datos personales</a>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Citas</a>
        
        <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Consultar Historial médico</a>
         <h4>Consulta de Citas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br>
            <a href="jose/buscarCitaporfecha.jsp">Consultar las citas en una fecha determinada</a> </td><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br>
        <h4>Formularios/Quejas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/listar?do=cons">Crear nuevo formulario (Queja/Sugerencia)</a> </td><br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=personal&perfil=<%=p.getNuhsa()%>">Consultar historial de formularios personales</a> </td>  <br><br>   
        
        
        
        
        
        <%
            }    
            else if(id == 2)
            {
                Medicos m = (Medicos) session.getAttribute("entidad");
        %>
         <h1>Bienvenido: <%= m.getNombre() +" "+ m.getApellidos() +" -- "+ m.getIdRol().getTipoRol() %></h1>
         
        

        <a href =" faces/jose/ConsultarPerfil.xhtml">Datos personales</a></td><br>
        <a href =" faces/jose/CrearSolicitud.xhtml">Crear solicitud cambios de datos</a></td><br>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/consultarHistorial">Consultar Historial médico</a></td><br>

      
       <h4>Consulta de Citas</h4><br>
            <a href="ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br>
            <a href="jose/buscarCitaporfecha.jsp">Consultar las citas en una fecha determinada</a> </td><br>

        <%
            }
            else if(id == 3)
            {
                PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
        <h1>Bienvenido: <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %></h1>
        
        <a href="datosPersonales.jsp">Datos personales</a>
        <a href="http://localhost:8080/TecnoSalud_JSF-war/listado">Citas</a>
        
         <h4>Consulta de Citas</h4><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br><br>
            <a href="jose/buscarCitaporfecha.jsp">Consultar las citas en una fecha determinada</a> </td><br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br><br>
            <a href="jose/buscarCitaporpaciente.jsp">Consultar las citas por paciente</a> </td> <br><br>  
            <a href="jose/buscarCitapormedico.jsp">Consultar las citas por medico</a> </td> <br><br>
        
        <h4>Consulta de Pacientes</h4>
            <a href="arkadiusz/bienvenido.jsp">Menú de Pacientes</a> </td> <br><br>
        
        <%
            }
            else
            {
                Administrador a = (Administrador) session.getAttribute("entidad");
        %>
        
         <h1>Bienvenido: <%= a.getNombre() +" "+ a.getApellidos() +" -- "+ a.getIdRol().getTipoRol() %></h1>
        
        <a href="inma/PanelAdminMedicos.jsp">Panel de control de Medicos</a>
        <br>
        <a href="inma/PanelAdminPersonalAdmin.jsp">Panel de control de Personal Administrativo</a>
        <br>         
        <a href="faces/inma/ListadoMedicos.xhtml">Listado de Medicos del hospital</a>
        <br>         
        <a href="faces/inma/ListadoPA.xhtml">Listado del Personal Administrativo del hospital</a>
        <br>
        <a href="faces/inma/ListadoMensajes.xhtml">Listado de los mensajes</a>
        <br>
        
        
         <h4>Consulta de Citas</h4><br>

            <a href="http://localhost:8080/TecnoSalud_JSFl-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br><br>

            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=all">Consultar todas las citas a fecha de hoy</a> </td> <br><br>

            <a href="jose/buscarCitaporfecha.jsp">Consultar las citas en una fecha determinada</a> </td><br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pend">Consultar las citas próximas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarListadoCitas?do=pasa">Consultar las citas pasadas</a> </td> <br><br>
            <a href="jose/buscarCitaporpaciente.jsp">Consultar las citas por paciente</a> </td> <br><br>  
            <a href="jose/buscarCitapormedico.jsp">Consultar las citas por medico</a> </td> <br><br>

        <h4>Formularios/Quejas</h4><br>
            <a href="jose/especifico.jsp">Consultar formularios de paciente especifico</a> </td><br><br>   
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=all">Consultar todos los formularios recibidos</a> </td>  <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=quejas">Consultar los formularios de quejas</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=sug">Consultar los formularios de sugerencias</a> </td> <br><br>
            <a href="http://localhost:8080/TecnoSalud_JSF-war/ConsultarFormulario?do=feli">Consultar los formularios de felicitaciones</a> </td> <br><br>
        

        <%
            }
        %>
        
    </body>
</html>
