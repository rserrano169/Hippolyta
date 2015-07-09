Hippolyta.Models.Product = Backbone.Model.extend({
  urlRoot: "/api/users/:user_id/products",

  reviews: function () {
    if (!this._reviews) {
      this._reviews = new Hippolyta.Collections.ProductReviews([], { review: this });
    }

    return this._reviews;
  },

  parse: function (response) {
    if (response.reviews) {
      this.reviews().set(response.reviews, { parse: true });
      delete response.reviews
    }

    return response;
  },

  toJSON: function () {
    return {
      product: _.clone(this.attributes),
    };
  },
});

Hippolyta.Models.product = new Hippolyta.Models.Product();
