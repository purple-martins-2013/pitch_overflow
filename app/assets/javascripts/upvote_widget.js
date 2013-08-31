function ScoreView(locator) {
  this.element = $(locator);
}

ScoreView.prototype.set = function(score) {
  this.element.html(score);
} 

function AddUpVoteWidget(upVoteButton, scoreView) {
  $(upVoteButton).closest('form').on('ajax:success', function(e, score) {
    debugger
    scoreView.set(score);
  });;
};
