Hippolyta.Collections.SearchResults = Backbone.Collection.extend({

  url: "/api/queries",

  model: Hippolyta.Models.Product,
});

Hippolyta.Collections.searchresults = new Hippolyta.Collections.SearchResults();
