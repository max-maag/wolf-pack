class @PreySpawnSystem extends System
  constructor: (@game, @minDelay = 1000, @maxDelay = 10000) ->
    @nextSpawn = Date.now() + MathUtil.randInt @minDelay, @maxDelay

  tick: =>
    if Date.now() - @nextSpawn >= 0
      @spawnPrey()
      @nextSpawn = Date.now() + MathUtil.randInt @minDelay, @maxDelay

  getPrey: () =>
    sprite = PIXI.Sprite.fromImage 'img/animalTex.png'

    # Begin prey type specific code
    typeCount = 4

    switch Math.floor MathUtil.randInt 0, typeCount
      when 0, 1, 2
        a = new Animal sprite

        r = a.size * Constants.TEX_UNIT
        a.setPosition(new Vector(
          MathUtil.randInt r, Screen.width/Constants.UNIT - r
          MathUtil.randInt r, Screen.height/Constants.UNIT - r
        ))
        a.sprite.tint = 0x79cc26
        a.setSize 0.3
        a.maxSpeed /= 2.0
        prey = new ShyAnimalController @game, a

      when 3
        a = new Hunter sprite


        r = a.size * Constants.TEX_UNIT
        a.setPosition(new Vector(
          MathUtil.randInt r, Screen.width/Constants.UNIT - r
          MathUtil.randInt r, Screen.height/Constants.UNIT - r
        ))
        a.sprite.tint = 0xeecccc
        a.setSize 0.5
        prey = new StupidHunter @game, a

    # End prey type specific code

    return prey



  spawnPrey: =>
    console.log 'Spawning prey'
    prey = @getPrey()
    @game.animals.push prey
    @game.stage.addChild prey.model.sprite
