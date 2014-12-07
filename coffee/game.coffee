window.onload = ->
  stage = new PIXI.Stage 0xffffff
  renderer = PIXI.autoDetectRenderer Screen.width, Screen.height

  UNIT = Screen.width / 100.0
  TEX_SCALE = UNIT / 82.0

  loader = new PIXI.AssetLoader ['img/animalTex.png']

  #gameContainer = new PIXI.SpriteBatch()
  #stage.addChild gameContainer

  document.body.appendChild renderer.view

  stillRendering = false
  lastFrame = Date.now()

  playerSprite = PIXI.Sprite.fromImage 'img/animalTex.png'
  playerSprite.tint = 0xcccccc
  playerSprite.scale = new Vector TEX_SCALE, TEX_SCALE

  stage.addChild playerSprite

  playerController = new PlayerController(new Animal playerSprite)

  document.addEventListener "keydown", playerController.handleInput
  document.addEventListener "keyup", playerController.handleInput

  animals = [playerController]


  update = ->
    dt = (Date.now() - lastFrame)/1000

    #console.log "dt: #{dt}"

    for animal in animals
      animal.think()

    for animal in animals
      a = animal.model

      #console.log "a: #{a.acceleration}"

      a.velocity.add(a.acceleration.mulCpy dt)

      #console.log "v: #{a.velocity}"

      if a.velocity.length > a.maxSpeed
        a.velocity.normalize().mul a.maxSpeed

      #console.log "v: #{a.velocity}"
      a.position.add(a.velocity.mulCpy dt)

      #console.log "p: #{a.position}"
      #a.sprite.position = a.position
      #console.log "s: #{a.sprite.position}"

    lastFrame += dt


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
