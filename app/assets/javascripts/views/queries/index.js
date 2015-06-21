Hippolyta.Views.SearchResults = Backbone.View.extend({

  template: JST["queries/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ results: this.collection });
    this.$el.html(content);
    return this;
  },
});
