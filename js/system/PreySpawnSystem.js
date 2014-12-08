// Generated by CoffeeScript 1.8.0
(function() {
  var PreySpawnSystem;

  PreySpawnSystem = (function() {
    function PreySpawnSystem(minDelay, maxDelay) {
      this.minDelay = minDelay != null ? minDelay : 1;
      this.maxDelay = maxDelay != null ? maxDelay : 10;
      this.nextSpawn = Date.now() * MathUtils.randInt(this.minDelay(this.maxDelay));
    }

    PreySpawnSystem.prototype.tick = function() {};

    PreySpawnSystem.prototype.spawnPrey = function() {
      var prey, r, sprite;
      sprite = PIXI.Sprite.fromImage('img/animalTex.png');
      prey = new AnimalController(new Animal(sprite));
      sprite.tint = 0x79cc26;
      prey.model.setSize(0.5);
      r = prey.model.size * Constants.TEX_UNIT;
      prey.model.setPosition(new Vector(MathUtils.randInt(r, Screen.width / Constants.TEX_UNIT - r), MathUtils.randInt(r, Screen.height / Constants.TEX_UNIT - r)));
      return animals.push(prey);
    };

    return PreySpawnSystem;

  })();

}).call(this);