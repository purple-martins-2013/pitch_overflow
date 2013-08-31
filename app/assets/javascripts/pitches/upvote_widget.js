function ScoreContainer(locator) {
  this.element = $(locator);
}

ScoreContainer.prototype.increment = function(score) {
  this.element.html(score)
} 

function AddUpVoteWidget(upVoteButton, scoreContainer) {
  $(upVoteButton).on('ajax:success', function(e, score) {
    scoreContainer.increment(score);
  });
};
