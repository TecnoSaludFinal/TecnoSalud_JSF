<%-- 
    Document   : ListadoCitas
    Created on : 05-may-2014, 11:03:34
    Author     : Deiver
--%>

<%@page import="app.entity.Pacientes"%>
<%@page import="app.entity.PeticionCita"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.util.List"%>
<%@page import="app.entity.Citas"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado citas</title>
    </head>
    <body>
        <h1>Listado de citas</h1>
        
        <%
            List<Citas> citas = (List<Citas>) request.getAttribute("citas");
            List<PeticionCita> pc = (List<PeticionCita>) request.getAttribute("petCitas");
            
            Pacientes p = (Pacientes) session.getAttribute("entidad");
        %>
        
        <br/><br/>
        <h1>Bienvenido: <%= p.getNombre() +" "+ p.getApellidos() +" -- "+ p.getIdRol().getTipoRol() %></h1>
        <br/><br/>
        
        <table border="1">
            <tr>
                <td>Médico</td>
                <td>Localización</td>
                <td>Fecha</td>
                <td>Hora</td>
                <td>Especialización</td>
            </tr>
            
            <%
                for(int i=0;i<citas.size();i++)
                {
                    Calendar cal = Calendar.getInstance();
                    cal.setTime(citas.get(i).getFecha());
                    Integer dia = cal.get(Calendar.DATE);
                    Integer mes = cal.get(Calendar.MONTH) + 1;
                    Integer anio = cal.get(Calendar.YEAR);
                    
                    Calendar hor = Calendar.getInstance();
                    hor.setTime(citas.get(i).getIdHora().getHora());
                    Integer hr = hor.get(Calendar.HOUR);
                    Integer mi = hor.get(Calendar.MINUTE);
                    Integer se = hor.get(Calendar.SECOND);
            %>
            
            <tr>
                <td><%= citas.get(i).getIdMedicos().getNombre() +" "+ citas.get(i).getIdMedicos().getApellidos() %></td>
                <td><%= citas.get(i).getLocalizacion() %></td>
                <td><%= dia+":"+mes+":"+anio %></td>
                <td><%= hr+":"+mi+":"+se %></td>
                <td><%= citas.get(i).getIdEspecialidad().getNombre() %></td>

            </tr>
            
            <%
                }
            %>
        </table>
        
        <br/><br/>
        
        <%
            if(!pc.isEmpty())
            {
        %>
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
                for(int i=0;i<pc.size();i++)
                {
                    Calendar hor = Calendar.getInstance();
                    hor.setTime(pc.get(i).getIdHora().getHora());
                    Integer hr = hor.get(Calendar.HOUR);
                    Integer mi = hor.get(Calendar.MINUTE);
                    Integer se = hor.get(Calendar.SECOND);
            %>
            
            <tr>
                <td><%= pc.get(i).getNuhsaPaciente().getNombre() +" "+ pc.get(i).getNuhsaPaciente().getApellidos() %></td>
                <td><%= pc.get(i).getIdTipo().getNombre() %></td>
                <td><%= pc.get(i).getFecha().toString() %></td>
                <td><%= hr+":"+mi+":"+se %></td>
                <td><%= pc.get(i).getComentario() %></td>
                <td><a href="eliminarPeticion?id=<%= pc.get(i).getIdPeticion() %>">Delete</a></td>
                <td><a href="modificarPeticion?id=<%= pc.get(i).getIdPeticion() %>">Modify</a></td>
                
                <%
                    }
                %>
            </tr>
        </table>
        <%
            }else
            {
        %>
        <h3>No hay datos que mostrar</h3>
        <%
            }
        %>
        
        
        <a href="http://localhost:8080/TecnoSalud_Final-war/listaEsp">Opciones cita</a>
        <a href="ConsultarListadoCitas?do=all">Mostrar citas de hoy</a>
    </body>
</html>
