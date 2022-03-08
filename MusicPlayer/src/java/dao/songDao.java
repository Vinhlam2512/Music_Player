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
        String sql = "SELECT TOP 10 IdSong, Name, Singer, Image, Link FROM Song ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Song> getTop20VN(String idType) {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select top 20 IdSong, Name, Singer,Image, Link from Song where IDType = ? ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idType);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
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

    public void insertFavorSong(String idUser, String idSong) {
        String sql = "INSERT INTO [MusicApp].[dbo].[FavorSong]\n"
                + "           ([IDUser]\n"
                + "           ,[IDSong])\n"
                + "     VALUES\n"
                + "           (? ,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.setString(2, idSong);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteFavorSong(String idUser, String idSong) {
        String sql = "DELETE FROM FavorSong WHERE IDUser = ? and IDSong = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.setString(2, idSong);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<Song> searchByName(String search) {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "SELECT IdSong, Name, Singer, Image, Link FROM Song where Name like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Song> getAllSongOfSearch(String search) {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "SELECT IdSong, Name, Singer, Image, Link FROM Song where Name like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public ArrayList<Song> getFavorSong(int idUser) {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select s.IDSong, s.Name, s.Singer, s.Image, s.Link from song s left join FavorSong f on s.IDSong = f.IDSong where f.IDSong is not null and f.IDUser = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
}
