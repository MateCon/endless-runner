class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem() {
    particles = new ArrayList<Particle>();
  }
  
  void addParticles(PVector position, int numberOfParticles) {
    for(int index = 0; index < numberOfParticles; index++) {
      this.addParticle(position);
    }
  }

  void addParticle(PVector position) {
    particles.add(new Particle(position));
  }

  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
}

class Particle {
  PVector position, velocity, acceleration;
  int size = (int)random(1, 4);
  float lifespan;

  Particle(PVector pos) {
    acceleration = new PVector(random(-0.05, 0.05), random(-0.05, 0.05));
    velocity = new PVector(random(-2, 2), random(-2, 2));
    position = pos.copy();
    lifespan = random(100.0, 255.0);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    lifespan -= 2.0;
    
    display();
  }

  void display() {
    fill(255, lifespan);
    rect(position.x, position.y, size, size);
  }

  boolean isDead() {
    if(lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
}
