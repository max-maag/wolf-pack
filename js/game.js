// Generated by CoffeeScript 1.8.0
(function() {
  var Game;

  Game = (function() {
    var render, step, update;

    update = function() {
      var a, animal, dt, r, v, _i, _j, _len, _len1;
      dt = (Date.now() - lastFrame) / 1000;
      for (_i = 0, _len = animals.length; _i < _len; _i++) {
        animal = animals[_i];
        animal.think(dt);
      }
      for (_j = 0, _len1 = animals.length; _j < _len1; _j++) {
        animal = animals[_j];
        a = animal.model;
        a.velocity.add(a.acceleration.mulCpy(dt));
        if (a.velocity.length() > a.maxSpeed) {
          a.velocity.normalize().mul(a.maxSpeed);
        }
        a.position.add(a.velocity.mulCpy(dt));
        r = a.size * Constants.TEX_UNIT;
        if (a.position.x - r <= 0) {
          a.position.x = r;
          a.velocity.x = 0;
        } else if (a.position.x + r >= Screen.width / Constants.UNIT) {
          a.position.x = Screen.width / Constants.UNIT - r;
          a.velocity.x = 0;
        }
        if (a.position.y <= r) {
          a.position.y = r;
          a.velocity.y = 0;
        } else if (a.position.y + r >= Screen.height / Constants.UNIT) {
          a.position.y = Screen.height / Constants.UNIT - r;
          a.velocity.y = 0;
        }
        a.sprite.position.set(a.position);
        a.sprite.position.mul(Constants.UNIT);
        v = a.velocity.length();
        if (v !== 0) {
          a.sprite.rotation = Math.atan2(a.velocity.y / v, a.velocity.x / v) + Math.PI / 2;
        }
      }
      return lastFrame += dt * 1000;
    };

    render = function() {
      if (!Game.stillRendering) {
        Game.stillRendering = true;
        Game.renderer.render(stage);
        return Game.stillRendering = false;
      }
    };

    step = function() {
      this.update();
      this.render();
      return requestAnimFrame(step);
    };

    function Game() {
      this.stage = new PIXI.Stage(0xffffff);
      this.renderer = PIXI.autoDetectRenderer(Screen.width, Screen.height);
      this.loader = new PIXI.AssetLoader(['img/animalTex.png']);
      document.body.appendChild(this.renderer.view);
      this.stillRendering = false;
      this.lastFrame = Date.now();
      this.playerSprite = PIXI.Sprite.fromImage('img/animalTex.png');
      this.playerSprite.tint = 0xcccccc;
      this.stage.addChild(this.playerSprite);
      this.playerController = new PlayerController(new Animal(this.playerSprite));
      this.playerController.model.setSize(0.5);
      document.addEventListener("keydown", this.playerController.handleInput);
      document.addEventListener("keyup", this.playerController.handleInput);
      this.animals = [this.playerController];
      this.loader.onComplete = function() {
        return requestAnimFrame(this.step);
      };
      this.loader.load();
    }

    return Game;

  })();

  window.onload = function() {
    return new Game();
  };

}).call(this);
