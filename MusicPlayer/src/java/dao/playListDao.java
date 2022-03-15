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
import model.PlaylistUser;
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
        String sql = "select s.* from PlayListSong p left join Song s on p.IdSong = s.IDSong where IDPlayList = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
                list.add(song);
            }
        } catch (Exception ex) {
            Logger.getLogger(playListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Song> getSongPlaylistUser(String idPlaylist, String idUser) {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select s.* from Song s right join \n"
                + "(select plsu.* from PlayListUser plu left join PlayListSongUser plsu on plu.IDPlayList = ? where plu.IDUser=?) \n"
                + "as x on s.IDSong = x.IDSong";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            ps.setString(2, idUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6));
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
     public void deleteSongPlaylistUser(String idUser, String idPlaylist) {
        String sql = "DELETE FROM [PlayListSongUser] WHERE [IDUser] = ? and [IDPlayList] = ?";
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
            copyListSongPlaylisy(idUser);
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void copyListSongPlaylisy(String idUser) {
        String sql = "INSERT INTO PlayListSongUser\n"
                + "SELECT * FROM PlayListSong pls where pls.IDPlayList  = (select IDPlayList from PlayListUser where IDUser = ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        playListDao db = new playListDao();
        db.insertPlaylistUser("3", "1");
    }

    public ArrayList<PlayList> getPlaylistUser(String idUser) {
        String sql = "select pl.* from PlayList pl right join PlayListUser plu on pl.IDPlayList = plu.IDPlayList where plu.IDUser = ?";
        ArrayList<PlayList> list = new ArrayList<>();
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception ex) {
            Logger.getLogger(playListDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteSongToPlaylist(String idPlaylist, String idSong) {
        String sql = "DELETE FROM [PlayListSongUser] WHERE IDPlayList = ? and IDSong = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            ps.setString(2, idSong);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void inserSongToPlaylist(String idPlaylist, String idSong) {
        String sql = "INSERT INTO [MusicApp].[dbo].[PlayListSongUser]\n"
                + "           ([IDPlayList]\n"
                + "           ,[IDSong])\n"
                + "     VALUES\n"
                + "           (?,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            ps.setString(2, idSong);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<PlayList> getRandom5() {
        ArrayList<PlayList> list = new ArrayList<>();
        String sql = "SELECT TOP 5 * FROM PlayList ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlayList pl = new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(pl);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<PlayList> getTop100() {
        ArrayList<PlayList> list = new ArrayList<>();
        String sql = "SELECT * FROM PlayList where Name like '%100%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                PlayList pl = new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(pl);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void addPlaylist(String name, String image) {
        String sql = "INSERT INTO [MusicApp].[dbo].[PlayList]\n"
                + "           ([Name]\n"
                + "           ,[Image])\n"
                + "     VALUES\n"
                + "           (?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<PlayList> searchByName(String search) {
         ArrayList<PlayList> list = new ArrayList<>();
        String sql = "SELECT * FROM PlayList where Name like ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, "%" + search + "%");
            rs = ps.executeQuery();
            while (rs.next()) {
                PlayList pl = new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(pl);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList getIdPlaylist(int id) {
         ArrayList list = new ArrayList();
        String sql = "select [IDPlayList] from [PlayListUser] where IDUser = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

}
