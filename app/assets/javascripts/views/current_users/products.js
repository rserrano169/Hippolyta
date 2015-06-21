Hippolyta.Views.CurrentUserProducts = Backbone.View.extend({

  template: JST["current_users/products"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ products: this.collection });
    this.$el.html(content);
    return this;
  },
});
