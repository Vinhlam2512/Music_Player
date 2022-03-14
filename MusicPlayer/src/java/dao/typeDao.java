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
import model.Type;

/**
 *
 * @author VINH
 */
public class typeDao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ArrayList<Type> getAllType() {
        ArrayList<Type> list = new ArrayList<>();
        String sql = "SELECT * from [Type]";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Type t = new Type(rs.getInt(1), rs.getString(2));
                list.add(t);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(songDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
