// Generated by CoffeeScript 1.8.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.StupidHunter = (function(_super) {
    __extends(StupidHunter, _super);

    function StupidHunter() {
      this.think = __bind(this.think, this);
      return StupidHunter.__super__.constructor.apply(this, arguments);
    }

    StupidHunter.prototype.think = function(dt) {
      var a, d, dist, target, _i, _len, _ref;
      target = null;
      d = null;
      dist = 0;
      _ref = this.game.animals;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        a = _ref[_i];
        if (!(a === this || a.model.dead && a.model.size < Constants.SMALLEST_SIZE)) {
          if (target == null) {
            target = a;
            d = a.model.position.subCpy(this.model.position);
            dist = d.length();
          } else {
            d.set(a.model.position);
            d.sub(this.model.position);
            if (d.length() < dist) {
              target = a;
              dist = d.length();
            }
          }
        }
      }
      this.direction.set(d);
      return this.calcAcc(dt);
    };

    return StupidHunter;

  })(HunterController);

}).call(this);
