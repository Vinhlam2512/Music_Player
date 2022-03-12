/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import lombok.Getter;
import lombok.Setter;

/**
 *
 * @author VINH
 */
@Setter
@Getter
public class PlaylistUser {

    private int idUser;
    private int idPlaylist;

    public PlaylistUser() {
    }

    public PlaylistUser(int idUser, int idPlaylist) {
        this.idUser = idUser;
        this.idPlaylist = idPlaylist;
    }

}
