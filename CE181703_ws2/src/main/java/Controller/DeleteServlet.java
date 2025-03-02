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
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 *
 * @author Nguyễn Hồ Trọng Đạt_CE181703
 */
@WebServlet(name = "DeleteServlet", urlPatterns = {"/Delete"})
public class DeleteServlet extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        // Kiểm tra phiên làm việc
        HttpSession currentSession = request.getSession(false);
        if (currentSession == null || currentSession.getAttribute("username") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int id = Integer.parseInt(request.getParameter("id"));
        Dao dao = new Dao();
        movie m = dao.getoneById(id);

        // Kiểm tra xem bộ phim có tồn tại không
        if (m != null) {
            request.setAttribute("movie", m); // Gửi thông tin bộ phim đến JSP
            request.getRequestDispatcher("delete-movie.jsp").forward(request, response);
        } else {
            request.setAttribute("errorMessage", "There is no movie with that id");
            request.getRequestDispatcher("movies.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Dao dao = new Dao();

        // Xóa bộ phim
        if (dao.delete(id) == 1) {
            response.sendRedirect("movies.jsp");
        } else {
            request.setAttribute("errorMessage", "Cannot delete the movie");
            request.getRequestDispatcher("movies.jsp").forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Delete a movie";
    }

}
