function Bonus(game) {
    this.game = game;
    this.bonuses = {
        apple: new Apple(this),
        bomb: new Bomb(this),
        rev: new Reverse(this),
        boost: new Boost(this)
    };

    this.posBonuses = [];
}

Bonus.prototype.update = function() {

}

Bonus.prototype.render = function() {
    for (var key in this.posBonuses) {
        this.game.context.drawImage(this.game.tileimage, this.bonuses[key].tilePos.x, this.bonuses[key].tilePos.y, 64, 64,
            this.posBonuses[key].x * this.game.cellSize, this.posBonuses[key].y * this.game.cellSize, this.game.cellSize, this.game.cellSize);
    }
}

Bonus.prototype.create = function() {
    for (var key in this.bonuses) {
        var newPos = this.bonuses[key].generatePos();

        if (newPos) {
            for (var keyPos in this.posBonuses) {
                if (newPos.x == this.posBonuses[keyPos].x && newPos.y == this.posBonuses[keyPos].y) {
                    this.create();
                    return;
                }
            }

            for (var i = 0; i < this.game.snake.getSize(); i++) {
                if (newPos.x == this.game.snake.body[i].x && newPos.y == this.game.snake.body[i].y) {
                    this.create();
                    return;
                }
            }

            this.posBonuses[key] = {
                x: newPos.x,
                y: newPos.y
            };
        }
    }
}

Bonus.prototype.remove = function(key) {
    delete this.posBonuses[key];
}

Bonus.prototype.generatePos = function() {
    return {
        x: Math.floor(Math.random() * this.game.sceneWidth),
        y: Math.floor(Math.random() * this.game.sceneHeight)
    };
}
