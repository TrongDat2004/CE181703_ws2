<%-- 
    Document   : login
    Created on : Oct 21, 2024, 4:01:10 PM
    Author     : Nguyễn Hồ Trọng Đạt_CE181703
--%>

<%@page import="Dao.Dao"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Custom CSS -->
    <style>
        #submit {
            padding: 5px 10px;  /* Giảm đệm để phần màu xanh nhỏ hơn */
            font-size: 16px;     /* Kích thước chữ giữ nguyên */
        }
        .navbar-custom {
            background-color: #f8f9fa; /* Màu nền xám */
        }
        .navbar-custom .nav-link {
            color: black; /* Đổi màu chữ thành đen */
        }
        .navbar-custom .nav-link:hover {
            color: #0056b3; /* Màu chữ khi di chuột qua (tùy chọn) */
        }
        .navbar-toggler {
            border: none; /* Ẩn viền của nút */
        }
        .navbar-toggler-icon {
            width: 30px; /* Chiều rộng của biểu tượng */
            height: 3px; /* Chiều cao của mỗi sọc */
            background-color: #007bff; /* Màu xanh dương cho nút */
            display: inline-block;
            position: relative;
        }
        .navbar-toggler-icon::before,
        .navbar-toggler-icon::after {
            content: '';
            width: 100%;
            height: 100%;
            background-color: #007bff; /* Màu xanh dương cho các sọc */
            position: absolute;
            left: 0;
        }
        .navbar-toggler-icon::before {
            top: -10px; /* Điều chỉnh khoảng cách cho sọc đầu tiên */
        }
        .navbar-toggler-icon::after {
            bottom: -10px; /* Điều chỉnh khoảng cách cho sọc cuối cùng */
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-custom">
        <div class="container">
            <a class="navbar-brand" href="#">MovieRental</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="#">Movies</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="Login">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Xử lý login nếu phương thức POST được gửi từ form -->
    <div class="container">
        <%
            if (request.getMethod().equals("POST")) {
                String name = request.getParameter("username");
                String pass = request.getParameter("password");
                
                if (name.equals("admin") && pass.equals("123456")) {
                    HttpSession sessions = request.getSession();
                    session.setAttribute("username", name);
                    response.sendRedirect("movies.jsp");
                } else {
                    out.println("<div class='alert alert-danger'>Invalid username or password!</div>");
                }
            }
        %>

        <!-- Form đăng nhập -->
        <div class="row justify-content-center">
            <div class="col-md-4">
                <h1 class="text-center my-4">Login</h1>

                <form method="POST" action="Login">
                    <div class="form-group">
                        <label for="u_id">Username</label>
                        <input type="text" class="form-control" id="u_id" name="username" placeholder="Enter username" required>
                    </div>
                    <div class="form-group">
                        <label for="u_pwd">Password</label>
                        <input type="password" class="form-control" id="u_pwd" name="password" placeholder="Enter your password" required>
                    </div>
                    <button type="submit" class="btn btn-primary" id="submit">Login</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
