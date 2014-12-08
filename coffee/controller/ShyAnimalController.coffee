class @ShyAnimalController extends AnimalController
  constructor: (@playerModel, model) ->
    super model

  think: (dt) =>
    @direction
      .set @model.position
      .sub @playerModel.position
      .normalize()
