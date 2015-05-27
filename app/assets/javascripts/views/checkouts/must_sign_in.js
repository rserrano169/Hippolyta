Hippolyta.Views.SignInBeforeCheckout = Backbone.View.extend({

  template: JST["checkouts/must_sign_in"],

  initialize: function () {
  },

  render: function () {
    var content = this.template({});
    this.$el.html(content);
    return this;
  },
});
