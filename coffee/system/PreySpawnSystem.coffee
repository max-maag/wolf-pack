class @PreySpawnSystem extends System
  constructor: (@game, @minDelay = 1000, @maxDelay = 10000) ->
    @nextSpawn = Date.now() + MathUtil.randInt @minDelay, @maxDelay

  tick: =>
    if Date.now() - @nextSpawn >= 0
      @spawnPrey()
      @nextSpawn = Date.now() + MathUtil.randInt @minDelay, @maxDelay

  getPrey: () =>
    return new ShyAnimalController(
      @game.playerController.model,
      new Animal PIXI.Sprite.fromImage 'img/animalTex.png'
    )

  spawnPrey: =>
    console.log 'Spawning prey'
    prey = @getPrey()
    prey.model.sprite.tint = 0x79cc26
    prey.model.setSize 0.5


    r = prey.model.size * Constants.TEX_UNIT
    prey.model.setPosition(new Vector(
      MathUtil.randInt r, Screen.width/Constants.UNIT - r
      MathUtil.randInt r, Screen.height/Constants.UNIT - r
    ))
    @game.animals.push prey
    @game.stage.addChild prey.model.sprite
