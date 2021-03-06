/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.admin;

import dao.playListDao;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PlayList;

/**
 *
 * @author VINH
 */
@WebServlet(name = "adminSongPlaylistController", urlPatterns = {"/admin/update-song-playlist"})
public class adminSongPlaylistController extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet adminSongPlaylistController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet adminSongPlaylistController at " + request.getContextPath() + "</h1>");
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
        String type = request.getParameter("type");
        String idSong = request.getParameter("idSong");
        System.out.println(idSong);
        playListDao db = new playListDao();
        ArrayList<PlayList> list = new ArrayList<>();
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        switch (type) {
            case "insert":
                list = db.getPlaylistHaventSong(idSong);
                break;
            case "delete":
                list = db.getPlaylistHaveSong(idSong);
                break;
        }
        for (PlayList pl : list) {
            out.println("<li onclick=" + "updateSongPl('" + type + "'," + pl.getId() + "," + idSong + ")" + ">\n"
                    + "                                    <span>" + pl.getName() + "</span>\n"
                    + "                                </li>");
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
        String idSong = request.getParameter("idSong");
        String idPlaylist = request.getParameter("idPlaylist");
        String type = request.getParameter("type");
        System.out.println(type);
        playListDao db = new playListDao();
        if (type.equals("delete")) {
            db.deleteSonginPlaylist(idPlaylist, idSong);
        }
        if (type.equals("insert")) {
            db.inserSongToPlaylist(idPlaylist, idSong);
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
