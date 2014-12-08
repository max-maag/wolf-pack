class @PreySpawnSystem extends System
  constructor: (@game, @minDelay = 1000, @maxDelay = 10000) ->
    @nextSpawn = Date.now() + MathUtil.randInt @minDelay, @maxDelay

  tick: =>
    if Date.now() - @nextSpawn >= 0
      @spawnPrey()
      @nextSpawn = Date.now() + MathUtil.randInt @minDelay, @maxDelay

  getPrey: () =>
    a = new Animal PIXI.Sprite.fromImage 'img/animalTex.png'

    # Begin prey type specific code

    a.sprite.tint = 0x79cc26
    a.setSize 0.3
    a.maxSpeed /= 2.0

    # End prey type specific code

    r = a.size * Constants.TEX_UNIT
    a.setPosition(new Vector(
      MathUtil.randInt r, Screen.width/Constants.UNIT - r
      MathUtil.randInt r, Screen.height/Constants.UNIT - r
    ))

    return new ShyAnimalController(
      @game.playerController.model,
      a
    )

  spawnPrey: =>
    console.log 'Spawning prey'
    prey = @getPrey()
    @game.animals.push prey
    @game.stage.addChild prey.model.sprite
