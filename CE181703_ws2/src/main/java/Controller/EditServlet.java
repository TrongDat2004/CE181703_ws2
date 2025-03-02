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
@WebServlet(name="EditServlet", urlPatterns={"/Edit"})
public class EditServlet extends HttpServlet {
   
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
        int id = Integer.parseInt(request.getParameter("id"));
        Dao dao = new Dao();
        movie movieToEdit = dao.getoneById(id);
        request.setAttribute("movie", movieToEdit);
        request.getRequestDispatcher("edit-movie.jsp").forward(request, response);
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
        int id = Integer.parseInt(request.getParameter("id")); // Lấy id từ form
        String title = request.getParameter("title");
        String director = request.getParameter("director");
        int year = Integer.parseInt(request.getParameter("year")); // Sửa từ release_year sang year
        double rating = Double.parseDouble(request.getParameter("rating"));
        int isRented = request.getParameter("rented") != null ? 1 : 0; // Sửa từ is_rented sang rented

        movie updatedMovie = new movie(id, title, director, year, rating, isRented);
        Dao dao = new Dao();
        if (dao.update(updatedMovie) == 1) { // Kiểm tra kết quả cập nhật phim
            response.sendRedirect("movies.jsp"); // Chuyển hướng về movies.jsp
        } else {
            request.setAttribute("errorMessage", "Cannot update movie");
            request.getRequestDispatcher("edit-movie.jsp").forward(request, response); // Quay lại trang chỉnh sửa với thông báo lỗi
        }
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Edit a movie";
    }

}
