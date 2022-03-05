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
public class Top100 {

    private String name;
    private String image;

    public Top100() {
    }

    public Top100(String name, String image) {
        this.name = name;
        this.image = image;
    }

    
}
