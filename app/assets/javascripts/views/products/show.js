Hippolyta.Views.ProductShow = Backbone.View.extend({

  template: JST["products/show"],

  initialize: function (options) {
    this.users = options.users;
    this.seller = options.seller;
    this.product = options.product;
    this.reviews = options.reviews;
    this.listenTo(this.product, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      users: this.users,
      seller: this.seller,
      product: this.product,
      reviews: this.reviews,
    });
    this.$el.html(content);
    this.renderStarRating();

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    this.$("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    return this;
  },

  renderStarRating: function () {
    var reviewRatingPercentage = this.product.escape("review_rating_percentage");
    if (reviewRatingPercentage) {
      $("#product-show-review-rating-full-stars")
        .width(reviewRatingPercentage + '%');
    }
  },

});
