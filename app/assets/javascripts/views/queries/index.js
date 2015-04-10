Hippolyta.Views.SearchResults = Backbone.View.extend ({

  template: JST["queries/search"],

  initialize: function () {
    console.log("hello");
    this.listenTo(this.collection, "add", this.render);
    console.log("goodbye");
  },

  render: function () {
    console.log("hi");

    var content = this.template({ results: this.collection });
    this.$el.html(content);
    return this;
  },
});
