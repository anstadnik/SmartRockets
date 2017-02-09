//DNA - an array of PVectors and some functions

class DNA {
  PVector[][] genes;

  DNA(int gridScale) {
    genes = new PVector[width / gridScale][height / gridScale];
  }

  DNA(float mutationScale, DNA a, DNA b) {
    genes = new PVector[width / gridScale][height / gridScale];
    for (int i = 0; i < genes.length; i++)
      for (int j = 0; j < genes[i].length; j++) {
        if (a.genes[i][j] == null || b.genes[i][j] == null)//if one of them isn't there
          continue;
        else//if both of them r there
          if (random(1) > 0.5)          
          genes[i][j] = a.genes[i][j];
        else
          genes[i][j] = b.genes[i][j];
      }
    mutate(mutationScale);
  }


  PVector getPV(int x, int y) {//Return a vector, if there is no vector, create a vector and return
    if (genes[x][y] == null)
      genes[x][y] = PVector.random2D();
    return genes[x][y];
  }


  void mutate(float mutationScale) {    
    for (int i = 0; i < genes.length; i++)
      for (int j = 0; j < genes[i].length; j++) {
        if (genes[i][j] == null) continue;
        if (random(1) < mutationScale)
          genes[i][j] = PVector.random2D();
      }
  }
}