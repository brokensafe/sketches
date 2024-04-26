// create a random number generator, with increased odds to get larger numbers
// if number 1 is bigger than number 2, keep number 1.
// if not, re roll.

float montecarlo(){
  while (true){
    float r1 = random(1);
    float probability = r1;
    float r2 = random(1);
    if (r2< probability){
      return r1;
    }
  }
}
