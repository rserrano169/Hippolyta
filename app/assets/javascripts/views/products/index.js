Hippolyta.Views.ProductsIndex = Backbone.View.extend({

  template: JST["products/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ products: this.collection });
    this.$el.html(content);
    return this;
  },

});
