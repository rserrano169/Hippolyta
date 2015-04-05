Hippolyta.Views.SearchResults = Backbone.View.extend ({

  template: JST["search"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      results: this.collection,
    });

    this.$el.html(content)

    return this;
  },

  search: function (event) {
    event.preventDefault();
    this.searchResults.query = this.$("#query").val();

    this.searchResults.fetch({
      data: {
        query: this.searchResults.query,
      },
    });
  },

});
