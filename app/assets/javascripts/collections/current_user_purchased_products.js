Hippolyta.Collections.CurrentUserPurchasedProducts = Backbone.Collection.extend({
  url: "/api/current_user/purchased_products",

  model: Hippolyta.Models.Product,

  getOrFetch: function (id) {
    var product = this.get(id),
        products = this;

    if (!product) {
      product = new Hippolyta.Models.Product({ id: id });
      product.fetch({
        success: function () {
          products.add(product);
        },
      });
    } else {
      product.fetch();
    }

    return product;
  },
});

Hippolyta.Collections.currentUserPurchasedProducts = new Hippolyta.Collections.CurrentUserPurchasedProducts();
