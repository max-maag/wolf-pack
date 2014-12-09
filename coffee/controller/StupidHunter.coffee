class @StupidHunter extends HunterController
  think: (dt) =>
    target = null
    d = null
    dist = 0
    for a in @game.animals
      if not target?
        target = a
        d = a.model.position.subCpy @model.position
        dist = d.length()
      else
        d.set a.model.position
        d.sub @model.position
        if d.length() < dist
          target = a
          dist = d.length()


    @direction.set d
