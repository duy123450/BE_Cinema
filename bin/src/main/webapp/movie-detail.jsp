<%@page import="java.util.Map.Entry"%>
<%@page import="model.Show"%>
<%@page import="model.Theater"%>
<%@page import="java.util.Map"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="model.Movie"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="./partial/header.jsp"></jsp:include>
	<h1>CHI TIẾT PHIM</h1>
	
	<%
	Movie foundMovie = (Movie) request.getAttribute("foundMovie");
	Map<Theater, List<Show>> theaterMap = (Map<Theater, List<Show>>) request.getAttribute("theaterMap");
	%>

	<ul>
		<li>Tên phim: <%=foundMovie.getTitle() %></li>
		<li>Hình ảnh: <%=foundMovie.getImage() %></li>
		<li>Thể loại: <%=foundMovie.getGenre() %></li>
		<li>Thời lượng: <%=foundMovie.getDuration() %> phút</li>
		<li>Khởi chiếu: <%=new SimpleDateFormat("dd/MM/yyyy").format(foundMovie.getReleaseDateAt()) %></li>
	</ul>
	
	<br>
	
	<ul>
		<%
		for(Entry<Theater, List<Show>> entry : theaterMap.entrySet()) {
		%>
		<li><%= entry.getKey().getName()%>
			<ul>
				<%
				for(Show show : entry.getValue()) {
				%>
				<li><%= show.getStartAt()%> (<a href="./getShowDetail?id=<%= show.getShowId()%>">Xem chi tiết</a>)</li>
				<%
				}
				%>
			</ul>
		</li>
		<%
		}
		%>
	</ul>
	
</body>
</html>