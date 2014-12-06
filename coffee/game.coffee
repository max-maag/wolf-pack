window.onload = ->
  stage = new PIXI.Stage 0xffffff
  renderer = PIXI.autoDetectRenderer(
    bodyWidth = Math.max(
      document.documentElement['clientWidth']
      document.body['scrollWidth']
      document.documentElement['scrollWidth']
      document.body['offsetWidth']
      document.documentElement['offsetWidth']
    )

    bodyHeight = Math.max(
      document.documentElement['clientHeight']
      document.body['scrollHeight']
      document.documentElement['scrollHeight']
      document.body['offsetHeight']
      document.documentElement['offsetHeight']
    )
  )

  UNIT = bodyWidth / 100.0
  TEX_SCALE = UNIT / 82.0

  loader = new PIXI.AssetLoader ['img/animalTex.png']

  #gameContainer = new PIXI.SpriteBatch()

  #stage.addChild gameContainer

  document.body.appendChild renderer.view

  stillRendering = false

  lastFrame = -1


  playerSprite = PIXI.Sprite.fromImage 'img/animalTex.png'
  playerSprite.tint = 0xcccccc
  playerSprite.scale = new PIXI.Point TEX_SCALE, TEX_SCALE

  stage.addChild playerSprite

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
    step()


  loader.load()
