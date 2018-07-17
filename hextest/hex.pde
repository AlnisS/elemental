class Hex {
  int q;
  int r;
  int test;
  final float size = 20;
  Hex[][] field;
  Hex(int q, int r, Hex[][] field) {
    this.q = q;
    this.r = r;
    this.field = field;
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
    Hex[] h = {field[q + 1][r - 1], field[q][r - 1], field[q - 1][r],
               field[q - 1][r + 1], field[q][r + 1], field[q + 1][r]};
    return h;
  }
}
