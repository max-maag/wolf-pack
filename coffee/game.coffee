window.onload = ->
  stage = new PIXI.Stage 0xFFFFFF
  renderer = PIXI.autoDetectRenderer(
    Math.max(
      document.documentElement["clientWidth"]
      document.body["scrollWidth"]
      document.documentElement["scrollWidth"]
      document.body["offsetWidth"]
      document.documentElement["offsetWidth"]
    )

    Math.max(
      document.documentElement["clientHeight"]
      document.body["scrollHeight"]
      document.documentElement["scrollHeight"]
      document.body["offsetHeight"]
      document.documentElement["offsetHeight"]
    )
  )

  loader = new PIXI.AssetLoader ["img/animalTex.png"]

  gameContainer = new PIXI.DisplayObjectContainer()

  stage.addChild gameContainer

  document.body.appendChild renderer.view

  render = ->
    renderer.render stage
    requestAnimFrame render

  loader.onComplete = ->
    alert "loader complete"
    requestAnimFrame render

  loader.load()
