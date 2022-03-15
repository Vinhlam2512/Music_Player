/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.songDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Song;

/**
 *
 * @author VINH
 */
public class searchAjax extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet searchAjax</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet searchAjax at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        String search = request.getParameter("search");
        songDao db = new songDao();
        ArrayList<Song> list = db.searchByName(search);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        out.println(" <tr class=\"text-center\">\n"
                + "                                        <th style=\" width: 25%\">Name</th>\n"
                + "                                        <th style=\" width: 25%\">Singer</th>\n"
                + "                                        <th style=\" width: 15%\">Image</th>\n"
                + "                                        <th style=\" width: 5%\">Song</th>\n"
                + "                                        <th style=\" width: 25%\">Options</th>\n"
                + "                                        <th style=\" width: 5%\"></th>\n"
                + "                                    </tr>");
        for (Song s : list) {
            out.println("<tr class=\"text-center\">\n"
                    + "                                            <td>" + s.getName() + "</td>\n"
                    + "                                            <td>" + s.getSinger() + "</td>\n"
                    + "                                            <td><img src=\"" + s.getImage() + "\" style=\"width: 100px; height: 100px\"></td>\n"
                    + "                                            <td><button onclick=\"preview(this.getAttribute('data-src'))\" data-src=\"" + s.getLink() + "\">Preview</button>\n"
                    + "                                            </td>\n"
                    + "                                            <th><button onclick=\"update()\">Update</button><button>Delete</button></th>\n"
                    + "                                            <th><button>Add</button></th>\n"
                    + "                                        </tr>");
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

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
