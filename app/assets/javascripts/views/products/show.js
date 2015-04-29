Hippolyta.Views.ProductShow = Backbone.View.extend({

  template: JST["products/show"],

  initialize: function (options) {
    this.product = options.product;
    console.log(this.product);
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ product: this.product });
    this.$el.html(content);
    return this;
  },

});
