Hippolyta.Views.Checkout = Backbone.View.extend({

  template: JST["checkouts/checkout"],

  initialize: function (options) {
    this.cart = options.cart;
    this.cartProducts = options.cartProducts;
    this.products = options.products;
    this.users = options.users;
    this.listenTo(this.cart, "sync", this.render);
  },

  events: {
    "click #review-cart-title": "slideDownCart",
    "click #review-cart-title-dropped": "slideUpCart",
    "click #review-cart-button": "slideDownCart",
    "click #review-cart-button-dropped": "slideUpCart",
  },

  render: function () {
    var user = this.users.getOrFetch(this.cart.get("buyer_id")),
        content = this.template({
          cart: this.cart,
          cartProducts: this.cartProducts,
          products: this.products,
          users: this.users,
          user: user,
        }),
        csrfToken = $("meta[name='csrf-token']").attr('content');
    this.$el.html(content);
    this.$("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    return this;
  },

  slideDownCart: function () {
    this.$("#review-cart-title")
      .attr("id", "review-cart-title-dropped")
      .html("Review Items");
    this.$("#review-cart").attr("id", "review-cart-dropped");
    this.$("#review-cart-button").attr("id", "review-cart-button-dropped");
    this.$("#checkout-products").slideDown("fast");
  },

  slideUpCart: function () {
    this.$("#review-cart-title-dropped")
      .attr("id", "review-cart-title")
      .html("Cart Items");
    this.$("#review-cart-dropped").attr("id", "review-cart");
    this.$("#review-cart-button-dropped").attr("id", "review-cart-button");
    this.$("#checkout-products").slideUp("fast");
  },

});
