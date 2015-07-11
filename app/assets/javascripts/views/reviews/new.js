Hippolyta.Views.NewReview = Backbone.View.extend({
  template: JST["reviews/new"],

  events: {
    "click .new-review-full-star": "selectStarRating",
  },

  initialize: function (options) {
    this.purchasedProduct = options.purchasedProduct;
    this.listenTo(this.purchasedProduct, "sync", this.render);
  },

  render: function () {
    var content = this.template({
          purchasedProduct: this.purchasedProduct,
        });
    this.$el.html(content);
    this.prependCsrfToken();

    return this;
  },

  prependCsrfToken: function () {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
    this.$el.find("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    )
  },

  selectStarRating: function (event) {
    event.preventDefault();
    console.log('clicked');
  },
});
