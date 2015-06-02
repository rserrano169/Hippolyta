Hippolyta.Views.CheckoutPlaced = Backbone.View.extend({

  template: JST["checkouts/checkout_placed"],

  initialze: function (options) {
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },

});
