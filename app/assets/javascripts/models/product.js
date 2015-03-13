Hippolyta.Models.Product = Backbone.Model.extend({
  urlRoot: "/api/products",

  toJSON: function () {
    return {
      product: _.clone(this.attributes),
    };
  },
});
