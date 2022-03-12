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
import model.PlaylistUser;

/**
 *
 * @author VINH
 */
public class playlistUserDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public ArrayList<PlaylistUser> getPlaylistUser(String idUser) {
        String sql = "SELECT * FROM [PlayListUser] where IDUser = ?";
       
    }
}
