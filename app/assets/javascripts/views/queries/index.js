Hippolyta.Views.SearchResults = Backbone.View.extend({

  template: JST["queries/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      results: this.collection,
      renderStarRating: this.renderStarRating,
    });
    this.$el.html(content);
    this.renderStarRating();

    return this;
  },

  renderStarRating: function () {
    this
      .$el
      .find($("input[name='reviewRatingPercentage']"))
      .each( function (idx) {
        $(this).parent().width($(this).val());
      });
  },
});
