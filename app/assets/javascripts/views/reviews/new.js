Hippolyta.Views.NewReview = Backbone.View.extend({
  template: JST["reviews/new"],

  events: {
    "click .new-review-full-star": "selectStarRating",
    "click .new-review-empty-star": "selectStarRating",
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

    if ($(event.target).attr('id') === 'new-review-star-one') {
        $('#new-review-star-one').attr('class', 'new-review-full-star');
        $('#new-review-star-two').attr('class', 'new-review-empty-star');
        $('#new-review-star-three').attr('class', 'new-review-empty-star');
        $('#new-review-star-four').attr('class', 'new-review-empty-star');
        $('#new-review-star-five').attr('class', 'new-review-empty-star');
        $('#new-review-star-rating-input').val('1');
    } else if ($(event.target).attr('id') === 'new-review-star-two') {
        $('#new-review-star-one').attr('class', 'new-review-full-star');
        $('#new-review-star-two').attr('class', 'new-review-full-star');
        $('#new-review-star-three').attr('class', 'new-review-empty-star');
        $('#new-review-star-four').attr('class', 'new-review-empty-star');
        $('#new-review-star-five').attr('class', 'new-review-empty-star');
        $('#new-review-star-rating-input').val('2');
      } else if ($(event.target).attr('id') === 'new-review-star-three') {
        $('#new-review-star-one').attr('class', 'new-review-full-star');
        $('#new-review-star-two').attr('class', 'new-review-full-star');
        $('#new-review-star-three').attr('class', 'new-review-full-star');
        $('#new-review-star-four').attr('class', 'new-review-empty-star');
        $('#new-review-star-five').attr('class', 'new-review-empty-star');
        $('#new-review-star-rating-input').val('3');
      } else if ($(event.target).attr('id') === 'new-review-star-four') {
        $('#new-review-star-one').attr('class', 'new-review-full-star');
        $('#new-review-star-two').attr('class', 'new-review-full-star');
        $('#new-review-star-three').attr('class', 'new-review-full-star');
        $('#new-review-star-four').attr('class', 'new-review-full-star');
        $('#new-review-star-five').attr('class', 'new-review-empty-star');
        $('#new-review-star-rating-input').val('4');
      } else if ($(event.target).attr('id') === 'new-review-star-five') {
        $('#new-review-star-one').attr('class', 'new-review-full-star');
        $('#new-review-star-two').attr('class', 'new-review-full-star');
        $('#new-review-star-three').attr('class', 'new-review-full-star');
        $('#new-review-star-four').attr('class', 'new-review-full-star');
        $('#new-review-star-five').attr('class', 'new-review-full-star');
        $('#new-review-star-rating-input').val('5');
      }
  },
});
