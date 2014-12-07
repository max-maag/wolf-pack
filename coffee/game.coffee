window.onload = ->
  alert new Vector().x
  stage = new PIXI.Stage 0xffffff
  renderer = PIXI.autoDetectRenderer Screen.width, Screen.height

  UNIT = Screen.width / 100.0
  TEX_SCALE = UNIT / 82.0

  loader = new PIXI.AssetLoader ['img/animalTex.png']

  #gameContainer = new PIXI.SpriteBatch()
  #stage.addChild gameContainer

  document.body.appendChild renderer.view

  stillRendering = false
  lastFrame = -1

  playerSprite = PIXI.Sprite.fromImage 'img/animalTex.png'
  playerSprite.tint = 0xcccccc
  playerSprite.scale = new Vector 2*TEX_SCALE, 2*TEX_SCALE

  stage.addChild playerSprite

  playerController = new PlayerController(new Animal())

  document.addEventListener "keydown", playerController.handleInput
  document.addEventListener "keyup", playerController.handleInput

  animals = [playerController]


  update = ->
    for animal in animals
      animal.think()


  render = ->
    if not stillRendering
      stillRendering = true
      renderer.render stage
      stillRendering = false


  step = ->
    update()
    render()
    requestAnimFrame step


  loader.onComplete = ->
    step()


  loader.load()
