App.Question = DS.Model.extend({
  body: DS.attr(),
  user:  DS.belongsTo('anonymousUser')
});
