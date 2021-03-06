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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.PlayList;
import model.Song;

/**
 *
 * @author VINH
 */
@WebServlet(name = "addManySongPlaylistController", urlPatterns = {"/admin/add-song-playlist"})
public class addManySongPlaylistController extends HttpServlet {

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
            out.println("<title>Servlet addManySongPlaylistController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet addManySongPlaylistController at " + request.getContextPath() + "</h1>");
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
        String id = request.getParameter("id");
        ArrayList<Song> list = new ArrayList<>();
        if (id != null) {
            songDao db = new songDao();
            playListDao pldb = new playListDao();
            PlayList pl = pldb.getPlaylist(id);
            list = db.getSongNotInPlayList(id);
            request.setAttribute("pl", pl);
        }
        request.setAttribute("list", list);
        request.getRequestDispatcher("listSong.jsp").forward(request, response);
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
        playListDao db = new playListDao();
        String idPlaylist = request.getParameter("idPlaylist");
        String[] idSongs = request.getParameterValues("idSongs");
        System.out.println(idSongs.length);
        for (String ids : idSongs) {
            System.out.println(ids);
            db.inserSongToPlaylist(idPlaylist, ids);
        }
        response.sendRedirect("./add-song-playlist?id=" + idPlaylist);
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
