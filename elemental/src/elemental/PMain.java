/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package elemental;

import processing.core.*;
import elemental.map.*;
/**
 *
 * @author chrx
 */
public class PMain extends PApplet{
    HexMan man;
    @Override
    public void settings() {
        size(400, 400);
    }
    
    @Override
    public void setup() {
        stroke(255);
        fill(127);
        man = new HexMan(this, 6, 6, 30f, 30f, 20f);
    }
    
    @Override
    public void draw() {
        background(0);
        man.show();
        man.highlight();
    }
}
