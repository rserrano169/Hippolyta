Hippolyta.Models.Cart = Backbone.Model.extend({
  urlRoot: "/api/carts",

  products: function () {
    if (!this._products) {
      this._products = new Hippolyta.Collections.Products([], { product: this });
    }

    return this._products;
  },

  parse: function (response) {
    if (response.products) {
      this.products().set(response.products, { parse: true });
      delete response.products
    }

    return response;
  },

  toJSON: function () {
    return {
      cart: _.clone(this.attributes)
    };
  },
});
