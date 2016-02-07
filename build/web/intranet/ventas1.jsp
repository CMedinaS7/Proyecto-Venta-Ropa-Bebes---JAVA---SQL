

<%
            HttpSession sesion = request.getSession(true);
            String Usuario = (String) sesion.getAttribute("nombres") + " " + (String) sesion.getAttribute("apellidos");
            String Cargo = (String) sesion.getAttribute("cargo");
	    String Foto = (String) sesion.getAttribute("foto");
            if ((String) sesion.getAttribute("nombres") == null) {
                response.sendRedirect("login.jsp?e=1");
            }
            String resp=request.getParameter("resp");
			String che=request.getParameter("cod");
                        int pag=Integer.parseInt(request.getParameter("pag"));
%>

<%@page contentType="text/html" pageEncoding="UTF-8"  import=" Dao.conexion,java.sql.*,java.util.Date"%>
<!DOCTYPE html>
<html>
    <!--[if lt IE 7]><html class="no-js ie6 oldie" lang=en><![endif]--> <!--[if IE 7]><html class="no-js ie7 oldie" lang=en><![endif]--> <!--[if IE 8]><html class="no-js ie8 oldie" lang=en><![endif]--> <!--[if gt IE 8]><!--> <html class=no-js lang=en> <!--<![endif]--> 
<head> 
<meta charset=utf-8>
<link rel=dns-prefetch href="http://fonts.googleapis.com/">
<meta http-equiv=X-UA-Compatible content="IE=edge,chrome=1">
<title>Intranet :: BABYMODAS ::</title>
<link rel="icon" type="image/png" href="image/icono.png" />
<meta name=description content=""> <meta name=author content="">
<meta name=viewport content="width=device-width,initial-scale=1">
<link rel=stylesheet href='css/c11f8f1b6c157a7a1ee04039d038c282336416b9.css'>
<link href="http://fonts.googleapis.com/css?family=PT+Sans" rel=stylesheet type="text/css">
<script src="js/libs/modernizr-2.0.6.min.js"></script>
</head>
<body id=top>
<div id=container>
<div id=header-surround>
<header id=header><img src="img/logo.png" alt=Grape class=logo>
<div class="divider-header divider-vertical"></div>
<a href="javascript:void(0);" onClick="$('#info-dialog').dialog({ modal: true });">
<span class=btn-info></span></a>
<ul class=toolbox-header>
  <li> <a rel=tooltip title="Crear Usuario" class=toolbox-action href="javascript:void(0);"><span class=i-24-user-business></span></a>
    <div class=toolbox-content>
      <div class=block-border>
        <div class="block-header small">
          <h1>Asignar Usuario</h1>
        </div>
        <form id=create-user-form2 class="block-content form" action="#" method=post>
          <div class=_100>
            <p>
              <label for=username3>Personal:</label>
              <input id=username3 name=username2 class=required type=text value=""/>
            </p>
          </div>
          <div class=_50>
            <p class=no-top-margin>
              <label for=firstname3>Usuario</label>
              <input id=firstname3 name=firstname2 class=required type=text value=""/>
            </p>
          </div>
          <div class=_50>
            <p class=no-top-margin>
              <label for=lastname3>Clave</label>
              <input id=lastname3 name=lastname2 class=required type=password value=""/>
            </p>
          </div>
          <div class=clear></div>
          <div class=block-actions>
            <ul class=actions-left>
              <li><a class="close-toolbox button red" id=reset4 href="javascript:void(0);">Cancel</a></li>
            </ul>
            <ul class=actions-right>
              <li>
                <input type=submit class=button value="Crear Usuario">
              </li>
            </ul>
          </div>
        </form>
      </div>
    </div>
  </li>
  <li> <a rel=tooltip title="Encribir Mensaje" class=toolbox-action href="javascript:void(0);"><span class=i-24-balloon></span></a>
    <div class=toolbox-content>
      <div class=block-border>
        <div class="block-header small">
          <h1>Escribir Mensaje</h1>
        </div>
        <form id=write-message-form2 class="block-content form" action="#" method=post>
          <p class=inline-mini-label>
            <label for=recipient3>Destino</label>
            <input type=text name=recipient2 class=required>
          </p>
          <p class=inline-mini-label>
            <label for=subject3>Asunto</label>
            <input type=text name=subject2>
          </p>
          <div class=_100>
            <p class=no-top-margin>
              <label for=message3>Mensaje</label>
              <textarea id=message3 name=message2 class=required rows=5 cols=40></textarea>
            </p>
          </div>
          <div class=clear></div>
          <div class=block-actions>
            <ul class=actions-left>
              <li><a class="close-toolbox button red" id=reset5 href="javascript:void(0);">Cancel</a></li>
            </ul>
            <ul class=actions-right>
              <li>
                <input type=submit class=button value="Enviar Mensaje">
              </li>
            </ul>
          </div>
        </form>
      </div>
    </div>
  </li>
  <li> <a rel=tooltip title="Historial" class=toolbox-action href="javascript:void(0);"><span class="i-24-application"></span></a>
    <div class=toolbox-content>
      <div class=block-border>
        <div class="block-header small">
          <h1>Ver Historial</h1>
        </div>
        <form id=create-folder-form2 class="block-content form" action="#" method=post>
          <p class=inline-mini-label>
            <label for=folder-name3>Fecha</label>
            <input type=text name=folder-name2 class=required>
          </p>
          <div class=block-actions>
            <ul class=actions-left>
              <li><a class="close-toolbox button red" id=reset6 href="javascript:void(0);">Cancel</a></li>
            </ul>
            <ul class=actions-right>
              <li>
                <input type=submit class=button value="Consultar">
              </li>
            </ul>
          </div>
        </form>
      </div>
    </div>
  </li>
</ul>
<div id=info-dialog title=Privacidad style="display: none;"> <p>Toda la información contenida en este sitio tiene únicamente fines informativos y educativos. Le sugerimos que lea y examine detenidamente estos Términos y Condiciones de Privacidad antes de utilizar o acceder a este sitio web. Al utilizar o acceder a este sitio web, usted reconoce que ha leído, entendido y aceptado el Contrato de Condiciones de Uso. Si no está de acuerdo con las Condiciones de Uso, no puede usar ni acceder a este sitio..</p> <p>Att. El Administrador.</p> </div>

<ul class=toolbox-header> <li><div class=toolbox-content> <div class=block-border> <div class="block-header small"> <h1>Create a User</h1> </div> <form id=create-user-form class="block-content form" action="#" method=post> <div class=_100> <p><label for=username>Username</label><input id=username name=username class=required type=text value=""/></p> </div> <div class=_50> <p class=no-top-margin><label for=firstname>Firstname</label><input id=firstname name=firstname class=required type=text value=""/></p> </div> <div class=_50> <p class=no-top-margin><label for=lastname>Lastname</label><input id=lastname name=lastname class=required type=text value=""/></p> </div> <div class=clear></div> <div class=block-actions> <ul class=actions-left> <li><a class="close-toolbox button red" id=reset href="javascript:void(0);">Cancel</a></li> </ul> <ul class=actions-right> <li><input type=submit class=button value="Create the User"></li> </ul> </div> </form> </div> </div> </li> <li><div class=toolbox-content> <div class=block-border> <div class="block-header small"> <h1>Write a Message</h1> </div> <form id=write-message-form class="block-content form" action="#" method=post> <p class=inline-mini-label> <label for=recipient>Recipient</label> <input type=text name=recipient class=required> </p> <p class=inline-mini-label> <label for=subject>Subject</label> <input type=text name=subject> </p> <div class=_100> <p class=no-top-margin><label for=message>Message</label><textarea id=message name=message class=required rows=5 cols=40></textarea></p> </div> <div class=clear></div> <div class=block-actions> <ul class=actions-left> <li><a class="close-toolbox button red" id=reset2 href="javascript:void(0);">Cancel</a></li> </ul> <ul class=actions-right> <li><input type=submit class=button value="Send Message"></li> </ul> </div> </form> </div> </div> </li> <li><div class=toolbox-content> <div class=block-border> <div class="block-header small"> <h1>Create a Folder</h1> </div> <form id=create-folder-form class="block-content form" action="#" method=post> <p class=inline-mini-label> <label for=folder-name>Name</label> <input type=text name=folder-name class=required> </p> <div class=block-actions> <ul class=actions-left> <li><a class="close-toolbox button red" id=reset3 href="javascript:void(0);">Cancel</a></li> </ul> <ul class=actions-right> <li><input type=submit class=button value="Create Folder"></li> </ul> </div> </form> </div> </div> </li> </ul> <div id=user-info> <p> <span class=messages>Bienvenido <a href="javascript:void(0);"><%=Usuario%></a> ( <a href="mensajes.jsp"><img src="img/icons/packs/fugue/16x16/mail.png" alt=Messages> 3 nuevos mensajes</a> )</span> <a href="perfil.jsp" class="toolbox-action button">Perfil</a> <a href="../logoutpersonal" class="button red">Logout</a> </p> </div> </header></div> <div class=fix-shadow-bottom-height></div> <aside id=sidebar> <div id=search-bar> <form id=search-form name=search-form action="#" method=post> <input type=text id=query name=query value="" autocomplete=off placeholder=Search> </form> </div> <section id=login-details> <img src="<%=Foto%>" alt="Hello Admin" width="60" height="60" class="img-left framed"> 
<h3>Logueado como</h3> 
<h2><a class=user-button href="javascript:void(0);"><%=Cargo%><span class=arrow-link-down></span></a></h2> <ul class=dropdown-username-menu> 

<li><a href="#">Perfil</a></li>
<li><a href="#">Mensajes</a></li>
<li><a href="#">Logout</a></li>
</ul>

<div class=clearfix></div> </section> <nav id=nav>
  <ul class="menu collapsible shadow-bottom">
    <li><a href="principal.jsp" class=current><img src="img/icons/packs/fugue/16x16/dashboard.png">Principal</a></li>
    <li><a href="forms.html"><img src="img/icons/packs/fugue/16x16/application-form.png">Productos<span class="badge grey">2</span></a>
      <ul class=sub>
        <li><a href="productos.jsp">Mostrar Todos</a></li>
        <li><a href="productos1.jsp">Ingresar Nuevo</a></li>
      </ul>
    </li>
    <%
    if ("ADMINISTRADOR".equals(Cargo)){
        %>
    <li><a href="#"><img src="img/icons/packs/fugue/16x16/table.png">Personal<span class="badge grey">2</span></a>
      <ul class=sub>
        <li><a href="personal.jsp">Mostrar Todos</a></li>
        <li><a href="personal1.jsp">Ingresar Nuevo</a></li>
      </ul>
    </li>
    <%}%>
    
    <li><a href="#"><img src="img/icons/packs/fugue/16x16/user-white.png">Clientes<span class="badge grey">3</span></a>
      <ul class=sub>
        <li><a href="clientesN.jsp">Clientes Naturales</a></li>
        <li><a href="clientesJ.jsp">Clientes Juridicos</a><a href="clientes1.jsp">Ingresar Nuevo</a></li>
      </ul>
    </li>
    <li><a href="graficos.jsp"><img src="img/icons/packs/fugue/16x16/chart.png">Graficos</a></li>
    <li> <a href="javascript:void(0);"><img src="img/icons/packs/fugue/16x16/clipboard-list.png">Reportes<span class="badge grey">5</span></a>
      <ul class=sub>
        <li><a href="report/productos.jsp" target="_blank">Productos</a></li>
        <li><a href="report/C_juridicos.jsp" target="_blank">Clientes Jurídicos</a></li>
        <li><a href="report/C_naturales.jsp" target="_blank">Clientes Naturales</a></li>
        <li><a href="report/personal.jsp" target="_blank">Personal</a></li>
        <li><a href="ventas.jsp" target="_blank">Ventas</a></li>
      </ul>
    </li>
    <li><a href="javascript:void(0);" onClick="$('#info-dialog').dialog({ modal: true });"><img src="img/icons/packs/fugue/16x16/magnifier--exclamation.png">Importante</a></li>
    <li> <a href="mensajes.jsp"><img src="img/icons/packs/fugue/16x16/newspaper.png">Mensajes</a></li>
    <li><a href="../logoutpersonal"><img src="img/icons/packs/fugue/16x16/door-open-in.png">Logout</a></li>
  </ul>
</nav> 
</aside> <div id=main role=main> <div id=title-bar> <ul id=breadcrumbs> <li><a href="principal.jsp" title=Home><span id=bc-home></span></a></li> <li class=no-hover>Clientes</li> </ul> </div> <div class="shadow-bottom shadow-titlebar"></div> <div id=main-content> <div class=container_12> <div class=grid_12>
  <h1>Pedidos realizados</h1>
</div> <div class=grid_12>
  <div class=block-border>
    <div class=block-header>
      <h1>Lista de los productos que se encuentran en este pedido.</h1>
      <span></span></div>
    <div class=block-content>
        <div class="alert note no-margin top">
          <p>Nota: A continuación se muestran los productos que contiene este pedido.</p>
</div>
          <%if("0".equals(resp)){%>
      <div class="alert info no-margin top"><span class=hide>x</span>Información: Se ha añadido un nuevo registro en la tabla cliente de forma correcta!!!.</div>
      <%}else if("1".equals(resp)){%>
      <div class="alert info no-margin top"><span class=hide>x</span>Información: Se ha modificado los datos de un registro en la tabla cliente de forma correcta!!!.</div>
        <%}else if("falso".equals(resp)){%>
      <div class="alert error no-margin top"><span class=hide>x</span>Error: Ha ocurrido un error al relizar la operación, los datos no se han actualizado con exito, intentelo mas tarde!!!.</div>%>
        
        %><%
		}
					Connection cn;
                    conexion con = new conexion();
                    String cod=null;
                           String estado=null;
                    try {
                		
                        cn = con.getAccesoBD();
                        Statement stmt = cn.createStatement();
			String a="SELECT  `detalle_comprobante`.IdComprobante,  `producto`.Descripcion,  `detalle_comprobante`.Cantidad,  `detalle_comprobante`.Total,  `detalle_comprobante`.Precio, `marca`.Nombre FROM  `producto`  INNER JOIN `detalle_comprobante` ON (`producto`.IdProducto = `detalle_comprobante`.IdProducto)  INNER JOIN `comprobante` ON (`detalle_comprobante`.IdComprobante = `comprobante`.IdComprobante)  INNER JOIN `marca` ON (`producto`.IdMarca = `marca`.IdMarca) WHERE `comprobante`.`IdComprobante`='" + che  + "';";               
			ResultSet rs = stmt.executeQuery(a);
                        out.println("<table id=table-example class=table><thead><tr><th>Pagar Comprobante</th><th>Producto</th><th>Cantidad</th><th>Precio</th><th>Total</th></tr></thead><tbody>");
                        while (rs.next()) {
                            
                        out.println("<tr class=gradeA>"); 
                		cod=String.valueOf(rs.getString(1));
                                 
                                if (pag==0){
                                    out.println("<td><a href=../pagar?cod="+cod+"><font color=red>"+rs.getString(1)+"</font></a></td>");
                                }else{
                                    out.println("<td><a href=../pagar1?cod="+cod+">"+rs.getString(1)+"</a></td>");
                                 }
			    		out.println("<td><a href=../pagar?cod="+cod+">"+rs.getString(1)+"</a></td>");
                		out.println("<td>"+rs.getString(2)+"</td>");
						out.println("<td>"+rs.getString(3)+"</td>");
						out.println("<td>S/. "+rs.getString(4)+"</td>");
						out.println("<td>S/. "+rs.getString(5)+"</td>");
						out.println("</tr>");     
                        }
						
						out.println("</tbody></table>");
                      
                %>
    </div>
  </div>
</div><div class="clear height-fix"></div> </div></div> </div> <footer id=footer><div class=container_12> <div class=grid_12> <div class="footer-icon align-center"><a class=top href="#top"></a></div> </div> </div></footer> </div>  <script>window.jQuery||document.write('<script src="js/libs/jquery-1.6.2.min.js"><\/script>');</script> <script defer src='js/8f71c247c4dadc837fe569208a7a1dc0f7625c46.js'></script><!--[if lt IE 7 ]><script src="//ajax.googleapis.com/ajax/libs/chrome-frame/1.0.3/CFInstall.min.js"></script> <script>window.attachEvent("onload",function(){CFInstall.check({mode:"overlay"})});</script><![endif]--> </body> 
</html>

<%
                    } catch (SQLException ex) {
                        System.out.println(ex.toString());
                    }  
%>
					