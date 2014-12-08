class @ShyAnimalController extends AnimalController
  constructor: (@playerModel, model) ->
    super model

  think: (dt) =>
    @direction.set @model.position
    @direction.sub @playerModel.position

    if @direction.length() < 5
      @direction.normalize()
    else
      @direction.set 0

    # random movement
    @direction.add(
      MathUtil.randInt -0.1, 0.1,
      MathUtil.randInt -0.1, 0.1
    )

    super dt
