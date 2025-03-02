<%-- 
    Document   : delete-movie
    Created on : Oct 21, 2024, 4:01:10 PM
    Author     : Nguyễn Hồ Trọng Đạt_CE181703
--%>

<%@page import="Model.movie"%>
<%@page import="Dao.Dao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%
    HttpSession currentSession = request.getSession(false);
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("Login");
        return;
    }
%>
<!DOCTYPE html>
<%
    Dao Gdao = new Dao();
    int id = 0;
    String checked = request.getParameter("id");
    if (checked != null) {
        id = Integer.parseInt(checked);
    }

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>

        <h1>Delete movie</h1>
        <%           
                if (checked != null) {

                    if (request.getMethod().equals("POST")) {
                        if (Gdao.delete(id) == 1) {
                            response.sendRedirect("movies.jsp");
                        } else { %>
        <p> Cannot delete </p>

        <% }
        } else {

            movie m = Gdao.getoneById(id);
            if (m != null) {
        %>
        <form method="POST">
            <p>Are you sure to delete movie <b class="m_title"><%=m.getTitle()%> </b>with id <b class="m_id"><%=m.getId()%></b>?</p>
            <button class="btn btn-secondary" type="button" onclick="location.href = 'List'" id="back">Back</button>
            <button class="btn btn-danger" id="submit">Delete </button>
        </form>
        <%

          } else {%>
        <p> There is no movie with that id</p>
        <%}
            }
        } else {%>
        <p> There is no movie with that id</p>
        <%}
       
        %>
    </body>
</html>
