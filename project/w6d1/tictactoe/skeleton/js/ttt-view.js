class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;   //the view, $(".ttt")
    this.setupBoard();
    this.bindEvents();
    // console.log(this.$el);
  } //

  bindEvents() {
    // Game.prototype.playMove();
    this.$el.on('click', 'li', event =>{
      const $square = $(event.currentTarget);
      this.makeMove($square);
    });
  } //


  makeMove($square) {
    try {
      this.game.playMove($square.data("pos"));
    } catch (error) {
      alert("Invalid move");
    }
    // $square.html(this.game.currentPlayer);   //adds 'x' and 'o' onto screen but couldn't manipulate it in css.why?

    $square.addClass(this.game.currentPlayer);

    if (this.game.isOver()) {
      this.$el.off("click"); //user can't click on buttons anymore
      this.$el.addClass("game-over"); //add class so you can manipulate it in css


      const winner = this.game.winner();
      const $figcaption = $("<figcaption>");

      if (winner) {
        this.$el.addClass(`winner-${winner}`);
        $figcaption.html(`You win, ${winner}`);
      } else {
        $figcaption.html("It's a draw!"); //figure caption
      }

      this.$el.append($figcaption);
    }
  }  //play moves from game

  setupBoard() {

    const $ul = $("<ul></ul>"); //created ul element
    for (let x = 0; x < 3; x++) {
      for (let y = 0; y < 3; y++) {
        const $li = $("<li></li>");
        $li.data("pos", [x,y]);
        $ul.append($li);
      }
    }
    this.$el.append($ul);
    } //uses .ttt and append stuff to it. ex. inside this figure, append h2 element to it


  }

module.exports = View;
