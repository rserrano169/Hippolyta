Hippolyta.Collections.SearchResults = Backbone.Collection.extend({

  url: "/api/queries",

  model: Hippolyta.Models.Product,

  parse: function (resp) {
    if (resp.total_count) {
      this.total_count = resp.total_count;
    };

    return resp.results;
  },

});

Hippolyta.Collections.searchresults = new Hippolyta.Collections.SearchResults();
