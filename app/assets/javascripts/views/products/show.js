Hippolyta.Views.ProductShow = Backbone.View.extend({

  template: JST["products/show"],

  initialize: function (options) {
    this.seller = options.seller,
    this.product = options.product;
    this.reviews = options.reviews;
    this.listenTo(this.product, "sync", this.render);
  },

  render: function () {
    console.log(this.reviews.length);

    var content = this.template({
      seller: this.seller,
      product: this.product,
      reviews: this.reviews,
    });
    this.$el.html(content);

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    this.$("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    return this;
  },

});
