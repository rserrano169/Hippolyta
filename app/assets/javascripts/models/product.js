Hippolyta.Models.Product = Backbone.Model.extend({
  urlRoot: "/api/product/:id",

  toJSON: function () {
    return {
      user: _.clone(this.attributes),
    };
  },
});
