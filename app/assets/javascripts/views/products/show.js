Hippolyta.Views.ProductShow = Backbone.View.extend({

  template: JST["products/show"],

  initialize: function (options) {
    this.seller = options.seller,
    this.product = options.product;
    this.listenTo(this.product, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      seller: this.seller,
      product: this.product
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
