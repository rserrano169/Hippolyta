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
    "click #review-cart>.step-span": "dropDownCart",
    "click #review-cart-dropped>.step-span": "liftUpCart",
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

  dropDownCart: function () {
    this.$("#review-cart>.step-span").html("Review Items");
    this.$("#review-cart").attr("id", "review-cart-dropped");
    this.$("#checkout-products").slideDown("fast");
  },

  liftUpCart: function () {
    this.$("#review-cart-dropped>.step-span").html("Cart Items");
    this.$("#review-cart-dropped").attr("id", "review-cart");
    this.$("#checkout-products").slideUp("fast");
  },

});
