Hippolyta.Views.ProductsIndex = Backbone.View.extend({

  template: JST["products/index"],

  initialize: function (options) {
    this.user = options.user
    this.listenTo(this.user, "sync", this.render);
  },

  render: function () {
    var content = this.template({ products: this.collection });
    this.$el.html(content);
    return this;
  },

});
