const View = require("./ttt-view");
const Game = require("../../solution/game");// require appropriate file

$( () => { //container element
  const game = new Game();
  const view = new View(game, $(".ttt")); // to select any element with the class "ttt" is to call .ttt
  // view.setupBoard(); same as calling it inside of the view constructor method
});
