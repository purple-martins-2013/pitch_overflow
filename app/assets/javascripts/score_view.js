function ScoreView(locator) {
  this.element = $(locator);
}

ScoreView.prototype.set = function(score) {
  this.element.html(score);
}

