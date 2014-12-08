// Generated by CoffeeScript 1.8.0
(function() {
  window.onload = function() {
    var animals, lastFrame, loader, playerController, playerSprite, render, renderer, stage, step, stillRendering, update;
    stage = new PIXI.Stage(0xffffff);
    renderer = PIXI.autoDetectRenderer(Screen.width, Screen.height);
    loader = new PIXI.AssetLoader(['img/animalTex.png']);
    document.body.appendChild(renderer.view);
    stillRendering = false;
    lastFrame = Date.now();
    playerSprite = PIXI.Sprite.fromImage('img/animalTex.png');
    playerSprite.tint = 0xcccccc;
    stage.addChild(playerSprite);
    playerController = new PlayerController(new Animal(playerSprite));
    document.addEventListener("keydown", playerController.handleInput);
    document.addEventListener("keyup", playerController.handleInput);
    animals = [playerController];
    update = function() {
      var a, animal, dt, r, _i, _j, _len, _len1;
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
        console.log("v: " + a.velocity);
        a.position.add(a.velocity.mulCpy(dt));
        r = a.size * Constants.TEX_UNIT;
        if (a.position.x <= r) {
          a.position.x = r;
          a.velocity.x = 0;
        } else if (a.position.x + r >= Screen.width) {
          a.position.x = Screen.width - r;
          a.velocity.x = 0;
        }
        if (a.position.y <= r) {
          a.position.y = r;
          a.velocity.y = 0;
        } else if (a.position.y + r >= Screen.height) {
          a.position.y = Screen.height - r;
          a.velocity.y = 0;
        }
        a.sprite.position.set(a.position);
        a.sprite.position.mul(Constants.UNIT);
        a.sprite.rotation = Math.acos(a.velocity.x / a.velocity.length() - Math.PI / 2.0);
      }
      return lastFrame += dt * 1000;
    };
    render = function() {
      if (!stillRendering) {
        stillRendering = true;
        renderer.render(stage);
        return stillRendering = false;
      }
    };
    step = function() {
      update();
      render();
      return requestAnimFrame(step);
    };
    loader.onComplete = function() {
      return step();
    };
    return loader.load();
  };

}).call(this);
