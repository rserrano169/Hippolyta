Hippolyta.Views.CartItems = Backbone.View.extend({

  template: JST["carts/show"],

  initialize: function (options) {
    this.cart = options.cart;
    this.listenTo(this.cart, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      cart: this.cart,
      products: this.collection
    });
    this.$el.html(content);
    return this;
  },
});
