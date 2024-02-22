<%@ page import="java.sql.*"%>
<%
System.out.println(request.getParameter("email"));
	String email = request.getParameter("email");
	String password = request.getParameter("password");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/rankingdb?useSSL=false", "root",
			"venky@123");
	PreparedStatement ps = con
			.prepareStatement("select * from studentinfo where email=?");

	ps.setString(1, email);

	ResultSet rs = ps.executeQuery();
	String original;
	if (rs.next()) {
		original = rs.getString("password");
		//ResultSet rs;

		if (original.equals(password) == true) {
			//session.setAttribute("userid", user);
			//response.sendRedirect("user.jsp");
			if (email.equals("admin@gmail.com")) {

				session.setAttribute("email", email);
				response.sendRedirect("admin.jsp");
			} else

			{
				session.setAttribute("email", email);
				response.sendRedirect("user.jsp");
			}
		}

		else {
			
			
			
		}
	}
%>