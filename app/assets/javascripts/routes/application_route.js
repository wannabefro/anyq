App.ApplicationRoute = Ember.Route.extend(Ember.SimpleAuth.ApplicationRouteMixin, {
  actions: {
    login: function(provider) {
      if (window._current_environment === 'development'){
        window.open(
          'http://localhost:3000/auth/' + provider
        );


      } else if (window._current_environment === 'staging'){
        window.open(
          'http://staging.anyq.com/auth/' + provider
        );
      } else if (window._current_environment === 'production'){
        window.open(
          'http://anyq.com/auth/' + provider
        );
      }
    }
  }
});
