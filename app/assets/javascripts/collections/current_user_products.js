Hippolyta.Collections.CurrentUserProducts = Backbone.Collection.extend({
  url: 'api/current_user/products',
});

Hippolyta.Collections.currentUserProducts = new Hippolyta.Collections.CurrentUserProducts();
