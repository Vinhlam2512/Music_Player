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
import model.PlayList;
import model.Song;

/**
 *
 * @author VINH
 */
public class playListDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ArrayList<PlayList> getRan5() {
        ArrayList<PlayList> list = new ArrayList<>();
        String sql = "select top 5 * from PlayList order by NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception ex) {
            Logger.getLogger(playListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<PlayList> getPlayListVn() {
        ArrayList<PlayList> list = new ArrayList<>();
        String sql = "select * from PlayList where Name like '%v%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception ex) {
            Logger.getLogger(playListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Song> getSongPlaylist(String idPlaylist) {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select s.IDSong, s.name, s.singer, s.image, s.link from PlayListSong p left join Song s on p.IdSong = s.IDSong where IDPlayList = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
                list.add(song);
            }
        } catch (Exception ex) {
            Logger.getLogger(playListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public PlayList getPlaylist(String idPlaylist) {
        String sql = "select * from [PlayList] where IDPlayList = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception ex) {
            Logger.getLogger(playListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }


    public void deletePlaylistUser(String idUser, String idPlaylist) {
        String sql = "DELETE FROM [PlayListUser] WHERE [IDUser] = ? and [IDPlayList] = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.setString(2, idPlaylist);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void insertPlaylistUser(String idUser, String idPlaylist) {
        String sql = "INSERT INTO [MusicApp].[dbo].[PlayListUser]\n"
                + "           ([IDUser]\n"
                + "           ,[IDPlayList])\n"
                + "     VALUES\n"
                + "           (? ,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.setString(2, idPlaylist);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    public static void main(String[] args) {
        playListDao db = new playListDao();
        db.insertPlaylistUser("3", "1");
    }
}
