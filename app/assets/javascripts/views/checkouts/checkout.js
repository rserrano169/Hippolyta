Hippolyta.Views.Checkout = Backbone.View.extend({

  template: JST["checkouts/checkout"],

  initialize: function (options) {
    this.cart = options.cart;
    this.cartProducts = options.cartProducts;
    this.products = options.products;
    this.users = options.users;
    this.listenTo(this.cart, "sync", this.render);
    this.listenTo(this.users, "sync", this.render);
  },

  events: {
    "click #shipping-address" : "dropDownShippingAddressMenu",
    "click #payment-method" : "dropDownPaymentMethodMenu",
    "click #review-cart" : "dropDownReviewCartMenu",
  },

  render: function () {
    var user = this.users.getOrFetch(this.cart.get("buyer_id")),
        content = this.template({
          cart: this.cart,
          cartProducts: this.cartProducts,
          products: this.products,
          users: this.users,
          user: user,
        });
    this.$el.html(content);
    return this;
  },

  dropDownShippingAddressMenu: function (event) {
    console.log($(event.target));
  },

  dropDownPaymentMethodMenu: function (event) {
    console.log($(event.target));
  },

  dropDownReviewCartMenu: function (event) {
    console.log($(event.target));
  },

});
