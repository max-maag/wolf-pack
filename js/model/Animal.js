// Generated by CoffeeScript 1.8.0
(function() {
  this.Animal = (function() {
    function Animal(position, velocity, acceleration, maxSpeed, maxAcc, maxTurnSpeed, orientation, attitude) {
      this.position = position != null ? position : new Vector(0.0, 0.0);
      this.velocity = velocity != null ? velocity : new Vector(0.0, 0.0);
      this.acceleration = acceleration != null ? acceleration : new Vector(0.0, 0.0);
      this.maxSpeed = maxSpeed != null ? maxSpeed : 1.0;
      this.maxAcc = maxAcc != null ? maxAcc : 0.2;
      this.maxTurnSpeed = maxTurnSpeed != null ? maxTurnSpeed : 1.0;
      this.orientation = orientation != null ? orientation : 0.0;
      this.attitude = attitude != null ? attitude : 0.0;
    }

    return Animal;

  })();

}).call(this);
