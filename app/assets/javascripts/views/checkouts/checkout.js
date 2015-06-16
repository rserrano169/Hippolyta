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
    "click #payment-add-card": "openCardForm",
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

  openCardForm: function () {
    this.adjustCardFormPosition();
    $(window).on("resize scroll", this.adjustCardFormPosition);
    this.$("#add-card-form-modal").show();
  },

  adjustCardFormPosition: function () {
    var formWidth = this.$("#add-card-form").width() + 2,
        formHeight = this.$("#add-card-form").height() + 2,
        leftScroll = $(window).scrollLeft(),
        topScroll = $(window).scrollTop(),
        leftIndent = ($(window).width() - formWidth) / 2,
        topIndent = ($(window).height() - formHeight) / 2,
        totalLeft = leftIndent + leftScroll + "px";
        totalTop = topIndent + topScroll + "px",
    this.$("#add-card-form").css({left: totalLeft});
    this.$("#add-card-form").css({top: totalTop});
  },
});
