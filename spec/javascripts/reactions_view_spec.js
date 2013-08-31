//= require helpers/spec_helper
//= require add_reaction_widget


describe("AddReactionWidget", function() {
  var reactionsForm;
  var reactionsContainer;
  
  var buildReactionsForm = function() {
    reactionsForm = affix('form');
    reactionsForm.affix('textarea');
    reactionsForm.affix('input[value="submit"][type="submit"]');
  };

  beforeEach(function() {
    reactionsContainer = {
      add: jasmine.createSpy()
    };
    
    buildReactionsForm();

    var reactionsWidget = new AddReactionWidget(reactionsForm, reactionsContainer);

    $(reactionsForm).trigger("ajax:success", "<h1>YOU REACTED</h1>");
  });

  it("adds the response from ajax:success to the reactions container", function() {
    expect(reactionsContainer.add).toHaveBeenCalledWith("<h1>YOU REACTED</h1>");
  });

  it("Clears the form", function() {
    expect(reactionsForm.find('textarea').val()).toEqual('');
    expect(reactionsForm.find('input[type="submit"]').val()).toEqual('submit');
  });

});
