<%@ page import ="java.sql.*"
 %>
<%
 
    String name = request.getParameter("cname");
    String rank = request.getParameter("crank");
    Integer it=Integer.parseInt(rank);
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/rankingdb?useSSL=false",
            "root", "venky@123");
   try{
    String input="insert into collegeinfo(name,collegerank) values (?,?)";
    PreparedStatement st = con.prepareStatement(input);
    
    st.setString(1,name);
    st.setInt(2,it);
   
    int i=st.executeUpdate();  
   
   if (i > 0) {
        //session.setAttribute("userid", user);		
        response.sendRedirect("admin.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
        response.sendRedirect("index.jsp");
    }
   }
   catch(Exception e)
   {
   	out.print("College Name already Exsists !"+"<a href='index.jsp'>Go to Login</a>");
   }
%>