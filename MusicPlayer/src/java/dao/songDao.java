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

    public ArrayList getIdFavorSong(String idUser) {
        ArrayList list = new ArrayList();
        String sql = "select IDSong from FavorSong where IDUser = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;

    }

    public ArrayList<PlayList> getPlaylistUser(int idUser) {
        ArrayList<PlayList> list = new ArrayList();
        String sql = "select pl.* from PlayList pl right join PlayListUser plu on pl.IDPlayList = plu.IDPlayList where plu.IDUser = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, idUser);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<Song> getAllSong() {
        ArrayList<Song> list = new ArrayList<>();
        String sql = "select IdSong, Name, Singer,Image, Link from Song";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5).trim());
                list.add(song);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotal() {
        String sql = "select COUNT(*) from song";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return 0;
    }

    public ArrayList<Song> get10Song(int pageSize, int index) {
        ArrayList<Song> list = new ArrayList<Song>();
        String sql = "Select IdSong, Name, Singer,Image, Link from (select ROW_NUMBER() over(order by IdSong) as id, *  from song ) as x where x.id between ?*? -(?-1) and ?*?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setInt(1, pageSize);
            ps.setInt(2, index);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageSize);
            ps.setInt(5, index);
            rs = ps.executeQuery();
            while (rs.next()) {
                Song song = new Song(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5).trim());
                list.add(song);
            }

        } catch (Exception ex) {
            Logger.getLogger(userDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }
    
    public static void main(String[] args) {
        songDao db = new songDao();
        ArrayList<Song> list = db.get10Song(10, 3);
        for (Song s : list) {
            System.out.println(s.getName());
        }
    }

}
