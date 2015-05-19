Hippolyta.Collections.CartProducts = Backbone.Collection.extend({

  url: "api/cart_products",

  model: Hippolyta.Models.CartProduct,

  getOrFetch: function (id) {
    var cartProduct = this.get(id),
      cartProducts = this;

    if (!cartProduct) {
        cartProduct = new Hippolyta.Models.CartProduct({ id: id });
        cartProduct.fetch({
          success: function () {
            cartProducts.add(cartProduct);
          },
        });
    } else {
        cartProduct.fetch();
    };

    return cartProduct;
  },

  getOrFetchByCartAndProductId: function (cart_id, product_id) {
    var cartProduct = this.findWhere({
      cart_id: cart_id,
      product_id: product_id
    }),
        cartProducts = this;

    if (!cartProduct) {
        cartProduct = new Hippolyta.Models.CartProduct({
          cart_id: cart_id,
          product_id: product_id
        });
        cartProduct.fetch({
          success: function () {
            cartProducts.add(cartProduct);
          },
        });
    } else {
        cartProduct.fetch();
    };

    return cartProduct;
  },

});
