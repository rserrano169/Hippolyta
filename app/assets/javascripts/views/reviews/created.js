Hippolyta.Views.ReviewCreated = Backbone.View.extend({
  template: JST["reviews/created"],

  initialize: function (options) {
    this.reviewedProductSellerId = options.reviewedProductSellerId;
    this.reviewedProductId = options.reviewedProductId;
  },

  render: function () {
    var content = this.template({
      reviewedProductSellerId: this.reviewedProductSellerId,
      reviewedProductId: this.reviewedProductId,
    });
    this.$el.html(content);
    return this;
  },
});
