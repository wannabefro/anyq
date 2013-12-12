App.VoteRoute = Ember.Route.extend({
  model: function(){
    return this.store.createRecord('vote');
  },

  setupController: function(controller, model){
    controller.set('model', model);
  }
});
