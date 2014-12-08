window.onload = ->
  stage = new PIXI.Stage 0xffffff
  renderer = PIXI.autoDetectRenderer Screen.width, Screen.height

  loader = new PIXI.AssetLoader ['img/animalTex.png']

  #gameContainer = new PIXI.SpriteBatch()
  #stage.addChild gameContainer

  document.body.appendChild renderer.view

  stillRendering = false
  lastFrame = Date.now()

  playerSprite = PIXI.Sprite.fromImage 'img/animalTex.png'
  playerSprite.tint = 0xcccccc
  #playerSprite.scale = new Vector TEX_SCALE, TEX_SCALE

  stage.addChild playerSprite

  playerController = new PlayerController(new Animal playerSprite)

  document.addEventListener "keydown", playerController.handleInput
  document.addEventListener "keyup", playerController.handleInput

  animals = [playerController]


  update = ->
    dt = (Date.now() - lastFrame)/1000

    #console.log "dt: #{dt}"

    for animal in animals
      animal.think(dt)

    for animal in animals
      a = animal.model

      #console.log "a: #{a.acceleration}"

      a.velocity.add(a.acceleration.mulCpy dt)

      if a.velocity.length() > a.maxSpeed
        a.velocity.normalize().mul a.maxSpeed

      #console.log "v: #{a.velocity}"

      a.position.add(a.velocity.mulCpy dt)

      r = a.size * Constants.TEX_UNIT
      if a.position.x <= r
        a.position.x = r
        a.velocity.x = 0
      else if a.position.x + r >= Screen.width
        a.position.x = Screen.width - r
        a.velocity.x = 0

      if a.position.y <= r
        a.position.y = r
        a.velocity.y = 0
      else if a.position.y + r >= Screen.height
        a.position.y = Screen.height - r
        a.velocity.y = 0

      #console.log "p: #{a.position}"
      a.sprite.position.set a.position
      a.sprite.position.mul Constants.UNIT

      v = a.velocity.length()
      unless v == 0
        a.sprite.rotation = Math.PI/2
          #Math.acos(a.velocity.x/v)# - Math.PI/2.0

      console.log "v.x: #{a.velocity.x}, |v|: #{v}, r: #{a.sprite.rotation}"

    lastFrame += dt * 1000


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
