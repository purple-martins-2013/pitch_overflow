function ScoreView(locator) {
  this.element = $(locator);
}

ScoreView.prototype.set = function(score) {
  this.element.html(score);
} 

function AddDownVoteWidget(downVoteButton, scoreView) {
  $(downVoteButton).closest('form').on('ajax:success', function(e, score) {
    scoreView.set(score);
  });
};