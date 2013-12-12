App.Vote = DS.Model.extend({
  user: DS.belongsTo('anonymousUser'),
  question: DS.attr()
});
