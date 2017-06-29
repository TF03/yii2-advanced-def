function Game() {
    this.defaultSpeed = 1000 / 6;
    this.currentSpeed = this.defaultSpeed;
    this.currentInterval = false;
    this.cellSize = 32;
    this.canvasWidth = 512;
    this.canvasHeight = 512;
    this.background = '';
    this.score = 0;
    this.status = 1;
    this.images = [];
    this.tileimage = '';
    this.STATUS = {
        PLAY: 0,
        NONE: 1,
        GAMEOVER: 2,
        GAMEWIN: 3,
        PAUSE: 4
    };
}
Game.prototype.rebootInterval = function() {
    if (this.currentInterval) {
        clearInterval(this.currentInterval);
    }
    this.currentInterval = setInterval(function () {
        game.update();
        game.render();
    }, this.currentSpeed);
}

Game.prototype.init = function() {
    this.images = this.loadImages(["img/snake-graphics3.png"]);
    this.tileimage = this.images[0];
    //this.background = this.loadImages(["img/back.jpg"])[0];
    this.background = this.loadImages(["img/back.png"])[0];

    document.body.style.textAlign = 'center';
    document.body.style.marginTop = '50px';

    this.canvas = document.createElement('canvas');
    document.body.appendChild(this.canvas);
    this.canvas.width = this.canvasWidth;
    this.canvas.height = this.canvasHeight;
    this.canvas.style.border = '10px solid #444';

    this.context = this.canvas.getContext('2d');

    this.sceneWidth = Math.ceil(this.canvasWidth / this.cellSize);
    this.sceneHeight = Math.ceil(this.canvasHeight / this.cellSize);

    this.snake = new Snake(this);
    this.bonus = new Bonus(this);
    this.reset();
}

Game.prototype.loadImages = function (imagefiles) {
    var loadcount = 0;
    var loadtotal = imagefiles.length;
    var preloaded = false;

    var loadedimages = [];
    for (var i=0; i<imagefiles.length; i++) {
        var image = new Image();

        image.onload = function () {
            loadcount++;
            if (loadcount == loadtotal) {
                preloaded = true;
            }
        };
        image.src = imagefiles[i];
        loadedimages[i] = image;
    }

    return loadedimages;
}

Game.prototype.update = function() {
    if (this.getStatus() == this.STATUS.PLAY) {
        this.snake.update();
    }
    input.isLock = false;
}

Game.prototype.reset = function() {
    this.currentSpeed = this.defaultSpeed;
    this.rebootInterval();
    this.snake = new Snake(this);
    this.bonus = new Bonus(this);

    this.score = 0;
}

Game.prototype.render = function() {
    this.context.drawImage(this.background, 0, 0, this.canvasWidth, this.canvasHeight,
        0, 0, this.canvasHeight, this.canvasHeight);

    this.renderScore();
    this.snake.render();
    this.bonus.render();

    switch (this.getStatus()) {
        case this.STATUS.PLAY:
            break;

        case this.STATUS.NONE:
            this.showMsg('Snake!', 'Press space to play');
            break;

        case this.STATUS.GAMEOVER:
            this.showMsg('Game Over', 'Press space to play', true);
            break;

        case this.STATUS.GAMEWIN:
            this.showMsg('You Win!', 'Press space to play', true);
            break;

        case this.STATUS.PAUSE:
            this.showMsg('Pause', 'Press space to continue');
            break;
    }
}

/*** Game message ***/
Game.prototype.showMsg = function(header, action, addition) {
    /** background **/
    this.context.beginPath();
    this.context.fillStyle = 'rgba(0, 0, 0, 0.7)';
    this.context.fillRect(0, 0, this.canvasWidth, this.canvasHeight);
    this.context.closePath();

    /** top text **/
    this.context.beginPath();
    this.context.font = "normal normal 32px monospace";
    this.context.fillStyle = '#aa0000';
    this.context.textAlign = "center";
    this.context.fillText(header, this.canvasWidth / 2, this.canvasHeight / 2);
    this.context.closePath();

    /** middle text **/
    this.context.beginPath();
    this.context.font = "normal normal 14px monospace";
    this.context.fillStyle = '#aa0000';
    this.context.textAlign = "center";
    this.context.fillText(action, this.canvasWidth / 2, this.canvasHeight / 2 + 32);
    this.context.closePath();

    /** bottom addition text **/
    if (addition === true) {
        this.renderScore();
    }
}

Game.prototype.renderScore = function() {
    this.context.beginPath();
    this.context.font = "normal bold 18px monospace";
    this.context.fillStyle = '#aa0000';
    this.context.textAlign = "center";
    this.context.fillText('Score: ' + this.score, this.canvasWidth - (this.canvasWidth * 0.15), this.canvasHeight - (this.canvasHeight * 0.05));
    this.context.closePath();
}

/*** Game status ***/
Game.prototype.setStatus = function(value) {
    this.onStatusChange(value, this.status);
    this.status = value;
}

Game.prototype.getStatus = function() {
    return this.status;
}

Game.prototype.onStatusChange = function(newstatus, oldstatus) {
    if (newstatus == this.STATUS.PLAY && oldstatus != this.STATUS.PAUSE) {
        this.bonus.create();
    }
}

/*** Key's ***/
Game.prototype.handleInput = function(event) {
    if (input.isKey('SPACE', event)) {
        if (this.getStatus() == this.STATUS.GAMEOVER || this.getStatus() == this.STATUS.GAMEWIN) {
            this.reset();
            this.setStatus(this.STATUS.PLAY);
        } else if (this.getStatus() == this.STATUS.PAUSE) {
            this.setStatus(this.STATUS.PLAY);
        } else if (this.getStatus() == this.STATUS.PLAY) {
            this.setStatus(this.STATUS.PAUSE);
        } else if (this.getStatus() == this.STATUS.NONE) {
            this.setStatus(this.STATUS.PLAY);
        }
    }

    if (this.getStatus() == this.STATUS.PLAY && !input.isLock) {
        input.isLock = true;

        if ((input.isKey('UP', event) || input.isKey('w', event)) && !this.snake.isRoute('DOWN')) {
            this.snake.setRoute('UP');
        } else if ((input.isKey('DOWN', event) || input.isKey('s', event)) && !this.snake.isRoute('UP')) {
            this.snake.setRoute('DOWN');
        } else if ((input.isKey('LEFT', event) || input.isKey('a', event)) && !this.snake.isRoute('RIGHT')) {
            this.snake.setRoute('LEFT');
        } else if ((input.isKey('RIGHT', event) || input.isKey('d', event)) && !this.snake.isRoute('LEFT')) {
            this.snake.setRoute('RIGHT');
        }
    }
}