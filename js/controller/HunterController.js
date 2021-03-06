// Generated by CoffeeScript 1.8.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.HunterController = (function(_super) {
    __extends(HunterController, _super);

    function HunterController(game, model, damage) {
      this.game = game;
      this.model = model;
      this.damage = damage != null ? damage : 1;
      this.onCollide = __bind(this.onCollide, this);
      this.eat = __bind(this.eat, this);
      HunterController.__super__.constructor.call(this, this.game, this.model);
    }

    HunterController.prototype.eat = function(amount) {
      this.model.setSize(this.model.size + amount);
      return this.hp += amount;
    };

    HunterController.prototype.onCollide = function(other) {
      var amount;
      if (other.model.dead) {
        if (other.model.size > Constants.SMALLEST_SIZE) {
          amount = Math.min(0.1, other.model.size - Constants.SMALLEST_SIZE);
          other.model.setSize(other.model.size - amount);
          return this.eat(amount);
        }
      } else if (!this.model.dead) {
        return other.takeDamage(this.damage, this);
      }
    };

    return HunterController;

  })(AnimalController);

}).call(this);
