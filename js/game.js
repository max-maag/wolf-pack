// Generated by CoffeeScript 1.8.0
(function() {
  window.onload = function() {
    var gameContainer, loader, render, renderer, stage, stillRendering;
    stage = new PIXI.Stage(0xFFFFFF);
    renderer = PIXI.autoDetectRenderer(Math.max(document.documentElement["clientWidth"], document.body["scrollWidth"], document.documentElement["scrollWidth"], document.body["offsetWidth"], document.documentElement["offsetWidth"]), Math.max(document.documentElement["clientHeight"], document.body["scrollHeight"], document.documentElement["scrollHeight"], document.body["offsetHeight"], document.documentElement["offsetHeight"]));
    loader = new PIXI.AssetLoader(["img/animalTex.png"]);
    gameContainer = new PIXI.DisplayObjectContainer();
    stage.addChild(gameContainer);
    document.body.appendChild(renderer.view);
    stillRendering = false;
    render = function() {
      if (!stillRendering) {
        stillRendering = true;
        renderer.render(stage);
        return stillRendering = false;
      }
    };
    loader.onComplete = function() {
      alert("loader complete");
      return setIntervall(function() {
        return requestAnimFrame(render);
      }, 16.6666);
    };
    return loader.load();
  };

}).call(this);
