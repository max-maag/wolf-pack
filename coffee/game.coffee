window.onload = ->
  stage = new PIXI.Stage 0xFFFFFF
  renderer = PIXI.autoDetectRenderer(
    Math.max(
      document.documentElement['clientWidth']
      document.body['scrollWidth']
      document.documentElement['scrollWidth']
      document.body['offsetWidth']
      document.documentElement['offsetWidth']
    )

    Math.max(
      document.documentElement['clientHeight']
      document.body['scrollHeight']
      document.documentElement['scrollHeight']
      document.body['offsetHeight']
      document.documentElement['offsetHeight']
    )
  )

  loader = new PIXI.AssetLoader ['img/animalTex.png']

  gameContainer = new PIXI.SpriteBatch()

  stage.addChild gameContainer

  document.body.appendChild renderer.view

  stillRendering = false

  lastFrame = -1


  playerSprite = Pixi.Sprite.fromImage 'img/animalTex.png'
  gameContainer.addChild playerSprite


  processInput = ->
    #TODO


  update = ->
    #TODO


  render = ->
    if not stillRendering
      stillRendering = true
      renderer.render stage
      stillRendering = false


  step = ->
    requestAnimFrame step
    processInput()
    update()
    render()


  loader.onComplete = ->
    alert 'loader complete'
    step()


  loader.load()
