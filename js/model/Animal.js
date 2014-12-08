// Generated by CoffeeScript 1.8.0
(function() {
  this.Animal = (function() {
    function Animal(sprite, position, velocity, acceleration, maxSpeed, maxAcc, maxTurnSpeed, orientation, attitude, size) {
      this.sprite = sprite;
      this.position = position != null ? position : new Vector(0.0, 0.0);
      this.velocity = velocity != null ? velocity : new Vector(0.0, 0.0);
      this.acceleration = acceleration != null ? acceleration : new Vector(0.0, 0.0);
      this.maxSpeed = maxSpeed != null ? maxSpeed : 20;
      this.maxAcc = maxAcc != null ? maxAcc : 10;
      this.maxTurnSpeed = maxTurnSpeed != null ? maxTurnSpeed : 1.0;
      this.orientation = orientation != null ? orientation : 0.0;
      this.attitude = attitude != null ? attitude : 0.0;
      this.size = size != null ? size : 1;
      this.sprite.position = this.position.mulCpy(Constants.UNIT);
      this.sprite.scale = new Vector(this.size * Constants.TEX_SCALE, this.size * Constants.TEX_SCALE);
      this.sprite.anchor = new Vector(0.5, 0.5);
    }

    return Animal;

  })();

}).call(this);
