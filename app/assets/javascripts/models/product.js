Hippolyta.Models.Product = Backbone.Model.extend({
  urlRoot: "/api/users/:user_id/products",

  toJSON: function () {
    return {
      product: _.clone(this.attributes),
    };
  },
});

Hippolyta.Models.product = new Hippolyta.Models.Product();
