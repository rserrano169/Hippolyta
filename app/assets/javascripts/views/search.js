Hippolyta.Views.SearchResults = Backbone.View.extend ({

  template: JST["/search"],

  initialize: function () {
    this.searchResults = new Hippolyta.Collections.SearchResults();
    this.listenTo(this.searchResults, "sync", this.render);
  },

  events: {
    "submit .search-form": "search",
  },

  render: function () {
    var content = this.template ({
      results: this.searchResults,
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
