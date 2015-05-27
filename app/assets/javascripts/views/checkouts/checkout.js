Hippolyta.Views.Checkout = Backbone.View.extend({

  template: JST["checkouts/checkout"],

  initialize: function () {

  },

  events: {
    "click #shipping-address" : "dropDownShippingAddressMenu",
    "click #payment-method" : "dropDownPaymentMethodMenu",
    "click #review-cart" : "dropDownReviewCartMenu",
  },

  render: function () {
    var content = this.template({});
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
