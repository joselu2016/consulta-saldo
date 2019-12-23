<%@page import="java.sql.*"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link href="css/estilos.css" rel="stylesheet">
    </head>
    <body>
      <div id="encabezado">microservicio consulta de saldos</div>
<div id="cuerpo">
<center>
    <form  method="post" >
<table  border="0"  >
  <tr bgcolor="#FFCC00">
    <td width="216">ingrese numero de cuenta</td>
    <td width="255"><label for="busca"></label>
      <input type="text" name="busca" id="busca" class="cajaGrande"></td>
    <td width="188"> <input type="submit" name="b" value="Buscar"></td>
  </tr>
 
</table></form>
    
   <%
    String userid = request.getParameter("busca");    
    String pwd = request.getParameter("pass");
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banco","root","");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from cuentas where ncuenta='" + userid + "' ");
    if (rs.next()) { 
        %>  
    

<table width="406" border="0">
  <tr>
    <td width="133">cuenta:</td>
    <td width="257"><%= rs.getString("ncuenta")%></td>
  </tr>
  <tr>
    <td>Nombres::</td>
    <td><%= rs.getString("nombres")%></td>
  </tr>
     <td>cedula:</td>
    <td><%= rs.getString("cliente")%></td>
  </tr>
  <tr>
    <td>saldo actual:</td>
    <td><%= rs.getString("montobase")%></td>
  </tr>
  
</table>
| 
<%}%>


</center>


</div>
<div id="pie">devop's </div>
    </body>
</html>
