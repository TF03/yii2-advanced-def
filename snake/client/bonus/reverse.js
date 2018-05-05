function Reverse(bonus) {
    this.bonus = bonus;
    this.tilePos = {
        x: 0*64,
        y: 2*64
    };
    this.countRender = 0;
    this.reverse = false;
}

Reverse.prototype.generatePos = function() {
    if (this.reverse == true && this.countRender > 3) {
        this.countRender = 0;
        this.reverse = false;
    }

    if ((!this.bonus.posBonuses['rev'] || this.countRender > 2) && this.reverse == false) {
        this.countRender = 0;
        return this.bonus.generatePos();
    } else {
        this.countRender++;
        return false;
    }
}

Reverse.prototype.eat = function () {
    this.reverse = true;
    this.bonus.remove('rev');
    return true;
}