Hippolyta.Collections.SearchResults = Backbone.Collection.extend({

  url: "/api/queries",

  model: Hippolyta.Models.Product,

  // parse: function (response) {
  //   if (response.total_count) {
  //     this.total_count = response.total_count;
  //   };
  //   console.log("resp", resp);
  //   return resp;
  // },

});

Hippolyta.Collections.searchresults = new Hippolyta.Collections.SearchResults();
