class @AnimalController
  constructor: (@game, @model) ->
    @direction = new Vector 0.0, 0.0

  calcAcc: (dt) =>
    len = @direction.length()
    dir = @direction.clone()

    if len > 1.0
      dir.normalize()
      len = 1.0

    @model.acceleration.set dir.mul @model.maxAcc

    @model.acceleration.x -= Constants.STOP_FORCE * @model.velocity.x / dt
    @model.acceleration.y -= Constants.STOP_FORCE * @model.velocity.y / dt

      
  think: (dt) =>
    if @model.dead
      return

    @calcAcc dt

  die: (reasonOfDeath) =>
    @model.reasonOfDeath = reasonOfDeath
    @model.dead = true
    @model.sprite.tint = 0x3e3e3e

  takeDamage: (amount, source) =>
    @model.hp -= amount
    if @model.hp < 0
      @die "taking #{amount} damage by #{source}"

  onCollide: (other) ->
