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
        String sql = "select s.* from PlayListSongUser p left join Song s on p.IDSong = s.IDSong where p.IDUser = ? and p.IDPlayList = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.setString(2, idPlaylist);
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
            deleteSongPlaylistUser(idUser, idPlaylist);
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteSongPlaylistUser(String idUser, String idPlaylist) {
        String sql = "DELETE FROM [MusicApp].[dbo].[PlayListSongUser]\n"
                + "      where IDUser = ? and IDPlayList = ?";
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
        String sql = "If Not Exists(select * from PlayListUser where IDPlayList = ? and IDUser = ?)\n"
                + "   Begin\n"
                + " INSERT INTO [MusicApp].[dbo].[PlayListUser]\n"
                + "           ([IDPlayList]\n"
                + "           ,[IDUser])\n"
                + "     VALUES\n"
                + "           (?, ?)\n"
                + "\n"
                + " end";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            ps.setString(2, idUser);
            ps.setString(3, idPlaylist);
            ps.setString(4, idUser);
            ps.executeUpdate();
            copyListSongPlaylist(idPlaylist, idUser);
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void copyListSongPlaylist(String idPlaylist, String idUser) {
        String sql = "insert into PlayListSongUser\n"
                + "select plu.IDUser, pls.* from PlayListUser plu left join PlayListSong pls on plu.IDPlayList = pls.IDPlayList where plu.IDUser = ? and pls.IDPlayList = ?";
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

    public void deleteSongToPlaylist(String idPlaylist, String idSong, String idUser) {
        String sql = "DELETE FROM [PlayListSongUser] WHERE IDPlayList = ? and IDSong = ? and IDUser = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idPlaylist);
            ps.setString(2, idSong);
            ps.setString(3, idUser);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void inserSongToPlaylist(String idPlaylist, String idSong, String idUser) {
        String sql = "if not exists (select * from PlayListSongUser where IDUser = ? and IDPlayList = ? and IDSong = ?)\n"
                + "begin\n"
                + "INSERT INTO [MusicApp].[dbo].[PlayListSongUser]\n"
                + "           ([IDUser]\n"
                + "           ,[IDPlayList]\n"
                + "           ,[IDSong])\n"
                + "     VALUES\n"
                + "           (?, ?, ?)\n"
                + "end";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idUser);
            ps.setString(2, idPlaylist);
            ps.setString(3, idSong);
            ps.setString(4, idUser);
            ps.setString(5, idPlaylist);
            ps.setString(6, idSong);
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

    public ArrayList getIdPlaylist(String id) {
        ArrayList list = new ArrayList();
        String sql = "select [IDPlayList] from [PlayListUser] where IDUser = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(rs.getInt(1));
            }
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

//    public void createPlaylist(String name, String image) {
//        String sql = "INSERT INTO [MusicApp].[dbo].[PlayList]\n"
//                + "           ([Name]\n"
//                + "           ,[Image])\n"
//                + "     VALUES\n"
//                + "           (?, ?)";
//        try {
//            conn = new DBContext().getConnection();
//            ps = conn.prepareStatement(sql);
//            ps.setString(1, name);
//            ps.setString(2, image);
//            ps.executeUpdate();
//        } catch (Exception ex) {
//            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
//        }
//    }
    public ArrayList<PlayList> getAllPlaylist() {
        ArrayList list = new ArrayList();
        String sql = "select * from PlayList";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3)));
            }
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deleteSonginPlaylist(String idPlaylist, String idSong) {
        String sql = "DELETE FROM [MusicApp].[dbo].[PlayListSong]\n"
                + "       WHERE IDSong = ? and IDPlayList = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, idSong);
            ps.setString(2, idPlaylist);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void inserSongToPlaylist(String idPlaylist, String idSong) {
        String sql = "INSERT INTO [MusicApp].[dbo].[PlayListSong]\n"
                + "           ([IDPlayList]\n"
                + "           ,[IDSong])\n"
                + "     VALUES\n"
                + "           (?, ?)";
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

    public int getTotal() {
        String sql = "select COUNT(*) from PlayList";
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

    public ArrayList<PlayList> get5Playlist(int pageSize, int index) {
        ArrayList<PlayList> list = new ArrayList<PlayList>();
        String sql = "Select IDPlayList, Name, Image from (select ROW_NUMBER() over(order by IDPlayList) as id, *  from PlayList ) as x where x.id between ?*? -(?-1) and ?*?";
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
                PlayList pl = new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(pl);
            }
        } catch (Exception ex) {
            Logger.getLogger(userDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public ArrayList<PlayList> getPlaylistById(String id) {
        ArrayList<PlayList> list = new ArrayList<PlayList>();
        String sql = "select * from PlayList where IDPlayList =?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                PlayList pl = new PlayList(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(pl);
            }
        } catch (Exception ex) {
            Logger.getLogger(userDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return list;
    }

    public void deletePlaylist(String id) {
        String sql = "  delete from PlayList where IDPlayList =?\n"
                + "  delete from PlayListSong where IDPlayList = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, id);
            ps.setString(2, id);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(userDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
