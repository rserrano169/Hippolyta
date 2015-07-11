Hippolyta.Views.NewReview = Backbone.View.extend({
  template: JST["reviews/new"],

  initialize: function (options) {
    this.purchasedProduct = options.purchasedProduct;
    this.listenTo(this.purchasedProduct, "sync", this.render);
  },

  render: function () {
    var content = this.template({
          purchasedProduct: this.purchasedProduct,
        });
    this.$el.html(content);

    return this;
  },
});
