var game = new Game();

function init() {
    game.init();
    main();
    game.rebootInterval();
}
function main() {
    game.update();
    game.render();
}
document.addEventListener('keydown', function(e) {
    game.handleInput(e);
});

init();