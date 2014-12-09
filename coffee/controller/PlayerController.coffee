class @PlayerController extends HunterController
  handleInput: (e) =>
    if (e.type is "keyup") or ((e.type is "keydown") and not e.repeat)
      #console.log e

      switch e.keyCode
        when 65 #A
          @direction.x += if e.type is "keydown" then -1 else 1
        when 68 #D
          @direction.x += if e.type is "keydown" then 1 else -1
        when 87 #W
          @direction.y += if e.type is "keydown" then -1 else 1
        when 83 #S
          @direction.y += if e.type is "keydown" then 1 else -1
