Hippolyta.Collections.CurrentUserAddresses = Backbone.Collection.extend({
  url: "api/current_user/addresses",
});

Hippolyta.Collections.currentUserAddresses = new Hippolyta.Collections.CurrentUserAddresses();
