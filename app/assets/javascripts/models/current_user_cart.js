Hippolyta.Models.CurrentUserCart = Backbone.Model.extend({
  urlRoot: "/api/current_user/cart",

  cartProducts: function () {
    if (!this._cartProducts) {
      this._cartProducts = new Hippolyta.Collections.CartProducts(
        [],
      { cartProduct: this }
      );
    }

    return this._cartProducts;
  },

  products: function () {
    if (!this._products) {
      this._products = new Hippolyta.Collections.Products(
        [],
        { product: this }
      );
    }

    return this._products;
  },

  parse: function (response) {
    if (response.cart_products) {
      this.cartProducts().set(response.cart_products, { parse: true });
      delete response.cart_products
    };

    if (response.products) {
      this.products().set(response.products, { parse: true });
      delete response.products
    };

    return response;
  },

  toJSON: function () {
    return {
      cart: _.clone(this.attributes)
    };
  },
});

Hippolyta.Models.currentUserCart = new Hippolyta.Models.CurrentUserCart();
