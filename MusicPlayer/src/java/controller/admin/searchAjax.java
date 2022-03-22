/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.playListDao;
import dao.songDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PlayList;
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
        String id = request.getParameter("id");
        songDao db = new songDao();
        ArrayList<Song> list = db.searchByName(search);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        switch (id) {
            case "1":
                out.println(" <tr class=\"text-center\">\n"
                        + "                                        <th style=\" width: 5%\">ID</th>\n"
                        + "                                        <th style=\" width: 25%\">Name</th>\n"
                        + "                                        <th style=\" width: 25%\">Singer</th>\n"
                        + "                                        <th style=\" width: 15%\">Image</th>\n"
                        + "                                        <th style=\" width: 5%\">Song</th>\n"
                        + "                                        <th style=\" width: 15%\">Options</th>\n"
                        + "                                        <th style=\" width: 10%\">Playlist</th>"
                        + "                                    </tr>");
                for (Song s : list) {
                    out.println("<tr class=\"text-center\">\n"
                            + "                                            <td>" + s.getId() + "</td>\n"
                            + "                                            <td>" + s.getName() + "</td>\n"
                            + "                                            <td>" + s.getSinger() + "</td>\n"
                            + "                                            <td><img src=\"" + s.getImage() + "\" style=\"width: 100px; height: 100px\"></td>\n"
                            + "                                            <td><button onclick=\"preview(this.getAttribute('data-src'))\" data-src=\"" + s.getLink() + "\">Preview</button>\n"
                            + "                                            </td>\n"
                            + "                                            <th><button onclick=\"update(" + s.getId() + ")\">Update</button><button onclick=\"isConfirm(" + s.getId() + ")\">Delete</button></th>\n"
                            + "                                            <th>\n"
                            + "                                                <button onclick=\"addSong('insert', " + s.getId() + ")\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">Add</button>\n"
                            + "                                                <button onclick=\"addSong('delete', " + s.getId() + ")\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">Delete</button>\n"
                            + "                                            </th>"
                            + "                                        </tr>");
                }
                break;
            case "2":
                out.println(" <tr class=\"text-center\">\n"
                        + "                                        <th style=\" width: 5%\">ID</th>\n"
                        + "                                        <th style=\" width: 25%\">Name</th>\n"
                        + "                                        <th style=\" width: 25%\">Singer</th>\n"
                        + "                                        <th style=\" width: 15%\">Image</th>\n"
                        + "                                        <th style=\" width: 5%\">Song</th>\n"
                        + "                                        <th style=\" width: 15%\">Options 1</th>\n"
                        + "                                        <th style=\" width: 15%\">Options 2</th>\n"
                        + "                                    </tr>");
                for (Song s : list) {
                    out.println("<tr class=\"text-center\"  data-id=\"" + s.getId() + "\">\n"
                            + "                                            <td>" + s.getId() + "</td>\n"
                            + "                                            <td>" + s.getName() + "</td>\n"
                            + "                                            <td>" + s.getSinger() + "</td>\n"
                            + "                                            <td><img src=\"" + s.getImage() + "\" style=\"width: 100px; height: 100px\"></td>\n"
                            + "                                            <td><button onclick=\"preview(this.getAttribute('data-src'))\" data-src=\"" + s.getLink() + "\">Preview</button>\n"
                            + "                                            </td>\n"
                            + "                                            <td> <button onclick=\"addSong('insert', " + s.getId() + ")\">Add</button>\n"
                            + "                                            </td>\n"
                            + "                                            <td><input type=\"checkbox\" value=\"" + s.getId() + "\" name=\"id\"></td>\n"
                            + "                                        </tr>");
                }
                break;

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
        String search = request.getParameter("search");
        playListDao db = new playListDao();
        ArrayList<PlayList> list = db.searchByName(search);
        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        out.println(" <tr class=\"text-center\">\n"
                + "                                        <th style=\" width: 10%\">ID</th>   \n"
                + "                                        <th style=\" width: 30%\">Name</th>\n"
                + "                                        <th style=\" width: 25%\">Image</th>\n"
                + "                                        <th style=\" width: 20%\">Options</th>\n"
                + "                                        <th style=\" width: 15%\">Playlist</th>"
                + "                                    </tr>");
        for (PlayList s : list) {
            out.println(" <tr class=\"text-center\">\n"
                    + "                                            <td>" + s.getId() + "</td>\n"
                    + "                                            <td>" + s.getName() + "</td>\n"
                    + "                                            <td><img src=\"" + s.getLink() + "\" style=\"width: 100px; height: 100px\"></td>\n"
                    + "                                            <th><button onclick=\"update(" + s.getId() + ")\">Update</button><button onclick=\"isConfirm(" + s.getId() + ")\">Delete</button></th>\n"
                    + "                                            <th>\n"
                    + "                                                <button onclick=\"addSong('insert', " + s.getId() + "\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">Add</button>\n"
                    + "                                                <button onclick=\"addSong('delete', " + s.getId() + "\" data-bs-toggle=\"modal\" data-bs-target=\"#exampleModal\">Delete</button>\n"
                    + "                                            </th>\n"
                    + "                                        </tr>");
        }
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
