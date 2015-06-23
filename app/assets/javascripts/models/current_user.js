Hippolyta.Models.CurrentUser = Backbone.Model.extend({
  urlRoot: 'api/current_user',
});

Hippolyta.Models.currentUser = new Hippolyta.Models.CurrentUser();
