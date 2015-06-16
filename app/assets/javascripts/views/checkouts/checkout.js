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
    "click #payment-add-card": "openPaymentForm",
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

  openPaymentForm: function (event) {
    this.disableOpenPaymentForm();

    var handler = StripeCheckout.configure({
          key: 'pk_test_JL4t7hmhcbXwo7mWvSGZxiIK',
          token: function(token) {
            // Use the token to create the charge with a server-side script.
            // You can access the token ID with `token.id`
          }
        }),
        totalCartQuantity = 0,
        totalCartPrice = 0;

    this.cartProducts.forEach(function (cp) {
      totalCartQuantity += parseInt(cp.escape("quantity"));
    });

    this.products.forEach(function (prod) {
      totalCartPrice += parseFloat(prod.escape("sale_price") * 100);
    });

    handler.open({
      name: 'Hippolyta',
      description: totalCartQuantity + ' total items',
      amount: totalCartPrice
    });

    // Close Checkout on page navigation
    $(window).on('popstate', function() {
      handler.close();
    });

    this.enableOpenPaymenyForm();
  },

  disableOpenPaymentForm: function () {
    this.events['click #payment-add-card'] = undefined;
    this.delegateEvents(this.events);
  },

  enableOpenPaymenyForm: function () {
    this.events['click #payment-add-card'] = 'openPaymentForm';
    this.delegateEvents(this.events);
  },
});
