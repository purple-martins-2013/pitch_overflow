function VoteWidget(voteButton, scoreView) {
  $(voteButton).closest('form').on('ajax:success', function(e, score) {
    scoreView.set(score);
  });
};
