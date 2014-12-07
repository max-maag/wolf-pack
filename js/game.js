// Generated by CoffeeScript 1.8.0
(function() {
  window.onload = function() {
    var TEX_SCALE, UNIT, animals, lastFrame, loader, playerController, playerSprite, render, renderer, stage, step, stillRendering, update;
    stage = new PIXI.Stage(0xffffff);
    renderer = PIXI.autoDetectRenderer(Screen.width, Screen.height);
    UNIT = Screen.width / 100.0;
    TEX_SCALE = UNIT / 82.0;
    loader = new PIXI.AssetLoader(['img/animalTex.png']);
    document.body.appendChild(renderer.view);
    stillRendering = false;
    lastFrame = Date.now();
    playerSprite = PIXI.Sprite.fromImage('img/animalTex.png');
    playerSprite.tint = 0xcccccc;
    playerSprite.scale = new Vector(TEX_SCALE, TEX_SCALE);
    stage.addChild(playerSprite);
    playerController = new PlayerController(new Animal(playerSprite));
    document.addEventListener("keydown", playerController.handleInput);
    document.addEventListener("keyup", playerController.handleInput);
    animals = [playerController];
    update = function() {
      var a, animal, dt, _i, _j, _len, _len1;
      dt = (Date.now() - lastFrame) / 1000;
      for (_i = 0, _len = animals.length; _i < _len; _i++) {
        animal = animals[_i];
        animal.think();
      }
      for (_j = 0, _len1 = animals.length; _j < _len1; _j++) {
        animal = animals[_j];
        a = animal.model;
        console.log("a: " + a.acceleration);
        a.velocity.add(a.acceleration.mulCpy(dt));
        if (a.velocity.length > a.maxSpeed) {
          a.velocity.normalize().mul(a.maxSpeed);
        }
        console.log("v: " + a.velocity);
        a.position.add(a.velocity.mulCpy(dt));
      }
      return lastFrame += dt;
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
