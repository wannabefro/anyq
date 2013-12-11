App.QuestionsNewController = Ember.ObjectController.extend({
  actions: {
    save: function(){
      this.set('user', this.get('session').user);
      var that = this;
      this.get('content').save().then(function(response){
        that.transitionToRoute('questions.success');
      }, function(error){
        console.log("oh no");
      });
    }
  }
});
