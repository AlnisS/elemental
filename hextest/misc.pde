Hex getByCoords(float x, float y, float size) {
  int q = int(round(x / 1.5 / size));
  int r = int(round(y / sqrt(3) / size - .5 * q));
  return q >= 0 && q < 6 && r >= 0 && r < 6 ? field[q][r] : null;
}
