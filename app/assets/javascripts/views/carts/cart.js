Hippolyta.Views.CartItems = Backbone.View.extend({

  template: JST["current_users/cart"],

  initialize: function (options) {
    this.cart = options.cart;
    this.cartProducts = options.cartProducts;
    this.products = options.products;
    this.listenTo(this.cart, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      cart: this.cart,
      cartProducts: this.cartProducts,
      products: this.products
    });
    this.$el.html(content);

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    this.$("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    return this;
  },
});
