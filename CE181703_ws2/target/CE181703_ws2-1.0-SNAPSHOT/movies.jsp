<%-- 
    Document   : movies
    Created on : Oct 21, 2024, 4:01:10 PM
    Author     : Nguyễn Hồ Trọng Đạt_CE181703
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Model.movie"%>
<%@page import="Dao.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    HttpSession currentSession = request.getSession(false);
    if (currentSession == null || currentSession.getAttribute("username") == null) {
        response.sendRedirect("Login");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>Movie Rental</title>
    </head>
    <body>
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-light bg-light">
                <a class="navbar-brand" href="#">Movie Rental</a>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="#">Movies</a>
                        </li>
                        <% if (currentSession.getAttribute("username") == null) {%>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a> 
                        </li>
                        <%} else {%>
                        <li class="nav-item"><p>Hi, ${sessionScope.username}</p></li>
                        <li class="nav-item"> 
                            <a class="nav-link" href="Logout">Logout</a>
                        </li>
                        <%}%>
                    </ul>
                </div>
            </nav>
            <%
                Dao gDao = new Dao();
                ArrayList<movie> list = gDao.getAll();
            %>

            <h1>Movies list</h1>

            <br>
            <a href="Create"><button class="btn btn-success">Create</button></a>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Title</th>
                        <th>Director</th>
                        <th>Release Year</th>
                        <th>Rating</th>
                        <th>Rent</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <% for (movie g : list) {%>
                <tr>
                    <td><%=g.getId()%></td>
                    <td><%=g.getTitle()%></td>
                    <td><%=g.getDirector()%></td> 
                    <td><%=g.getRelease_year()%></td>
                    <td><%=g.getRating()%></td>
                    <td>
                        <input class="form-check-input" type="checkbox" <%=g.getIs_rented() == 1 ? "checked" : ""%> disabled>
                    </td>
                    <td> 
                        <a href="Edit?id=<%=g.getId()%>"><button class="btn btn-primary">Edit</button></a>
                        <a href="Delete?id=<%=g.getId()%>"><button class="btn btn-danger">Delete</button></a>
                    </td>
                </tr>
                <%}%>
            </table>
        </div>
    </body>
</html>
