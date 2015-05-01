Hippolyta.Views.ProductShow = Backbone.View.extend({

  template: JST["products/show"],

  initialize: function (options) {
    this.product = options.product;
    this.listenTo(this.product, "sync", this.render);
  },

  render: function () {
    var content = this.template({ product: this.product });
    this.$el.html(content);
    return this;
  },

});
