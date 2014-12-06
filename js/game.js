// Generated by CoffeeScript 1.8.0
(function() {
  window.onload = function() {
    var gameContainer, lastFrame, loader, playerSprite, processInput, render, renderer, stage, step, stillRendering, update;
    stage = new PIXI.Stage(0xcccccc);
    renderer = PIXI.autoDetectRenderer(Math.max(document.documentElement['clientWidth'], document.body['scrollWidth'], document.documentElement['scrollWidth'], document.body['offsetWidth'], document.documentElement['offsetWidth']), Math.max(document.documentElement['clientHeight'], document.body['scrollHeight'], document.documentElement['scrollHeight'], document.body['offsetHeight'], document.documentElement['offsetHeight']));
    loader = new PIXI.AssetLoader(['img/animalTex.png']);
    gameContainer = new PIXI.SpriteBatch();
    stage.addChild(gameContainer);
    document.body.appendChild(renderer.view);
    stillRendering = false;
    lastFrame = -1;
    playerSprite = PIXI.Sprite.fromImage('img/animalTex.png');
    playerSprite.tint = 0xFF0000;
    gameContainer.addChild(playerSprite);
    processInput = function() {};
    update = function() {};
    render = function() {
      if (!stillRendering) {
        stillRendering = true;
        renderer.render(stage);
        return stillRendering = false;
      }
    };
    step = function() {
      requestAnimFrame(step);
      processInput();
      update();
      return render();
    };
    loader.onComplete = function() {
      return step();
    };
    return loader.load();
  };

}).call(this);
