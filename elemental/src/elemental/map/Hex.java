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
public class Hex {
    PApplet p;
    int q;
    int r;
    int test;
    float size;
    HexMan man;
    
    public Hex(PApplet p, int q, int r, float size, HexMan h) {
        this.p = p;
        this.q = q;
        this.r = r;
        this.size = size;
        this.man = h;
        test = (int) (p.random(4));
    }
    
    public void show(float x, float y) {
        show(x + 1.5f * q * size, y + size * PApplet.sqrt(3) * (.5f * q + r), size, 0);
    }
    
    public void show(float x, float y, float r, float theta) {
        p.beginShape();
        for (float t = 0; t < PApplet.TWO_PI; t += PApplet.TWO_PI / 6) {
            p.vertex(x + PApplet.cos(theta + t) * r,
                     y + PApplet.sin(theta + t) * r);
        }
        p.endShape(PApplet.CLOSE);
        p.fill(255);
        p.text(test, x, y);
    }
    
    public Hex[] neighbors() {
        Hex[] h = {man.field[q + 1][r - 1], man.field[q][r - 1],
                   man.field[q - 1][r], man.field[q - 1][r + 1],
                   man.field[q][r + 1], man.field[q + 1][r]};
        return h;
    }
}