Hippolyta.Models.CurrentUser = Backbone.Model.extend({
  url: 'api/current_user/show',
});

Hippolyta.Models.currentUser = new Hippolyta.Models.CurrentUser();
