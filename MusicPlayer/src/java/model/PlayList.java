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
@Getter
@Setter
public class PlayList {

    private int id;
    private String name;
    private String link;

    public PlayList() {
    }

    public PlayList(int id, String name, String link) {
        this.id = id;
        this.name = name;
        this.link = link;
    }

}
