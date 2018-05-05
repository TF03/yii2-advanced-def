function Boost(bonus) {
    this.bonus = bonus;
    this.boostSpeed = 1000 / 12;
    this.tilePos = {
        x: 1*64,
        y: 2*64
    };
    this.countRender = 0;
    this.boost = false;
}

Boost.prototype.generatePos = function() {
    if (this.boost == true && this.countRender > 4) {
        this.countRender = 0;
        this.boost = false;
        this.bonus.game.currentSpeed = this.bonus.game.defaultSpeed;
        this.rebootInterval();
    }

    if ((!this.bonus.posBonuses['boost'] || this.countRender > 1) && this.boost == false) {
        this.countRender = 0;
        return this.bonus.generatePos();
    } else {
        this.countRender++;
        return false;
    }
}

Boost.prototype.eat = function () {
    this.boost = true;
    this.bonus.remove('boost');
    this.bonus.game.currentSpeed = this.boostSpeed;
    this.rebootInterval();
    return true;
}

Boost.prototype.rebootInterval = function () {
    this.bonus.game.rebootInterval();
}