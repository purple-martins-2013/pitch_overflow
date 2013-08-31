function ReactionsContainer(locator) {
  this.element = $(locator);
}

ReactionsContainer.prototype.add = function(reaction) {
  this.element.append(reaction);
};

function AddReactionWidget(reactionsForm, reactionsContainer) {
  $(reactionsForm).on('ajax:success', function(e, reaction) {
    reactionsContainer.add(reaction);
    $(reactionsForm).find('input[type!="submit"],textarea').val('');
  });

}
