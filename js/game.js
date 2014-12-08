// Generated by CoffeeScript 1.8.0
(function() {
  var Game,
    __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; };

  Game = (function() {
    function Game() {
      this.init = __bind(this.init, this);
      this.step = __bind(this.step, this);
      this.render = __bind(this.render, this);
      this.update = __bind(this.update, this);
    }

    Game.prototype.update = function() {
      var a, animal, dt, r, system, v, _i, _j, _k, _len, _len1, _len2, _ref, _ref1, _ref2;
      dt = (Date.now() - this.lastFrame) / 1000;
      _ref = this.animals;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        animal = _ref[_i];
        animal.think(dt);
      }
      _ref1 = this.animals;
      for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
        animal = _ref1[_j];
        a = animal.model;
        a.velocity.add(a.acceleration.mulCpy(dt));
        if (a.velocity.length() > a.maxSpeed) {
          a.velocity.normalize().mul(a.maxSpeed);
        }
        a.position.add(a.velocity.mulCpy(dt));
        r = a.size * Constants.TEX_UNIT / 2.0;
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
      _ref2 = this.systems;
      for (_k = 0, _len2 = _ref2.length; _k < _len2; _k++) {
        system = _ref2[_k];
        system.tick();
      }
      return this.lastFrame += dt * 1000;
    };

    Game.prototype.render = function() {
      if (!this.stillRendering) {
        this.stillRendering = true;
        this.renderer.render(this.stage);
        return this.stillRendering = false;
      }
    };

    Game.prototype.step = function() {
      this.update();
      this.render();
      return requestAnimFrame(this.step);
    };

    Game.prototype.init = function() {
      this.stage = new PIXI.Stage(0xffffff);
      this.renderer = PIXI.autoDetectRenderer(Screen.width, Screen.height);
      this.loader = new PIXI.AssetLoader(['img/animalTex.png']);
      document.body.appendChild(this.renderer.view);
      this.stillRendering = false;
      this.lastFrame = Date.now();
      this.playerSprite = PIXI.Sprite.fromImage('img/animalTex.png');
      this.playerSprite.tint = 0xcccccc;
      this.stage.addChild(this.playerSprite);
      this.playerController = new PlayerController(new Animal(this.playerSprite, new Vector(Screen.width, Screen.height).mul(1.0 / 2.0 / Constants.UNIT)));
      this.playerController.model.setSize(0.5);
      document.addEventListener("keydown", this.playerController.handleInput);
      document.addEventListener("keyup", this.playerController.handleInput);
      this.animals = [this.playerController];
      this.systems = [new PreySpawnSystem(this)];
      this.loader.onComplete = (function(_this) {
        return function() {
          return requestAnimFrame(function() {
            return _this.step();
          });
        };
      })(this);
      return this.loader.load();
    };

    return Game;

  })();

  window.onload = function() {
    return (new Game()).init();
  };

}).call(this);
