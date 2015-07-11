Hippolyta.Views.ReviewCreated = Backbone.View.extend({
  template: JST["reviews/created"],

  initialize: function (options) {

  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  },
});
