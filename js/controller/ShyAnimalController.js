// Generated by CoffeeScript 1.8.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.ShyAnimalController = (function(_super) {
    __extends(ShyAnimalController, _super);

    function ShyAnimalController(playerModel, model) {
      this.playerModel = playerModel;
      this.think = __bind(this.think, this);
      ShyAnimalController.__super__.constructor.call(this, model);
    }

    ShyAnimalController.prototype.think = function(dt) {
      return this.direction.set(this.model.position).sub(this.playerModel.position).normalize();
    };

    return ShyAnimalController;

  })(AnimalController);

}).call(this);
