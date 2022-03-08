/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.playListDao;
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
public class loadSongPlaylistController extends HttpServlet {

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
            out.println("<title>Servlet loadSongPlaylistController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet loadSongPlaylistController at " + request.getContextPath() + "</h1>");
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
        String idPlaylist = request.getParameter("idPlaylist");
        playListDao db = new playListDao();
        ArrayList<Song> list = db.getSongPlaylist(idPlaylist);
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.println("        <link href=\"assets/css/zingChart.css\" rel=\"stylesheet\" type=\"text/css\"/>\n"
                + "");
        out.println("<div class=\"chart_content\" id=\"chart_content\">");
        for (Song s : list) {
            out.println("<div class=\"chart_content-song\">\n"
                    + "                                    <div class=\"content_song\" data-id=\"" + s.getId() + "\">\n"
                    + "                                        <div class=\"left d-flex justify-content-center align-items-center\" style=\"width: 40%;\">\n"
                    + "                                            <div class=\"song_image\">\n"
                    + "                                                <a href=\"#\">\n"
                    + "                                                    <img style=\"height: 100%; width: 100%\"\n"
                    + "                                                         src=\"" + s.getImage() + "\"\n"
                    + "                                                         alt=\"\">\n"
                    + "                                                </a>\n"
                    + "                                                <div class=\"modal-play\">\n"
                    + "                                                    <svg fill=\"white\" height=\"512\" viewBox=\"0 0 128 128\" width=\"512\"\n"
                    + "                                                         xmlns=\"http://www.w3.org/2000/svg\">\n"
                    + "                                                    <path\n"
                    + "                                                        d=\"m64 17.249a46.75 46.75 0 1 0 46.751 46.751 46.8 46.8 0 0 0 -46.751-46.751zm0 90a43.25 43.25 0 1 1 43.251-43.249 43.3 43.3 0 0 1 -43.251 43.249z\">\n"
                    + "                                                    </path>\n"
                    + "                                                    <path\n"
                    + "                                                        d=\"m87.1 60.582-31.786-18.353a3.945 3.945 0 0 0 -5.914 3.417v36.706a3.937 3.937 0 0 0 5.918 3.417l31.782-18.354a3.946 3.946 0 0 0 0-6.833zm-1.75 3.8-31.785 18.355a.446.446 0 0 1 -.668-.385v-36.706a.425.425 0 0 1 .223-.386.448.448 0 0 1 .223-.064.438.438 0 0 1 .222.064l31.789 18.353a.446.446 0 0 1 0 .771z\">\n"
                    + "                                                    </path>\n"
                    + "                                                    </svg>\n"
                    + "                                                </div>\n"
                    + "\n"
                    + "                                            </div>\n"
                    + "                                            <div class=\"song_des\">\n"
                    + "                                                <div class=\"song_des-title\">\n"
                    + "                                                    <span>" + s.getName() + "</span>\n"
                    + "                                                </div>\n"
                    + "                                                <div class=\"song_des-singer\">\n"
                    + "                                                    <span>" + s.getSinger() + "</span>\n"
                    + "                                                </div>\n"
                    + "                                            </div>\n"
                    + "                                            <audio src=\"" + s.getLink() + "\"></audio>\n"
                    + "                                        </div>\n"
                    + "                                        <div class=\"song_content\">\n"
                    + "                                            <span>\n"
                    + "                                                " + s.getName() + " (Single)\n"
                    + "                                            </span>\n"
                    + "                                        </div>\n"
                    + "\n"
                    + "                                    </div>\n"
                    + "                                    <div class=\"right me-3 position-relative\" style=\"width: 3%;\">\n"
                    + "                                        <button id='add' style=\"${isLogin ? \"\" : \"display:none\"}\" >\n"
                    + "                                            <svg onclick=\"insert(${s.getId()})\" id=\"unliked\" style=\"height: 38px; width: 38px;\"  fill=\"white\" height=\"480pt\"\n"
                    + "                                                 viewBox=\"0 -20 480 480\" width=\"480pt\" xmlns=\"http://www.w3.org/2000/svg\">\n"
                    + "                                            <path\n"
                    + "                                                d=\"m348 0c-43 .0664062-83.28125 21.039062-108 56.222656-24.71875-35.183594-65-56.1562498-108-56.222656-70.320312 0-132 65.425781-132 140 0 72.679688 41.039062 147.535156 118.6875 216.480469 35.976562 31.882812 75.441406 59.597656 117.640625 82.625 2.304687 1.1875 5.039063 1.1875 7.34375 0 42.183594-23.027344 81.636719-50.746094 117.601563-82.625 77.6875-68.945313 118.726562-143.800781 118.726562-216.480469 0-74.574219-61.679688-140-132-140zm-108 422.902344c-29.382812-16.214844-224-129.496094-224-282.902344 0-66.054688 54.199219-124 116-124 41.867188.074219 80.460938 22.660156 101.03125 59.128906 1.539062 2.351563 4.160156 3.765625 6.96875 3.765625s5.429688-1.414062 6.96875-3.765625c20.570312-36.46875 59.164062-59.054687 101.03125-59.128906 61.800781 0 116 57.945312 116 124 0 153.40625-194.617188 266.6875-224 282.902344zm0 0\">\n"
                    + "                                            </path>\n"
                    + "                                            </svg>\n"
                    + "                                            <svg onclick=\"del(${s.getId()})\" id=\"liked\" id=\"Layer_1\" style=\"height: 38px; width: 38px; display: none\"  \n"
                    + "                                                 fill=\"ping\" height=\"480pt\" viewBox=\"0 0 512 512\" width=\"480pt\"\n"
                    + "                                                 xmlns=\"http://www.w3.org/2000/svg\" data-name=\"Layer 1\">\n"
                    + "                                            <path\n"
                    + "                                                d=\"m449.28 121.43a115.2 115.2 0 0 0 -137.89-35.75c-21.18 9.14-40.07 24.55-55.39 45-15.32-20.5-34.21-35.91-55.39-45a115.2 115.2 0 0 0 -137.89 35.75c-16.5 21.62-25.22 48.64-25.22 78.13 0 42.44 25.31 89 75.22 138.44 40.67 40.27 88.73 73.25 113.75 89.32a54.78 54.78 0 0 0 59.06 0c25-16.07 73.08-49.05 113.75-89.32 49.91-49.42 75.22-96 75.22-138.44 0-29.49-8.72-56.51-25.22-78.13z\"\n"
                    + "                                                fill=\"#f9595f\" />\n"
                    + "                                            </svg>\n"
                    + "                                        </button>\n"
                    + "                                    </div>\n"
                    + "                                </div>");
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
        processRequest(request, response);
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
