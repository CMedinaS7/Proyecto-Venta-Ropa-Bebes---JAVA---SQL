<%-- 
    Document   : felicidades
    Created on : 24-may-2012, 17:02:23
    Author     : Carlos J Medina
--%>
<%@page import="Beans.DetalleVenta"%>
<%@page import="java.util.ArrayList"%>
<%
            HttpSession sesion = request.getSession(true);
            String Usuario = (String) sesion.getAttribute("Cnombres");
            String Direccion = (String) sesion.getAttribute("Cdireccion");
            String Telefono = (String) sesion.getAttribute("Ctelefono");
            String Email = (String) sesion.getAttribute("Cemail");
			String s=request.getParameter("s");
	    int total=0;
            int totales=0;
            ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
            if(lista!=null){
            totales=lista.size();
                              }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html><head id="www-sitename-com" data-template-set="html5-reset"> 
<base  />
 
	<meta charset="utf-8"> 
	
	<!-- Always force latest IE rendering engine (even in intranet) & Chrome Frame --> 
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	
	<title>Komodo Kids</title> 
	
	<meta name="title" content="Komodo Kids"> 
	<meta name="description" content="Komodo Kids"> 
	<!-- Google will often use this as its description of your page/site. Make it good. --> 
	
	<meta name="google-site-verification" content=""> 
	<!-- Speaking of Google, don't forget to set your site up: http://google.com/webmasters --> 
	
	<meta name="author" content="Kodomo"> 
	<meta name="Copyright" content="Kodomokids"> 
 
	<!-- Dublin Core Metadata : http://dublincore.org/ --> 
	<meta name="DC.title" content=""> 
	<meta name="DC.subject" content=""> 
	<meta name="DC.creator" content=""> 
	
    <style type="text/css">
#apDiv1 {	position:absolute;
	width:99px;
	height:29px;
	z-index:1;
	left: 475px;
	top: 10px;
}
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


	<!--  Mobile Viewport Fix
	j.mp/mobileviewport & davidbcalhoun.com/2010/viewport-metatag 
	device-width : Occupy full width of the screen in its current orientation
	initial-scale = 1.0 retains dimensions instead of zooming out if page height > device height
	maximum-scale = 1.0 retains dimensions instead of zooming in if page width < device width
	--> 
	<!-- Uncomment to use � use thoughtfully!
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
	--> 
 
	<link rel="shortcut icon" href="image/favicon.ico"> 
	<!-- This is the traditional favicon.
		 - size: 16x16 or 32x32
		 - transparency is OK
		 - see wikipedia for info on browser support: http://mky.be/favicon/ --> 
		 
	<link rel="apple-touch-icon" href="_/img/apple-touch-icon.html"> 
	<!-- The is the icon for iOS's Web Clip.
		 - size: 57x57 for older iPhones, 72x72 for iPads, 114x114 for iPhone4's retina display (IMHO, just go ahead and use the biggest one)
		 - To prevent iOS from applying its styles to the icon name it thusly: apple-touch-icon-precomposed.png
		 - Transparency is not recommended (iOS will put a black BG behind the icon) --> 

<!--GOOGLE OPTIMIZER (pagina) - START-->

<!--GOOGLE OPTIMIZER (pagina) - END  -->

<!--GOOGLE ANALYTICS (config)- START-->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-27506889-1']);
  _gaq.push(['_setDomainName', 'kodomokids.com']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<!--GOOGLE ANALYTICS (config) - END  -->

	
	<!-- CSS: screen, mobile & print are all in the same file --> 
    <link rel="stylesheet" href="css/reset.css"> 
	<link rel="stylesheet" href="css/queryLoader.css"> 
    <link rel="stylesheet" href="ThickBox/thickbox.css" type="text/css" media="screen" > 
    <link rel="stylesheet" href="css/style.css"> 
 
	<!-- jquery para iniciar page --> 
	<script src="js/queryLoader.js"></script><!-- loading page --> 
 
<style type="text/css">
#apDiv1 {	position:absolute;
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
</head> 
 
<body> 
 
<div id="wrapper"> 



<div id="header" class="HeaderWidth2">
  <div id="head">
    <div class="logo"> <a href="index.jsp"><img src="image/logo.png"></a></div>
    <%if ((String) sesion.getAttribute("Cnombres") == null) {%>
    <div class="login">
      <div class="iconUser">
        <div class="formLogin">
          <form action="../validarCliente" method="post" id="logeo" class="logeo">
            <p>
              <label class="lbl">Correo eléctronico:</label>
              <input class="input required email" type="text" name="email" id="email2">
            </p>
            <p>
              <label class="lbl">Ingrese Clave:</label>
              <input class="input required" type="password" name="clave2" id="clave2">
            </p>
            <p> <a href="%24site_url.html#TB_inline?height=190&width=390&inlineId=RecoveryPwd" 
                            name="&nbsp;&nbsp;&nbsp;Recuperar Contraseña"  id="enlace" class="link2 thickbox"> Olvidó contraseña </a>
              <button class="submitLogin" type="submit">Ingresar</button>
            </p>
          </form>
        </div>
      </div>
      <p> <b>REGISTRARSE</b></p>
    </div>
    <%}else{%>
    <div class="login">
      <div class="iconUser">
        <div class="formLogin">
        <form>
          <p>
            <center>
              <label  class="h4"><%=Usuario%></label>
            </center>
          </p>
          <br>
          <p>
            <label class="parrafo6">
            <b>Direccion:</b>
            <label class="parrafo9"><%=Direccion%></label>
            </label>
          </p>
          <p>
            <label class="parrafo6">
            <b>Telefono:</b>
            <label class="parrafo9"><%=Telefono%></label>
            </label>
          </p>
          <p>
            <label class="parrafo6">
            <b>E-mail:</b>
            <label class="parrafo9"><%=Email%></label>
            </label>
          </p>
          <br>
          <p> <a href="../logoutcliente"><font color="#FF0000">Cerrar Session</font></a>
            <button class="submitLogin" type="submit">Modificar Datos</button>
          </p>
          </div>
        </form>
      </div>
      <p>  <b>REGISTRARSE</b></p>
    </div>
    <%}%>
    <div class="search">
      <form action="#" method="post">
        <input type="text" name="s">
      </form>
    </div>
    <div class="number"> (044)-282259 </div>
    <div class="menu">
      <ul>
        <li > <a href="index.jsp" >Inicio</a></li>
        <li > <a href="bebes.jsp?p=1" >Bebes</a></li>
        <li > <a href="niños.jsp" >Niños</a></li>
        <li > <a href="promociones.jsp" >Promociones</a></li>
        <li > <a href="seguridad.jsp" >Novedades</a></li>
      </ul>
    </div>
    <div id="apDiv1"><a href="../intranet/login.jsp" target="_blank"><img src="image/btnintranet.png"></a></div>
  </div>
</div>
    
    <div id="container">   
    
    	<div id="slider1">        	
            <div class="borderSup"></div> 
        </div> 
    	
        <div id="main"> 
        	
            <div class="title"> 
           		Gracias
            </div>     
             
            <div class="grid box-1">          
            	
                <%if (s.equals("0")) {%>
                <div class="grid box-17"> 
                	<div class="thanks"></div> 
                    <p class="thanksTxt thanksTxt1"> 
                    	<span>Gracias</span> <br> por registrarse
                    </p> 
                    <p class="parrafo2 span-18">
                    	A partir de este momento usted puede realizar compras via web. Desde cualquier sitio, contando con un dispositivo que se pueda conectar a nuestro sitio; recuerde leer los terminos y condiciones de la pagina asi como las politicas del privacidad.
                    </p> 



                    <p class="span-17"> 
                        <label class="lblsubmit"> 
<button class="submit" type="button" 
        onClick="location.href='index.jsp'">
             Aceptar
        </button>
                        </label> 
                    </p> 



                </div>                              
                <%}else{%>
                <div class="grid box-17"> 
                	<div class="thanks"></div> 
                    <p class="thanksTxt thanksTxt1"> 
                    	<span>Gracias</span> <br> por realizar su compra.
                    </p> 
                    <p class="parrafo2 span-18">
                    	A partir de este momento usted cuenta con 24 horas para acercarse a nuestros locales a recoger su producto(s), si en este lapso de tiempo no se ha dignado a recoger su producto; esta compra sera anulada. Muchas Gracias.
                    </p> 



                    <p class="span-17"> 
                        <label class="lblsubmit"> 
<button class="submit" type="button" 
        onClick="location.href='index.jsp'">
             Aceptar
        </button>
                        </label> 
                    </p> 



                </div>
                
                <%}%>
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
            <li><a href="terminos-y-condiciones.jsp">&bull; Términos Y Condiciones</a></li>
            <li><a href="politica-de-privacidad.jsp">&bull; Política de Privacidad</a></li>
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
            bancaria</a> <a name="cont">contraentrega</a></div>
        <div class="redes">
          <p>Redes sociales</p>
          <a href="http://www.facebook.com/porta7m" target="_blank" name="fb"></a> <a href="http://twitter.com/" target="_blank" name="tw"></a> <a href="http://" target="_blank" name="gp"></a> <a href="" target="_blank" name="sk"></a></div>
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
<script src="../ajax.googleapis.com/ajax/libs/jquery/1.5.1/jquery.min.js"></script> 
<script>window.jQuery || document.write("<script src='js/jquery-1.5.1.min.js'>\x3C/script>")</script> 
 
<script src="js/jquery.bgscroll.js"></script> 
 
<script src="js/jquery.validate.js"></script>
<script src="js/jquery.infieldlabel.min.js"></script>

<script src="ThickBox/thickbox.js" type="text/javascript"></script> 
 
<!-- this is where we put our custom functions --> 
<script src="js/functions.js"></script> 
 
 

                <script>
				$(document).ready(function(){
					$('#wrapper').addClass('background1');
					$('#container').addClass('clouds1');		
				});
				</script> 

<!--GOOGLE REMARKETING (config) - START-->
<!-- Google Code for kodomokids Remarketing List -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1023271663;
var google_conversion_language = "en";
var google_conversion_format = "3";
var google_conversion_color = "ffffff";
var google_conversion_label = "_-i9CNGZsAIQ78X35wM";
var google_conversion_value = 0;
/* ]]> */
</script>
<script type="text/javascript" src="../www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="http://www.googleadservices.com/pagead/conversion/1023271663/?label=_-i9CNGZsAIQ78X35wM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>

 
</body> 

 
<meta http-equiv="content-type" content="text/html;charset=UTF-8"><!-- /Added by HTTrack -->
</html>