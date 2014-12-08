class @ShyAnimalController extends AnimalController
  calcNextTarget: () =>
    @nextMoveTime = Date.now() + MathUtil.randInt 500, 5000
    @nextMoveTarget = @model.position.clone().add(
      new Vector(
        MathUtil.randInt -1, 1
        MathUtil.randInt -1, 1
      ).normalize().mul(MathUtil.randInt(0.1, @model.maxSpeed))
    )

    if @nextMoveTarget.x < 1
      @nextMoveTarget.x = 1

    if @nextMoveTarget.x > Screen.width/Constants.UNIT - 1
      @nextMoveTarget.x = Screen.width/Constants.UNIT - 1

    if @nextMoveTarget.y < 1
      @nextMoveTarget.y = 1

    if @nextMoveTarget.y > Screen.height/Constants.UNIT - 1
      @nextMoveTarget.y = Screen.height/Constants.UNIT - 1

  constructor: (@playerModel, model) ->
    super model
    @calcNextTarget()

  think: (dt) =>
    @direction.set @model.position
    @direction.sub @playerModel.position

    if @direction.length() < 5
      # run!
      @direction.normalize()
    else if Date.now() - @nextMoveTime > 0
      if @model.position.subCpy(@nextMoveTarget).length() < 0.5
        @calcNextTarget()
      else
        @direction.set @nextMoveTarget.subCpy @model.position
    else
      @direction.set 0

    super dt
