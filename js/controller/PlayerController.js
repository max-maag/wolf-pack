// Generated by CoffeeScript 1.8.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.PlayerController = (function(_super) {
    __extends(PlayerController, _super);

    function PlayerController() {
      this.handleInput = __bind(this.handleInput, this);
      return PlayerController.__super__.constructor.apply(this, arguments);
    }

    PlayerController.prototype.handleInput = function(e) {
      switch (e.code) {
        case 65:
          return this.direction.x += e.type === "keydown" ? -1 : 1;
        case 68:
          return this.direction.x += e.type === "keydown" ? 1 : -1;
        case 87:
          return this.direction.y += e.type === "keydown" ? 1 : -1;
        case 83:
          return this.direction.y += e.type === "keydown" ? -1 : 1;
      }
    };

    return PlayerController;

  })(AnimalController);

}).call(this);