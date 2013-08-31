//= require helpers/spec_helper
//= require upvote_widget

describe("AddUpVoteWidget", function() {
  var scoreView;
  var upVoteButton;

  
  beforeEach(function() {
    scoreView = {
      set: jasmine.createSpy()
    };

    upVoteButton = affix('button[id="upvote"]');
    
    var UpVoteWidget = new AddUpVoteWidget(upVoteButton, scoreView);

    $(upVoteButton).trigger("ajax:success", "50");

  });

  it("sets the score on the scoreView to the response from ajax:success", function() {
    expect(scoreView.set).toHaveBeenCalledWith("50");
  });
  
});
