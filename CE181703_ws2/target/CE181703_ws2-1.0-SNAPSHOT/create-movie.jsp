<%-- 
    Document   : create-movie
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
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Create new movie</h1>
        <%
            
                if (request.getMethod().equals("POST")) {
                    String title = request.getParameter("title");
                    String director = request.getParameter("director");
                    int year = Integer.parseInt(request.getParameter("year"));
                    Double rating = Double.parseDouble(request.getParameter("rating"));
                    String isrented = request.getParameter("rented");
                    if (isrented == null) {
                        isrented = "0";
                    }
                    int check = Integer.parseInt(isrented);

                    Dao gDao = new Dao();
                    if (gDao.create(new movie(0, title, director, year, rating, check)) == 1) {
                        response.sendRedirect("movies.jsp");
                    }

                } else {

        %>
        <form action="Create" method="POST">
            <div> 
                <label class="form-label">Title</label>
                <input class="form-control" type="text" name="title" id="title" required="">
                <br>
                <label class="form-label">Director</label>
                <input class="form-control" type="text" name="director" id="director" required="">
                <br>
                <label class="form-label">Release Year</label>
                <input class="form-control" type="number" name="year" min="1900" max="2024" step="1" id="release_year" required>
                <br>
                <label class="form-label">Rating</label>
                <input class="form-control" type="number" name="rating" id="rating" min="0" max="10" step="0.1"required="">
                <br>
                <label class="form-label">Is Rented?</label>
                <input class="form-check-input" type="checkbox" name="rented" id="is_rented" value="1">
            </div>
            <div>

                <button class="btn btn-secondary" type="button" onclick="location.href = 'List';" id="back">Back</button>

                <input class="btn btn-primary" type="submit" value="Create" id="submit">
            </div>
        </form>
        <%}
             

        %>
    </body>
</html>
