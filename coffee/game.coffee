class Game
  update: =>
    dt = (Date.now() - @lastFrame)/1000

    for animal in @animals
      animal.think(dt)

    for animal in @animals
      a = animal.model

      a.velocity.add(a.acceleration.mulCpy dt)

      if a.velocity.length() > a.maxSpeed
        a.velocity.normalize().mul a.maxSpeed

      ds = a.position.clone()
      a.position.add(a.velocity.mulCpy dt)

      r = a.size * Constants.TEX_UNIT/2.0
      if a.position.x - r <= 0
        a.position.x = r
        a.velocity.x = 0
      else if a.position.x + r >= Screen.width/Constants.UNIT
        a.position.x = Screen.width/Constants.UNIT - r
        a.velocity.x = 0

      if a.position.y <= r
        a.position.y = r
        a.velocity.y = 0
      else if a.position.y + r >= Screen.height/Constants.UNIT
        a.position.y = Screen.height/Constants.UNIT - r
        a.velocity.y = 0

      if a instanceof Hunter
        a.setSize a.size - ds.sub(a.position).length() * a.energyPerUnit
        if a.size < 0.05
          animal.die('starvation')

      a.sprite.position.set a.position
      a.sprite.position.mul Constants.UNIT

      v = a.velocity.length()
      unless v == 0
        a.sprite.rotation =
          Math.atan2(a.velocity.y/v, a.velocity.x/v) + Math.PI/2

    for system in @systems
      system.tick()

    @lastFrame += dt * 1000



  render: =>
    unless @stillRendering
      @stillRendering = true
      @renderer.render @stage
      @stillRendering = false


  onDeath: =>
    console.log "You died of #{@playerController.model.reasonOfDeath}"


  step: =>
    @update()
    @render()
    if @playerController.model.dead
      @onDeath()
    else
      requestAnimFrame @step



  init: =>
    @dead = false
    @stage = new PIXI.Stage 0xffffff
    @renderer = PIXI.autoDetectRenderer Screen.width, Screen.height

    @loader = new PIXI.AssetLoader ['img/animalTex.png']

    #gameContainer = new PIXI.SpriteBatch()
    #stage.addChild gameContainer

    document.body.appendChild @renderer.view

    @stillRendering = false
    @lastFrame = Date.now()

    @playerSprite = PIXI.Sprite.fromImage 'img/animalTex.png'
    @playerSprite.tint = 0xcccccc

    @stage.addChild @playerSprite

    @playerController = new PlayerController new Hunter(
      @playerSprite
      new Vector(Screen.width, Screen.height).mul 1.0/2.0/Constants.UNIT
    )
    @playerController.model.setSize 0.5

    document.addEventListener "keydown", @playerController.handleInput
    document.addEventListener "keyup", @playerController.handleInput

    @animals = [@playerController]

    @systems = [
      new PreySpawnSystem(this)
    ]

    @loader.onComplete = =>
      requestAnimFrame => @step()

    @loader.load()


window.onload = ->
  (new Game()).init()
