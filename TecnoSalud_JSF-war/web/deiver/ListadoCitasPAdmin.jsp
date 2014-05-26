<%-- 
    Document   : ListadoCitasPAdmin
    Created on : 13-may-2014, 10:04:10
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
<%@page import="app.entity.PeticionCita"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ListadoCitas-PA</title>
    </head>
    <body>
        <h1>Listado de citas - Personal Administrador</h1>
        
        <%
            List<Citas> citas = (List<Citas>) request.getAttribute("citas");
            List<PeticionCita> peticion = (List<PeticionCita>) request.getAttribute("petCitas");
            
            PersonalAdministrativo pa = (PersonalAdministrativo) session.getAttribute("entidad");
        %>
        
        <br/><br/>
        <h1>Bienvenido: <%= pa.getNombre() +" "+ pa.getApellidos() +" -- "+ pa.getIdRol().getTipoRol() %></h1>
        <br/><br/>
        
        <table border="1">
            <tr>
                <td>Paciente</td>
                <td>Fecha</td>
                <td>Hora</td>
                <td>Consulta</td>
                <td>Eliminar</td>
                <td>Modificar</td>
                <td>Crear</td>
            </tr>
            
            <%
                for(int i=0;i<citas.size();i++)
                {
            %>
            
            <tr>
                <td><%= citas.get(i).getNushaPaciente().getNombre() + " " + citas.get(i).getNushaPaciente().getApellidos() %></td>
                <td><%= citas.get(i).getFecha().toString() %></td>
                <td><%= citas.get(i).getIdHora().getHora().toString() %></td>
                <td><%= citas.get(i).getLocalizacion() %></td>
                <td><a href="eliminar?id=<%= citas.get(i).getIdCitas() %>">Delete</a></td>
                <td><a href="modificar?id=<%= citas.get(i).getIdCitas() %>">Modify</a></td>
            </tr>
            
            <%
                }
            %>
        </table>
        
        <br/><br/><br/>
        
        <table border="1">
            <tr>
                <td>Paciente</td>
                <td>Tipo</td>
                <td>Fecha</td>
                <td>Hora</td>
                <td>Comentario</td>
                <td>Eliminar</td>
                <td>Modificar</td>
                <td>Crear cita</td>
            </tr>
            
            <%
                for(int i=0;i<peticion.size();i++)
                {
            %>
            
            <tr>
                <td><%= peticion.get(i).getNuhsaPaciente().getNombre() +" "+ peticion.get(i).getNuhsaPaciente().getApellidos() %></td>
                <td><%= peticion.get(i).getIdTipo().getNombre() %></td>
                <td><%= peticion.get(i).getFecha().toString() %></td>
                <td><%= peticion.get(i).getIdHora().getHora().toString() %></td>
                <td><%= peticion.get(i).getComentario() %></td>
                <td><a href="eliminarPeticion?id=<%= peticion.get(i).getIdPeticion() %>">Delete</a></td>
                <td><a href="modificarPeticion?id=<%= peticion.get(i).getIdPeticion() %>">Modify</a></td>
                <%
                    if(peticion.get(i).getIdTipo().getNombre().equals("Crear"))
                    {
                %>
                <td><a href="enviarAnadirCita">Create</a></td>
                <%
                    }
                    else
                    {
                %>
                <td></td>
                <%
                    }
                %>
            </tr>
            
            <%
                }
            %>
        </table>
    </body>
</html>
