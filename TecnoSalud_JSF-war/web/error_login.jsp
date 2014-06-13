<%-- 
    Document   : error_login
    Created on : 05-may-2014, 11:03:34
    Author     : Deiver
--%>

<%@page import="app.entity.PersonalAdministrativo"%>
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
        <meta http-equiv="Content-Type"	content="text/html;	charset=windows-1250" />
	<meta http-equiv="Content-Language" content="sk" />
        <title>Error</title>
        <script	type="text/javascript"></script>
        <link rel="stylesheet" href="estilo/style.css">
    </head>
    <body>
        <div id="kontainer">
            <!-- header -->
            <div id="header">
                    <div id="logo"><a href=""><img  src="estilo/images/logo_1.jpg" alt="Real Estate" /></a></div>
                    <div id="trees"></div>
            </div>
            
            <!-- navigation -->
            <div id="navcontainer">  
               <output type="text" class="searchbox" name="s">
                    Error al loguearte!
                </output>
            </div>
            <div class="search">
                <div id="searchwrapper">
                    <output type="text" class="searchbox" name="s">
                        Sin sesión!
                    </output>
                </div>
            </div>
            <div class="clear"></div>
            <div class="ic"></div>

            <!-- body -->
            <div id="lavy-stlpec-box">
                <div id="lavy-stlpec">
                    <div id="latest_properties">
                        <h2>Error!</h2>
                        <div class="property">
                            <div class="property_left">
                                ¡Se ha producido algún problema al intentar loguearte!<br/>
                                Comprueba que tus datos esten bien introducidos...
                            </div>
                            <div class="clear"></div>
                        </div>    
                    </div>
                </div>
            </div>
        </div>
        <div class="clear"></div>
        <!-- footer -->
        <div id="footer">
                <p>M&aacute;s <a href="http://www.mejoresplantillasgratis.es" title="MPG - plantillas web y plantillas Flash" target="_blank">Plantillas Web Gratis</a> en MPG.</p>
                <p><a href="http://www.x-reality.sk">xreality</a></p>
        </div>
    </body>
</html>
