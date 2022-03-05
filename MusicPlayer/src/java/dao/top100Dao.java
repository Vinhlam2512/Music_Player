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
import model.Top100;

/**
 *
 * @author VINH
 */
public class top100Dao {

    private Connection conn;
    private PreparedStatement ps;
    private ResultSet rs;

    public ArrayList<Top100> getRan5() {
        ArrayList list = new ArrayList();
        String sql = "SELECT TOP 5 Name, Image FROM Top100 ORDER BY NEWID()";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Top100 t = new Top100(rs.getString(1), rs.getString(2));
                list.add(t);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(top100Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Top100> getTopVN() {
        ArrayList list = new ArrayList();
        String sql = "select Name, Image from top100 where Name LIKE N'%Việt%'";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Top100 t = new Top100(rs.getString(1), rs.getString(2));
                list.add(t);
            }
            return list;
        } catch (Exception ex) {
            Logger.getLogger(top100Dao.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

}
