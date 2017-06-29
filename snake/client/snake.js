function Snake(game) {
    // get data from game
    this.game = game;

    // route const
    this.ROUTE = {
        UP: 2,
        DOWN: 0,
        LEFT: 1,
        RIGHT: 3
    };

    // snake body
    var defaultPosX = Math.ceil(this.game.sceneWidth / 2);
    var defaultPosY = Math.ceil(this.game.sceneHeight / 2);

    this.body = [
        {x: defaultPosX, y: defaultPosY - 1},
        {x: defaultPosX, y: defaultPosY},
        {x: defaultPosX, y: defaultPosY + 1}
    ];

    // set route
    this.setRoute('UP');
}

Snake.prototype.update = function() {
    if (this.game.bonus.bonuses['rev'].reverse == true) {
        this.body = this.body.reverse();
    }
    var newSnakeElement = {
        x: this.body[0].x,
        y: this.body[0].y
    };

    if (this.game.bonus.bonuses['rev'].reverse == true) {
        if (this.isRoute('UP')) {
            newSnakeElement.y += 1;
        } else if (this.isRoute('DOWN')) {
            newSnakeElement.y -= 1;
        } else if (this.isRoute('LEFT')) {
            newSnakeElement.x += 1;
        } else if (this.isRoute('RIGHT')) {
            newSnakeElement.x -= 1;
        }
    } else {
        if (this.isRoute('UP')) {
            newSnakeElement.y -= 1;
        } else if (this.isRoute('DOWN')) {
            newSnakeElement.y += 1;
        } else if (this.isRoute('LEFT')) {
            newSnakeElement.x -= 1;
        } else if (this.isRoute('RIGHT')) {
            newSnakeElement.x += 1;
        }
    }

    for (var i = 0; i < this.getSize() - 1; i++) {
        if (newSnakeElement.x == this.body[i].x && newSnakeElement.y == this.body[i].y) {
            this.game.setStatus(this.game.STATUS.GAMEOVER);
            return;
        }
    }

    var isOutsideX = newSnakeElement.x < 0 || newSnakeElement.x > this.game.sceneWidth - 1;
    var isOutsideY = newSnakeElement.y < 0 || newSnakeElement.y > this.game.sceneHeight - 1;

    if (isOutsideX || isOutsideY) {
        this.game.setStatus(this.game.STATUS.GAMEOVER);
        return;
    }

    this.body.pop();
    this.body.unshift(newSnakeElement);
    if (this.game.bonus.bonuses['rev'].reverse == true) {
        this.body = this.body.reverse();
    }


    var posBonuses = this.game.bonus.posBonuses;
    for (var key in posBonuses) {
        if (newSnakeElement.x == posBonuses[key].x && newSnakeElement.y == posBonuses[key].y) {
            if (!this.game.bonus.bonuses[key].eat()) {
                this.game.setStatus(this.game.STATUS.GAMEOVER);
                return;
            }

            var isWin = this.addElement();
            if (isWin) {
                this.game.bonus.remove(key);
                this.game.setStatus(this.game.STATUS.GAMEWIN);
            } else {
                this.game.bonus.create();
            }
        }
    }

    return 0;
}

Snake.prototype.render = function() {
    var tx, ty, nseg, pseg = 0;
    var currentSnakeSize = this.getSize() - 1;
    for (var i = currentSnakeSize; i != -1; i--) {
        var segment = this.body[i];
        var segx = segment.x;
        var segy = segment.y;
        if (i == 0) {
            nseg = this.body[i+1];
            if (segy < nseg.y) { // UP
                tx = 3; ty = 0;
            } else if (segy > nseg.y) { // DOWN
                tx = 4; ty = 1;
            } else if (segx < nseg.x) { // LEFT
                tx = 3; ty = 1;
            } else if (segx > nseg.x) { // RIGHT
                tx = 4; ty = 0;
            }
        } else if (i == currentSnakeSize) {
            pseg = this.body[i-1];
            if (pseg.y < segy) { // UP
                tx = 3; ty = 2;
            } else if (pseg.y > segy) { // DOWN
                tx = 4; ty = 3;
            } else if (pseg.x < segx) { // LEFT
                tx = 3; ty = 3;
            } else if (pseg.x > segx) { // RIGHT
                tx = 4; ty = 2;
            }
        } else {
            pseg = this.body[i-1];
            nseg = this.body[i+1];
            if (pseg.x < segx && nseg.x > segx || nseg.x < segx && pseg.x > segx) {
                // Horizontal Left-Right
                tx = 1; ty = 0;
            } else if (pseg.x < segx && nseg.y > segy || nseg.x < segx && pseg.y > segy) {
                // Angle Left-Down
                tx = 2; ty = 0;
            } else if (pseg.y < segy && nseg.y > segy || nseg.y < segy && pseg.y > segy) {
                // Vertical Up-Down
                tx = 2; ty = 1;
            } else if (pseg.y < segy && nseg.x < segx || nseg.y < segy && pseg.x < segx) {
                // Angle Top-Left
                tx = 2; ty = 2;
            } else if (pseg.x > segx && nseg.y < segy || nseg.x > segx && pseg.y < segy) {
                // Angle Right-Up
                tx = 0; ty = 1;
            } else if (pseg.y > segy && nseg.x > segx || nseg.y > segy && pseg.x > segx) {
                // Angle Down-Right
                tx = 0; ty = 0;
            }
        }
        this.game.context.drawImage(this.game.tileimage, tx*64, ty*64, 64, 64,
            this.body[i].x * this.game.cellSize, this.body[i].y * this.game.cellSize, this.game.cellSize, this.game.cellSize);
    }
}

Snake.prototype.addElement = function() {
    // get place to adding
    var last_index = this.body.length - 1;

    var newSnakeElement = {
        x: this.body[last_index].x,
        y: this.body[last_index].y
    };

    var x_diff = this.body[last_index].x - this.body[last_index - 1].x;
    var y_diff = this.body[last_index].y - this.body[last_index - 1].y;

    if (x_diff > 0) {
        newSnakeElement.x += 1;
    } else if (x_diff < 0) {
        newSnakeElement.x -= 1;
    } else if (y_diff > 0) {
        newSnakeElement.y += 1;
    } else if (y_diff < 0) {
        newSnakeElement.y -= 1;
    }

    // push in array
    this.body.push(newSnakeElement);

    // check on win
    if (this.getSize() == this.game.sceneWidth * this.game.sceneHeight) {
        return true;
    }

    return false;
}

Snake.prototype.getSize = function() {
    return this.body.length;
}

Snake.prototype.setRoute = function(value) {
    this.route = this.ROUTE[value];
}

Snake.prototype.isRoute = function(value) {
    return this.route == this.ROUTE[value];
}