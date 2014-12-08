class PreySpawnSystem
  constructor: (@minDelay = 1, @maxDelay = 10) ->
    @nextSpawn = Date.now() * MathUtils.randInt @minDelay @maxDelay

  tick: ->
    #TODO


  spawnPrey: ->
    sprite = PIXI.Sprite.fromImage 'img/animalTex.png'
    prey = new AnimalController(new Animal sprite)
    sprite.tint = 0x79cc26
    prey.model.setSize 0.5


    r = prey.model.size * Constants.TEX_UNIT
    prey.model.setPosition(new Vector(
      MathUtils.randInt r, Screen.width/Constants.TEX_UNIT - r
      MathUtils.randInt r, Screen.height/Constants.TEX_UNIT - r
    ))
    animals.push prey
