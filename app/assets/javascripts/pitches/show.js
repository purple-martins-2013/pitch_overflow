$(document).ready(function() {
  new AddReactionWidget('#new_reaction', new ReactionsContainer('#pitch_reactions'));

  new AddUpVoteWidget('#upvote', new ScoreView('#score'));
});
