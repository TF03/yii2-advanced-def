function Apple(bonus) {
    this.bonus = bonus;
    this.tilePos = {
        x: 0*64,
        y: 3*64
    };
}

Apple.prototype.generatePos = function() {
    return this.bonus.generatePos();
}

Apple.prototype.eat = function () {
    this.bonus.game.score++;
    return true;
}