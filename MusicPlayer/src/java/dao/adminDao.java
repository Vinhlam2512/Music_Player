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
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Admin;
import model.User;

/**
 *
 * @author VINH
 */
public class adminDao {
    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public Admin login(String email, String password) {
        String sql = "select * from [Admin] where Email = ? and PassWord = ?";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Admin(rs.getString(1), rs.getString(2), rs.getString(3));
            }
        } catch (Exception ex) {
            Logger.getLogger(userDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void register(String fullName, String email, String password) {
        String sql = "INSERT INTO [MusicApp].[dbo].[Admin]\n"
                + "           ([FullName]\n"
                + "           ,[Email]\n"
                + "           ,[PassWord])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, password);
            ps.executeUpdate();
        } catch (Exception ex) {
            Logger.getLogger(userDao.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public static void main(String[] args) {
        adminDao db = new adminDao();
        Admin ad = db.login("admin@gmail.com", "123456");
        System.out.println(ad.getEmail());
    }

}
