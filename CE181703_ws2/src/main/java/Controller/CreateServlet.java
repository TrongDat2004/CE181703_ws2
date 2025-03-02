/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package Controller;

import Dao.Dao;
import Model.movie;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
/**
 *
 * @author Nguyễn Hồ Trọng Đạt_CE181703
 */
@WebServlet(name="CreateServlet", urlPatterns={"/Create"})
public class CreateServlet extends HttpServlet {

    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
     @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("create-movie.jsp").forward(request, response);
    }

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("year")); // Thay đổi ở đây
        double rating = Double.parseDouble(request.getParameter("rating"));
        int isRented = request.getParameter("rented") != null ? 1 : 0; // Thay đổi ở đây

        movie newMovie = new movie(0, title, director, year, rating, isRented);
        Dao dao = new Dao();
        if (dao.create(newMovie) == 1) { // Kiểm tra kết quả thêm phim
            response.sendRedirect("movies.jsp"); // Chuyển hướng về movies.jsp
        } else {
            request.setAttribute("errorMessage", "Cannot create movie");
            request.getRequestDispatcher("create-movie.jsp").forward(request, response); // Quay lại trang tạo phim với thông báo lỗi
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Create a new movie";
    }
}
