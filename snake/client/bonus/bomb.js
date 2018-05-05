function Bomb(bonus) {
    this.bonus = bonus;
    this.tilePos = {
        x: 1*64,
        y: 3*64
    };
    this.countRender = 0;
}

Bomb.prototype.generatePos = function() {
    if (!this.bonus.posBonuses['bomb'] || this.countRender > 3) {
        this.countRender = 0;
        return this.bonus.generatePos();
    } else {
        this.countRender++;
        return false;
    }
}

Bomb.prototype.eat = function () {
    return false;
}