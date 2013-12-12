App.VoteController = Ember.ObjectController.extend({
  actions: {
    create: function(that) {
      this.set('question', that);
      this.set('user', this.get('session.user'));
      this.get('content').save().then(function(response){
        console.log('success');
      }, function(error){
        console.log('error');
      });
    }
  }
});
