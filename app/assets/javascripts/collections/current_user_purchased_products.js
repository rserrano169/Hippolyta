Hippolyta.Collections.CurrentUserPurchasedProducts = Backbone.Collection.extend({
  url: "/api/current_user/purchased_products",

  model: Hippolyta.Models.Product,
});

Hippolyta.Collections.currentUserPurchasedProducts = new Hippolyta.Collections.CurrentUserPurchasedProducts();
