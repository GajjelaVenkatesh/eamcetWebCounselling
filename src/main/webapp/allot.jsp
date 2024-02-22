<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!private static class StudentItem {
		String name;
		int rank;
		String email;
		String college_alloted;

		StudentItem(String st, String clg, int v, String email) {
			name = st;
			this.rank = v;
			this.college_alloted = clg;
			this.email = email;
		}
	}%>
<%
	List<StudentItem> studentlist = new ArrayList<StudentItem>();

	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection(
	"jdbc:mysql://localhost:3306/rankingdb?useSSL=false", "root",
	"venky@123");
	PreparedStatement ps = con
	.prepareStatement("select * from studentinfo where email not in ('admin@gmail.com')  ;");

	ResultSet rs = ps.executeQuery();
	while (rs.next()) {
		studentlist.add(new StudentItem(rs.getString("name"), rs
		.getString("college_alloted"), rs.getInt("student_rank"),rs.getString("email")));

	}
	int k;
	try {
		for (int i = 0; i < studentlist.size(); i++) {
	String input = "update studentinfo set college_alloted=? "+" where email="+"'"+studentlist.get(i).email+"'";

	PreparedStatement st = con.prepareStatement(input);
	
String s=request.getParameter(studentlist.get(i).email + "p");
System.out.println(s+ "test");
st.setString(1,s);
		
	//ResultSet rs;
	k = st.executeUpdate();
	 if(k<0) {
		response.sendRedirect("index.jsp");
	}
	 else{
			response.sendRedirect("success.jsp");
		}

		}
	} catch (Exception e) {
		out.print("User Name already Exsists !"
		+ "<a href='index.jsp'>Go to Login</a>");
	}
%>