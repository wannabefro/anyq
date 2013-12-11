App.QuestionsRoute = Ember.Route.extend(Ember.SimpleAuth.AuthenticatedRouteMixin, {
  model: function() {
    return EmberFire.Array.create({
      ref: new Firebase("https://anyq.firebaseio.com/questions")
    });
  }
});
