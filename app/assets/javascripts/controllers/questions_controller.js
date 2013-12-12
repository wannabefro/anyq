App.QuestionsController = Ember.ArrayController.extend({
  needs: ['vote'],
  itemController: 'question'
});
