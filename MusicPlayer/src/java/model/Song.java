/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import lombok.Setter;
import lombok.Getter;

/**
 *
 * @author VINH
 */
@Setter
@Getter
public class Song {
    private int idSong;
    private int idType;
    private String name;
    private String singer;
    private String image;
    private String link;

    public Song() {
    }

    public Song(int idSong, int idType, String name, String singer, String image, String link) {
        this.idSong = idSong;
        this.idType = idType;
        this.name = name;
        this.singer = singer;
        this.image = image;
        this.link = link;
    }

    @Override
    public String toString() {
        return "Song{" + "idSong=" + idSong + ", idType=" + idType + ", name=" + name + ", singer=" + singer + ", image=" + image + ", link=" + link + '}';
    }
    
}
