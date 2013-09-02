var PitchesPage = function() {
  new AddReactionWidget('#new_reaction', new ReactionsContainer('#pitch_reactions'));
  var scoreView = new ScoreView('#pitch-score')

  new VoteWidget('#upvote', scoreView);
  new VoteWidget('#downvote', scoreView);
}
