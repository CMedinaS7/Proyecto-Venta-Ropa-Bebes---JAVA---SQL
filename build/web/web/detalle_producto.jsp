<%-- 
    Document   : index
    Created on : 20-may-2012, 11:33:02
    Author     : user
--%>

<%@page import="Beans.DetalleVenta"%>
<%@page import="java.util.ArrayList"%>
<%
            
  
            HttpSession sesion = request.getSession(true);
            String Usuario = (String) sesion.getAttribute("Cnombres");
            String Direccion = (String) sesion.getAttribute("Cdireccion");
            String Telefono = (String) sesion.getAttribute("Ctelefono");
            String Email = (String) sesion.getAttribute("Cemail");
            String filtro= request.getParameter("prod");
              int totales=0;
            ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
            if(lista!=null){
            totales=lista.size();
                              }
		   Connection cn;
                    conexion con = new conexion();
                    try {
                		
                        cn = con.getAccesoBD();
                        Statement stmt = cn.createStatement();
			String a="select p.Idproducto,p.Descripcion,m.Nombre,p.talla,p.color,p.precio,p.stock,p.foto1 from producto p, marca m where p.idmarca=m.idmarca and p.IdProducto='"+filtro+"';";                
			String codigo=null,des=null,foto=null,marca=null,talla=null,color=null;
                        int stock=0,precio=0,anterior=0;
			ResultSet rs = stmt.executeQuery(a);
                        while (rs.next()) {
                            codigo=String.valueOf(rs.getString(1));
                            des=String.valueOf(rs.getString(2));
                            marca=String.valueOf(rs.getString(3));
                            talla=String.valueOf(rs.getString(4));
                            color=String.valueOf(rs.getString(5));
                            precio=Integer.parseInt(String.valueOf(rs.getString(6)));
                            stock=Integer.parseInt(String.valueOf(rs.getString(7)));
                            foto=String.valueOf(rs.getString(8));
                            anterior=precio-5;
                         }
         
%>

<%@page contentType="text/html" pageEncoding="UTF-8" import=" Dao.conexion,java.sql.*,java.util.Date"%>

<!doctype html><head id="www-sitename-com" data-template-set="html5-reset"> 
<base  />
	<meta charset="utf-8"> 
	

	<title>BABYMODAS - Regalos para recién nacido, juguetes, ropa para bebés y niños.</title> 
	
	<meta name="title" content="Regalos para recién nacidos, juguetes, ropa, accesorios para niños y bebés. Mallas de seguridad para el hogar."> 
	<meta name="description" content=""> 
	<link rel="icon" type="image/png" href="image/icono.png" />	 
	
	<!-- CSS: screen, mobile & print are all in the same file --> 
    <link rel="stylesheet" href="css/reset.css"> 
    <link rel="stylesheet" href="css/queryLoader.css"> 
    <link rel="stylesheet" href="ThickBox/thickbox.css" type="text/css" media="screen" > 
    <link rel="stylesheet" type="text/css" href="css/tango/skin1.css" />    
    <link rel="stylesheet" href="css/style.css"> 

 <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
  <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/cloud-zoom.1.0.2.js"></script>
<link href="css/cloud-zoom.css" rel="stylesheet" type="text/css" />
    
	<!-- jquery para iniciar page --> 
	<script src="js/queryLoader.js"></script><!-- loading page -->    
<style type="text/css">
#apDiv1 {
	position:absolute;
	width:99px;
	height:29px;
	z-index:1;
	left: 475px;
	top: 10px;
}
#natural
{
display:;	}


#juridica
{
display:none;	}

</style>

<script type="text/javascript">

function naturales() {

natural.style.display ='';
juridica.style.display ='none';

}
function juridicas() {

natural.style.display ='none';
juridica.style.display ='inline';

}
</script>



</head> 
 
<body>  
 
<div id="wrapper"> 
 
<div id="header" class="HeaderWidth2"> 
    
  		<div id="head"> 
        
        	<div class="logo"> 
            	<a href="index.jsp"><img src="image/logo.png"></a> 
            </div> 


<%if ((String) sesion.getAttribute("Cnombres") == null) {%>
<div class="login"> 
            	<div class="iconUser"> 
                	<div class="formLogin"> 
                    	<form action="../validarCliente" method="post" id="logeo" class="logeo"> 
                    	<p>
                        	<label class="lbl">Correo eléctronico:</label>
                            <input class="input required email" type="text" name="email" id="email">
                        </p>
                        <p>
                        	<label class="lbl">Ingrese Clave:</label>
                            <input class="input required" type="password" name="clave" id="clave">
                        </p>
 						 <p> 
                         <a href="%24site_url.html#TB_inline?height=190&width=390&inlineId=RecoveryPwd" 
                            name="&nbsp;&nbsp;&nbsp;Recuperar Contraseña"  id="enlace" class="link2 thickbox">
                            Olvidó contraseña
                         </a> 
                        	<button class="submitLogin" type="submit">Ingresar</button> 
                        </p> 
                        </form> 
                    </div> 
                </div> 
				<p>
					<a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox">
					  <b>REGISTRARSE</b>
					</a>
</p> 
</div> 

<%}else{%>
                    
<div class="login"> 
            	<div class="iconUser"> 
                	<div class="formLogin"> 
                    	<form>
                    	<p>
                          <center><label  class="h4"><%=Usuario%></label></center>
                            
                        </p>
                        <br>
                        
                      <p>
                            <label class="parrafo6"><b>Direccion:</b> <label class="parrafo9"><%=Direccion%></label></label>
                            
                      </p>
 						<p>
                          <label class="parrafo6"><b>Telefono:</b> <label class="parrafo9"><%=Telefono%></label></label>
                            
                        </p>
 						<p>
                            <label class="parrafo6"><b>E-mail:</b> <label class="parrafo9"><%=Email%></label></label>
                            
                        </p>
                        <br>
                        <p>
                        <a href="../logoutcliente"><font color="#FF0000">Cerrar Session</font></a>                        
                        <button class="submitLogin" type="submit">Modificar Datos</button>
                        </p> 
                        
                    </div> 
                    </form>
                </div> 
				<p>
					<a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox">
					  <b>REGISTRARSE</b>
					</a>
</p> 
</div> 
<%}%>
                    
            <div class="search"> 
            	<form action="#" method="post">
	            	<input type="text" name="s">
                </form> 
            </div> 
            
            <div class="number"> 
            	(044)-282259
            </div> 
            
            <div class="menu"> 



<ul> 

<li > <a href="index.jsp" >Inicio</a></li>
        <li > <a href="bebes.jsp?p=1" >Bebes</a></li>
        <li > <a href="niños.jsp" >Niños</a></li>
        <li > <a href="promociones.jsp" >Promociones</a></li>
        <li > <a href="seguridad.jsp" >Novedades</a></li>







</ul> 



            </div> 
            
            <div class="shop" onClick="location.href='carrito.jsp'"></div>
            <div id="apDiv1"><a href="../intranet/login.jsp" target="_blank"><img src="image/btnintranet.png"></a></div>
        </div>                
    
    </div>
    
    
    <div id="container">   
    
    	<div id="slider1">        	
            <div class="borderSup"></div> 
        </div> 
    	
        <div id="main"> 
        
			        <div class="shop" onClick="location.href='carrito.jsp'"> 
                <p><!--0-->
                <%=totales%>
                   <br> 
                   <span>• PRODUCTOS •</span>
                </p> 
        </div>
        	
            <div class="title"> 
           		Detalle del producto
            </div>                       
            
            <div class="grid box-13"> 
            
            	<div class="grid box-14 span-11"> 
               	  <div class="grid ShadowImg">
                  
                 
                 <div class="zoom-section"></div>
         <div class="zoom-section">
       <div class="zoom-small-image"> <a href='<%=foto%>' class = 'cloud-zoom' rel="position: 'inside' , showTitle: false, adjustX:-4, adjustY:-4">
       <img src="<%=foto%>" width="284" height="297" /> </a> </div>
      </div>
     <div class="zoom-section" ></div>
     
  
                        
                    	
                    </div>
            	</div> 
                
                <div class="grid box-3"> 
                	<p class="parrafo12"><%=des%></p> 
                    <p class="parrafo13">
<span class="sin_bold">Valor -</span> <span class="precio_antes">S/. <%=precio%></span>

<br />Oferta - S/. <%=anterior%></p> 
                    <p class="parrafo14"> 

Destaca con este super regalo! <br />
<br />
 Caracteristicas:<br />
Marca: <%=marca%>. <br />
Talla: <%=talla%>. <br />
Color: <%=color%>. <br />
Precio: <%=precio%>.<br />
Stock disponible: <%=stock%>.</p>
<p class="parrafo14">&nbsp;</p>
                    <p>&nbsp;               	  </p>
                    <form name="form1" method="post" action="../moduloVenta">
                      <p>
                        <input name="txtcodigo" type="hidden" id="txtcodigo" value="<%=codigo%>">
                        <input name="accion" type="hidden" id="accion" value="AnadirCarrito">
                        <span class="parrafo14">Ingrese Cantidad: </span>
                        <input type="number" min="1" max="<%=stock%>" step="1" value="1" name="txtcantidad" id="txtcantidad">
                      </p>
                      <p><br>
                      </p>
                      <p>
              <label class="lblsubmit2 left">
                  <button type="submit" class="submit submit3">Agregar a Carrito 
                    </button>
              </label>
        </form>
                     <label class="lblsubmit1 left">
                  <button type="submit" onClick="location.href='bebes.jsp'" class="submit1 submit2">Seguir Comprando</button>
              </label>
                    </p> 
                </div> 
            	
            </div> 
        	
            <div class="clear"></div> 
                
    	</div>        
        
    </div>
    <div id="footer">
      <div id="foot">
        <div class="menu">
          <ul>
            <li><a href="nosotros.jsp">&bull; Nosotros</a></li>
            <li><a href="contactenos.jsp">&bull; Contáctanos</a></li>
          </ul>
          <ul>
            <li><a href="t%c3%a9rminos-y-condiciones.html">&bull; Términos Y Condiciones</a></li>
            <li><a href="pol%c3%adtica-de-privacidad.html">&bull; Política de Privacidad</a></li>
          </ul>
          <ul>
            <li><a href="nuestras-tiendas.jsp">&bull; Nuestras Tiendas</a></li>
            <li><a href="mapa-del-sitio.jsp">&bull; Multimedia</a></li>
          </ul>
        </div>
        <div class="new" id="mc_embed_signup">
          <h4>Suscribir</h4>
          <p>Recibe novedades y promociones</p>
          <form action="#" 
            id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" 
            method="post" class="news" target="_blank">
            <label class="lbl" for="mce-EMAIL">Ingrese su Correo Electrónico</label>
            <input type="text" value="" class="required email" name="EMAIL"  id="mce-EMAIL">
            <br>
            <div id="mce-responses" class="clear">
              <div class="response" id="mce-error-response" style="display:none"></div>
              <div class="response" id="mce-success-response" style="display:none"></div>
            </div>
            <button class="button" type="submit" id="mc-embedded-subscribe">Enviar </button>
          </form>
        </div>
        <div class="terms">
          <div class="logo"><a href="#"></a></div>
          <p>CJMS7 © 
            DISEÑO DE PAGINAS WEB </p>
          <p>Copyright ® 2012 BABYMODAS. Todos los derechos reservados.</p>
        </div>
        <div class="formas_pago">
          <p>formas de pago</p>
          <a name="paypal"></a> <a name="tb">Transferencia<br>
            bancaria</a> <a name="cont">contraentrega</a> </div>
        <div class="redes">
          <p>Redes sociales</p>
          <a href="http://www.facebook.com/porta7m" target="_blank" name="fb"></a> <a href="http://twitter.com/" target="_blank" name="tw"></a> <a href="http://" target="_blank" name="gp"></a> <a href="" target="_blank" name="sk"></a> </div>
      </div>
    </div>
</div> 
 
<div id="Register" class="none"> 
 <div class="data">
 <table>
 <tr>
 <td>
 <h5><center>CLIENTE NATURAL</center></h5>
	<form action="../moduloCliente" method="post" id="registerUser"  name="registerUser" class="register">
        <input type="hidden" value="natural" id="txtfiltro" name="txtfiltro">    
        <p class="txtCenter">
        	<label class="lbl" for="txtnombres">Nombres*</label>	
            <input type="text" class="InputW required" value="" name="txtnombres" id="txtnombres"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtapellidos">Apellidos*</label>	
            <input type="text" class="InputW required" value="" name="txtapellidos" id="txtapellidos"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtdni">DNI*</label>
            <input type="text" class="InputW required number" value="" name="txtdni" maxlength="8" id="txtdni">
        </p>
        
         <p class="txtCenter">
        	<label class="lbl" for="txtdireccion">Dirección*</label>
            <input type="text" class="InputW required" value="" name="txtdireccion" id="txtdireccion">
            
        </p>         
        
              
        <p class="miniselect">
        <select class="required styled1 selectW1" name="cbosexo" id="r_select_paises">
            <option value="">Seleccione Sexo*</option>
            <option value="Femenino">Femenino</option>
            <option value="Masculino">Masculino</option>
        </select>
        </p>        
        
        <p class="txtCenter _left">
        	<label class="lbl" for="txttelefono">Teléfono*</label>
            <input type="text" class="required InputW " value="" name="txttelefono" id="txttelefono">
        </p>  

        <p class="txtCenter _left">
        	<label class="lbl" for="txtemail">Correo Electrónico*</label>
            <input type="text" class="required InputW email" value="" name="txtemail" id="txtemail">
        </p> 
        <p class="txtCenter _left">
        	<label class="lbl" for="txtclave">Contraseña*</label>
            <input type="password" class="required InputW" value="" name="txtclave" id="txtclave">
        </p>  
               
        <input type="hidden" name="redirect_ok" id="register_redirect_ok" value="gracias-por-registrarse-por-confirmar.html" />
        <p class="textL txtCenter _left span-12">
        	*Campos obligatorios
        </p>
        <p class="span-13">
            <label class="lblsubmit"><button class="submit" type="submit" id="boton_registrar">Continuar</button></label>
        </p>        
    </form>
    </td>
 	
    <td>
    <h5><center>CLIENTE JURIDICO</center></h5>
	<form action="../moduloCliente" method="post" id="recoveryPwd" class="recoveryPwd" name="registerUser1">
        <input type="hidden" value="juridico" id="txtfitro" name="txtfiltro">
        <p class="txtCenter">
        	<label class="lbl" for="txtrz">Razon Social*</label>	
            <input type="text" class="InputW required" value="" name="txtrz" id="txtrz"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtrepre">Representante*</label>	
            <input type="text" class="InputW required" value="" name="txtrepre" id="txtrepre"> 
        </p>
        
        <p class="txtCenter">
        	<label class="lbl" for="txtruc">RUC*</label>
            <input type="text" class="InputW required" value="" name="txtruc" id="txtruc">
        </p>
        
         <p class="txtCenter">
        	<label class="lbl" for="txtdireccion1">Dirección*</label>
            <input type="text" class="InputW required" value="" name="txtdireccion1" id="txtdireccion1">
            
        </p>         
        
        
        <p class="txtCenter _left">
        	<label class="lbl" for="txttelefono1">Teléfono*</label>
            <input type="text" class="required InputW " value="" name="txttelefono1" id="txttelefono1">
        </p>  

        <p class="txtCenter _left">
        	<label class="lbl" for="txtemail1">Correo Electrónico*</label>
            <input type="text" class="required InputW email" value="" name="txtemail1" id="txtemail1">
        </p> 
        <p class="txtCenter _left">
        	<label class="lbl" for="txtclave1">Contraseña*</label>
            <input type="password" class="required InputW" value="" name="txtclave1" id="txtclave1">
        </p>  
               
        <input type="hidden" name="redirect_ok" id="register_redirect_ok" value="gracias-por-registrarse-por-confirmar.html" />
        <p class="textL txtCenter _left span-12">
        	*Campos obligatorios
        </p>
        <p class="span-13">
            <label class="lblsubmit"><button class="submit" type="submit" id="boton_registrar1">Continuar</button></label>
        </p>        
    </form>
    </td>
 
 
    </tr>
    </table>
</div>
</div>
 
<!-- here comes the javascript --> 
 
<!-- Grab Google CDN's jQuery. fall back to local if necessary --> 
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> 
<script>window.jQuery || document.write("<script src='js/jquery-1.5.1.min.js'>\x3C/script>")</script> 
 
<script src="js/jquery.bgscroll.js"></script> 

<script src="js/jquery.validate.js"></script>
<script src="js/jquery.infieldlabel.min.js"></script>

<script src="ThickBox/thickbox.js" type="text/javascript"></script> 
<script src="js/jquery.jcarousel.min.js"></script> 
<script src="js/easySlider1.5.js"></script> 
<!-- this is where we put our custom functions --> 
<script src="js/functions.js"></script> 
 

					<script>
					$(document).ready(function(){
						$('#wrapper').addClass('background2');
						$('#container').addClass('star');		
					});
					</script> 

<script type="text/javascript"> 
jQuery(document).ready(function() {	
	jQuery('#mycarousel').jcarousel({
		wrap: 'circular',
		scroll: 3
	});		
	/******/ 
    $("#mycarousel li a").click(function(){		
		//alert("sdas")    
        var largePath = $(this).attr("href");
        var largeAlt = $(this).attr("title");        
        $("#largeImg").attr({ src: largePath, alt: largeAlt });         
        $("#contexto p").html(largeAlt); return false;
    });
	
});
 
 
function comprar_como_regalo( producto_id, producto_imagen, producto_nombre, producto_link, producto_precio, id_detalle_lista )
{

	var identificador = producto_id +"_"+aleatorio(10, 1000000);
		$.ajax({
		   type: "POST",
		   url: "include/comprar_como_regalo.php",
		   data: "identificador="+identificador+
                 "&producto_id="+producto_id+
		   		 "&producto_imagen="+producto_imagen+
		   		 "&producto_nombre="+producto_nombre+
				 "&producto_link="+producto_link+
				 "&producto_precio="+producto_precio+
				 "&id_detalle_lista="+id_detalle_lista,
		   success: function(msg){
				 //location.href="comprar-registro.html";
                                 location.href="mi-carrito-de-regalos.html";
		   }
		 });

} 
</script> 
 
<!-- Asynchronous google analytics; this is the official snippet.
	 Replace UA-XXXXXX-XX with your site's ID and uncomment to enable.
	 
<script>
 
  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-XXXXXX-XX']);
  _gaq.push(['_trackPageview']);
 
  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();
 
</script>
--> 
  
</body> 
</html>

<%}catch (SQLException ex) {
                        System.out.println(ex.toString());
                    } %>