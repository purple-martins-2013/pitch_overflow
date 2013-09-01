//= require helpers/spec_helper
//= require upvote_widget
//= require downvote_widget

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

describe("AddDownVoteWidget", function() {
  var scoreView;
  var downVoteButton;

  beforeEach(function() {
    scoreView = {
      set: jasmine.createSpy()
    };

    downVoteButton = affix('button[id="downvote"]');

    var DownVoteWidget = new AddDownVoteWidget(downVoteButton, scoreView);

    $(downVoteButton).trigger("ajax:success", "blah");
  });

  it ("sets the score on the scoreView to the response from ajax:success", function() {
    expect(scoreView.set).toHaveBeenCalledWith("blah");
  });
});

