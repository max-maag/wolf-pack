class @HunterController extends AnimalController
  constructor: (@game, @model, @damage = 1) ->
    super @game, @model

  eat: (amount) =>
    @model.setSize @model.size + amount
    @hp += amount

  onCollide: (other) =>
    if other.model.dead
      if other.model.size > Constants.SMALLEST_SIZE
        @eat Math.min 0.1, other.model.size - Constants.SMALLEST_SIZE
    else
      other.takeDamage @damage
