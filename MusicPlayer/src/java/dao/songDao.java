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
        String sql = "SELECT TOP 10 Name, Singer, Image, Link FROM Song ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Song> getTop10() {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select Name, Singer, Image, Link from (select ROW_NUMBER() over(order by IDSong) as r, * from Song where IDType = 1) as x where x.r < 11";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Song> getTop100() {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select Name, Singer, Image, Link from (select ROW_NUMBER() over(order by IDSong) as r, * from Song where IDType = 1) as x where x.r > 10 and x.r <= 100";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
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
