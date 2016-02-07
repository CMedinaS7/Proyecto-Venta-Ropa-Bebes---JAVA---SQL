<%-- 
    Document   : index
    Created on : 20-may-2012, 11:33:02
    Author     : user
--%>

<%
            HttpSession sesion = request.getSession(true);
            String Usuario = (String) sesion.getAttribute("Cnombres");
            String Direccion = (String) sesion.getAttribute("Cdireccion");
            String Telefono = (String) sesion.getAttribute("Ctelefono");
            String Email = (String) sesion.getAttribute("Cemail");
	    int total=0;
            int totales=0;
			String a="";
            ArrayList<DetalleVenta> lista = (ArrayList<DetalleVenta>)session.getAttribute("carrito");
            if(lista!=null){
            totales=lista.size();
                              }
        
%>

<%@page contentType="text/html" pageEncoding="UTF-8" import=" Dao.conexion,java.sql.*,java.util.Date,Beans.DetalleVenta,java.util.ArrayList"%>

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
    <div class="logo"> <a href="index.jsp"><img src="image/logo.png"></a></div>
    <%if ((String) sesion.getAttribute("Cnombres") == null) {
		a="comprar1.jsp";
		%>
    
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
              <input class="input required" type="password" name="clave" id="clave">
            </p>
            <p> <a href="%24site_url.html#TB_inline?height=190&width=390&inlineId=RecoveryPwd" 
                            name="&nbsp;&nbsp;&nbsp;Recuperar Contraseña"  id="enlace" class="link2 thickbox"> Olvidó contraseña </a>
              <button class="submitLogin" type="submit">Ingresar</button>
            </p>
          </form>
        </div>
      </div>
      <p> <a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox"> <b>REGISTRARSE</b></a></p>
    </div>
    <%}else{
		a="comprar2.jsp";
		%>
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
      <p> <a href="$site_url.html#TB_inline?height=750&width=420&inlineId=Register" name="&nbsp;&nbsp;&nbsp;&nbsp;Formulario de Registro" class="_link thickbox"> <b>REGISTRARSE</b></a></p>
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
        <li > <a href="bebes.jsp" >Bebes</a></li>
        <li > <a href="niños.jsp" >Niños</a></li>
        <li > <a href="promociones.jsp" >Promociones</a></li>
        <li > <a href="seguridad.jsp" >Novedades</a></li>
      </ul>
    </div>
    <div class="shop" onClick="location.href='carrito.jsp'"></div>
    <div id="apDiv1"><a href="../intranet/login.jsp" target="_blank"><img src="image/btnintranet.png"></a></div>
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
            <div class="grid box-1">

                <div class="box-4 span-4">
                  <div class="box-5 parrafo6">Detalles del Producto</div>
                  <div class="box-6 parrafo6">Cantidad</div>
                  <div class="box-6 parrafo6">Actualizar</div>
                  <div class="box-6 parrafo6">Borrar</div>
                  <div class="box-6 parrafo6">Precio</div>
                </div>
                  
                  <%
        
                                    if(lista!=null){
                                        for (DetalleVenta d : lista) {
                        %>
                  <form action="../moduloVenta" method="post">
                                       
                  <span id="detalles">
                  <div class="box-4 itemList" id="59_489975">
                    <div class="box-5 parrafo6"> <a href="detalle_producto.jsp?prod=<%=d.getProducto().getCodigo()%>" target="_blank"><img src="<%=d.getProducto().getFoto()%>" width="100" height="86"></a><%=d.getProducto().getDescripcion() + " - " + d.getProducto().getMarca()%></div>
                    <div class="box-6 parrafo6 span-5">
                    <input type="hidden" value="<%=d.getProducto().getCodigo()%>" name="prod" id="prod"><input type="hidden" value="ActualizarProducto" name="accion" id="accion"><input type="number" value="<%=d.getCantidad()%>" min="1" max="<%=d.getProducto().getStock()%>" step="1" name="cant" id="cant">
                    </div>
                    <div class="box-6 parrafo6 span-6">
                      <button class="submit" type="submit">OK</button></div>
                    <div class="box-6 parrafo6 span-6"><a href="../moduloVenta?accion=EliminarProducto&prod=<%=d.getProducto().getCodigo()%>" name="borrar" class="delete"></a></div>
                    <div class="box-6 parrafo6 span-7" id="texto_precio_59_489975">s/. <%=Integer.parseInt(String.valueOf(d.getProducto().getPrecio())) * Integer.parseInt(String.valueOf(d.getCantidad()))%> </div>
                   </div>
                   
                </span>
                   </form>     
              <%
			  total=total + (Integer.parseInt(String.valueOf(d.getProducto().getPrecio())) * Integer.parseInt(String.valueOf(d.getCantidad())));
			  }}%>
              <div class="height">
                <label class="total txtRight1" id="total">TOTAL S/. <%=total%>.00</label>
                </div>
                <div>
                <label class="lblsubmit">
                    <button class="submit" onClick="location.href='<%=a%>'" type="submit">Confirmar </button>
                  </label>
                </div>
                  <div>
               <label class="lblsubmit1 left">
                  <button type="submit" onClick="location.href='bebes.jsp?p=1'" class="submit1 submit2">Seguir Comprando</button>
              </label>
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
 


  
</body> 
</html>