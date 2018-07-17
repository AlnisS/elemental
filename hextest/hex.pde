class HexMan {
  Hex[][] field;
  float xo;
  float yo;
  float size;
  HexMan(int qs, int rs, float xo, float yo, float size) {
    this.xo = xo;
    this.yo = yo;
    this.size = size;
    field = new Hex[qs][rs];
    for (int i = 0; i < qs; i++) {
      for (int j = 0; j < rs; j++) {
        field[i][j] = new Hex(i, j, this);
      }
    }
  }
  void show() {
    for (Hex[] ha : field) {
      for (Hex h : ha) {
        fill(127);
        h.show(xo, yo);
      }
    }
  }
  Hex getByCoords(float x, float y) {
    int q = int(round((x - xo) / 1.5 / size));
    int r = int(round((y - yo) / sqrt(3) / size - .5 * q));
    return q >= 0 && q < field[0].length && r >= 0 && r < field.length ? field[q][r] : null;
  }
}
class Hex {
  int q;
  int r;
  int test;
  final float size = 20;
  HexMan man;
  Hex(int q, int r, HexMan h) {
    this.q = q;
    this.r = r;
    this.man = h;
    test = int(random(4));
  }
  void show(float x, float y) {
    show(x + 1.5 * q * size, y + size * sqrt(3) * (.5 * q +  r), size, 0);
  }
  void show(float x, float y, float r, float theta) {
    beginShape();
    for (float t = 0; t < TWO_PI; t += TWO_PI / 6) {
      vertex(x + cos(theta + t) * r, y + sin(theta + t) * r);
    }
    endShape(CLOSE);
    fill(255);
    text(test, x, y);
  }
  Hex[] neighbors() {
    Hex[] h = {man.field[q + 1][r - 1], man.field[q][r - 1], man.field[q - 1][r],
               man.field[q - 1][r + 1], man.field[q][r + 1], man.field[q + 1][r]};
    return h;
  }
}
