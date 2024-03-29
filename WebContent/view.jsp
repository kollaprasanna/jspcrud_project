<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.javatpoint.bean.UserDao,com.javatpoint.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<%@ page import="java.util.*,com.javatpoint.bean.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Users List</h1>
	<%
		String spageid = request.getParameter("page");
		int pageid = Integer.parseInt(spageid);
		int total = 5;
		if (pageid == 1) {
		} else {
			pageid = pageid - 1;
			pageid = pageid * total + 1;
		}
		List<User> list = UserDao.getRecords(pageid, total);

		out.print("<h1>Page No: " + spageid + "</h1>");
		out.print("<table border='1' cellpadding='4' width='60%'>");
		out.print(
				"<tr><th>Id</th><th>Name</th><th>Password</th><th>Email</th><th>Sex</th><th>Country</th><th>Edit</th><th>Delete</th>");
		for (User e : list) {
			out.print("<tr><td>" + e.getId() + "</td><td>" + e.getName() + "</td><td>" + e.getPassword() + "</td><td>"+ e.getEmail() + "</td><td>" + e.getSex() + "</td><td>" + e.getCountry() + "</td>");
			out.print("<td><a href='editform.jsp?id=" + e.getId() + "'>Edit</a></td>");
			out.print("<td><a href='deleteuser.jsp?id=" + e.getId() + "'>Delete</a></td></tr>");
			
		}
		out.println("</table>");
		out.print("<a href='adduserform.jsp'>Add New User</a><br>");
	%>
	<a href="view.jsp?page=1">1</a>
	<a href="view.jsp?page=2">2</a>
	<a href="view.jsp?page=3">3</a> <br>
	<a href="login.jsp">logout</a>
</body>
</html>