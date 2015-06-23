Hippolyta.Collections.SearchResults = Backbone.Collection.extend({

  url: "/api/queries",

  model: Hippolyta.Models.Product,

  parse: function (response) {
    if (response.keywords) {
      this.keywords = response.keywords;
      delete response.keywords;
    };

    return response.results;
  },
});

Hippolyta.Collections.searchResults = new Hippolyta.Collections.SearchResults();
