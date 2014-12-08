// Generated by CoffeeScript 1.8.0
(function() {
  var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  this.ShyAnimalController = (function(_super) {
    __extends(ShyAnimalController, _super);

    ShyAnimalController.prototype.calcNextTarget = function() {
      this.nextMoveTime = Date.now() + MathUtil.randInt(500, 5000);
      this.nextMoveTarget = this.model.position.clone().add(new Vector(MathUtil.randInt(-1, 1), MathUtil.randInt(-1, 1)).normalize().mul(MathUtil.randInt(0.1, this.model.maxSpeed)));
      this.targetDirty = false;
      if (this.nextMoveTarget.x < 1) {
        this.nextMoveTarget.x = 1;
      }
      if (this.nextMoveTarget.x > Screen.width / Constants.UNIT - 1) {
        this.nextMoveTarget.x = Screen.width / Constants.UNIT - 1;
      }
      if (this.nextMoveTarget.y < 1) {
        this.nextMoveTarget.y = 1;
      }
      if (this.nextMoveTarget.y > Screen.height / Constants.UNIT - 1) {
        return this.nextMoveTarget.y = Screen.height / Constants.UNIT - 1;
      }
    };

    function ShyAnimalController(playerModel, model) {
      this.playerModel = playerModel;
      this.think = __bind(this.think, this);
      this.calcNextTarget = __bind(this.calcNextTarget, this);
      ShyAnimalController.__super__.constructor.call(this, model);
      this.calcNextTarget();
    }

    ShyAnimalController.prototype.think = function(dt) {
      this.direction.set(this.model.position);
      this.direction.sub(this.playerModel.position);
      if (this.direction.length() < 5) {
        this.direction.normalize();
        this.targetDirty = true;
      } else if (this.targetDirty) {
        this.calcNextTarget();
      } else if (Date.now() - this.nextMoveTime > 0.0) {
        if (this.model.position.subCpy(this.nextMoveTarget).length() < 0.5) {
          this.calcNextTarget();
        } else {
          this.direction.set(this.nextMoveTarget.subCpy(this.model.position));
        }
      } else {
        this.direction.set(0.0);
      }
      return ShyAnimalController.__super__.think.call(this, dt);
    };

    return ShyAnimalController;

  })(AnimalController);

}).call(this);
