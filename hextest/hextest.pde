HexMan man;
void setup() {
  size(400, 400);
  stroke(255);
  fill(127);
  man = new HexMan(6, 6, 30, 30, 20);
}
void draw() {
  background(0);
  man.show();
  fill(192);
  Hex h = man.getByCoords(mouseX, mouseY);
  if (h != null) {
    h.show(man.xo, man.yo);
    if (h.q != 0 && h.q != man.field[0].length - 1 && h.r != 0 && h.r != man.field.length - 1) {
      Hex[] n = h.neighbors();
      int acc = 0;
      for(Hex t : n) {
        acc += t.test;
      }
      text(acc, width - 30, 20);
    }
  }
}
