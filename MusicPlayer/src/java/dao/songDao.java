/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import context.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Song;

/**
 *
 * @author VINH
 */
public class songDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ArrayList<Song> getRandom10() {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "SELECT TOP 10 *\n"
                + "FROM Song\n"
                + "ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void main(String[] args) {
        songDao db = new songDao();
        ArrayList<Song> list = db.getRandom10();
        for (Song s : list) {
            System.out.println(list.size());
        }
    }
}
