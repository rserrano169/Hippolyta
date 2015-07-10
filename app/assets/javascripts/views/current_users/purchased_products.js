Hippolyta.Views.CurrentUserPurchasedProducts = Backbone.View.extend({
  template: JST["current_users/purchased_products"],

  events: {},

  initialize: function (options) {
    this.purchasedProducts = options.purchasedProducts;
  },

  render: function () {
    var content = this.template({
      purchasedProducts: this.purchasedProducts,
    })
    this.$el.html(content);

    return this;
  },
});
