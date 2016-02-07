<%-- 
    Document   : PersonalTodos
    Created on : 22-may-2010, 0:59:31

--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%@page  import="Dao.conexion"%>


<%@page  import="java.io.*"%>
<%@page  import="java.sql.Connection"%>
<%@page  import="java.sql.DriverManager"%>
<%@page  import="java.util.HashMap"%>
<%@page  import="java.util.Map"%>
<%@page  import="net.sf.jasperreports.engine.*"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Reporte Personal</title>
    </head>

        <%
        Connection conn=null;
        conexion con= new conexion();
        conn=con.getAccesoBD();

        File reportfile = new File(application.getRealPath("intranet/reportes/ventas.jasper"));

        Map parameter= new HashMap();

        byte[] bytes = JasperRunManager.runReportToPdf(reportfile.getPath(), parameter,conn);

        response.setContentType("application/pdf");

        response.setContentLength(bytes.length);

        ServletOutputStream outputStream= response.getOutputStream();

        outputStream.write(bytes,0,bytes.length);

        outputStream.flush();

        outputStream.close();

        %>
    </body>
</html>

