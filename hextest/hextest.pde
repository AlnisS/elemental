Hex[][] field;
void setup() {
  size(400, 400);
  stroke(255);
  fill(127);
  field = new Hex[6][6];
  for (int i = 0; i < 6; i++) {
    for (int j = 0; j < 6; j++) {
      field[i][j] = new Hex(i, j, field);
    }
  }
}
void draw() {
  background(0);
  for (Hex[] ha : field) {
    for (Hex h : ha) {
      fill(127);
      h.show(20, 20);
    }
  }
  fill(192);
  Hex h = getByCoords(mouseX, mouseY, 20);
  if (h != null) {
    h.show(20, 20);
    if (h.q != 0 && h.q != 5 && h.r != 0 && h.r != 5) {
      Hex[] n = h.neighbors();
      int acc = 0;
      for(Hex t : n) {
        acc += t.test;
      }
      text(acc, width - 30, 20);
    }
  }
}
