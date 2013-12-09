App.AnonymousUser = DS.Model.extend({
  ipAddress: DS.attr(),
  username: DS.attr(),
  currentUser: DS.attr()
});
