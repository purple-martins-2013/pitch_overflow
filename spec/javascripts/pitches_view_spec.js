//= require helpers/spec_helper
//= require vote_widget

describe("VoteWidget", function() {
  var scoreView;
  var voteButton;

  beforeEach(function() {
    scoreView = {
      set: jasmine.createSpy()
    };

    voteButton = affix('form').affix('button[id="upvote"]');

    var UpVoteWidget = new VoteWidget(voteButton, scoreView);

    $(voteButton).trigger("ajax:success", "50");

  });

  it("sets the score on the scoreView to the response from ajax:success", function() {
    expect(scoreView.set).toHaveBeenCalledWith("50");
  });
});
