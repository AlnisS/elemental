/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elemental.map;

import processing.core.*;
/**
 *
 * @author chrx
 */
public class HexMan {
    PApplet p;
    Hex[][] field;
    float xo;
    float yo;
    float size;
    public HexMan(PApplet p, int qs, int rs, float xo, float yo, float size) {
        this.p = p;
        this.xo = xo;
        this.yo = yo;
        this.size = size;
        field = new Hex[qs][rs];
        for (int i = 0; i < qs; i++) {
            for (int j = 0; j < rs; j++) {
                field[i][j] = new Hex(p, i, j, size, this);
            }
        }
    }
    
    public void show() {
        for (Hex[] ha : field) {
            for (Hex h : ha) {
                p.fill(127);
                h.show(xo, yo);
            }
        }
    }
    
    public Hex getByCoords(float x, float y) {
        int q = (int) (PApplet.round((x-xo) / 1.5f / size));
        int r = (int) (PApplet.round((y-yo) / PApplet.sqrt(3) / size - .5f*q));
        return q >= 0 && q < field[0].length && r >= 0 && r < field.length ?
                field[q][r] : null;
    }
    
    public void highlight() {
        p.fill(192);
        Hex h = getByCoords(p.mouseX, p.mouseY);
        if (h != null) {
            h.show(xo, yo);
            if (h.q != 0 && h.q != field[0].length - 1 &&
                    h.r != 0 && h.r != field.length - 1) {
                Hex[] n = h.neighbors();
                int acc = 0;
                for(Hex t : n) {
                    acc += t.test;
                }
                p.text(acc, p.width - 30, 20);
            }
        }
    }
}