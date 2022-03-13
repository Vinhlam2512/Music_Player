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
public class PlaylistSong {
    private int idPlaylist;
    private int idSong;

    public PlaylistSong() {
    }

    public PlaylistSong(int idPlaylist, int idSong) {
        this.idPlaylist = idPlaylist;
        this.idSong = idSong;
    }
}
