Hippolyta.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    Hippolyta.Collections.users.fetch();
    this.$rootEl = options.$rootEl
  },

  routes: {
    "users/:id": "userShow",
    "users/:id/edit": "userEdit",
    "users/:seller_id/products": "productsIndex",
    "products/new": "productsNew",
    "search_results": "searchResults",
    "users/:seller_id/products/:id": "productShow",
  },

  userShow: function (id) {
    var model = Hippolyta.Collections.users.getOrFetch(id);
    var showView = new Hippolyta.Views.UserShow({ model: model });
    this._swapView(showView);
  },

  productsIndex: function (seller_id) {
    var user = Hippolyta.Collections.users.getOrFetch(seller_id);
    var indexView = new Hippolyta.Views.ProductsIndex({
      user: user,
      collection: user.products(),
    });

    this._swapView(indexView);
  },

  productsNew: function () {
    var model = new Hippolyta.Models.Product();
    var newView = new Hippolyta.Views.ProductNewForm({
      model: model,
    });

    this._swapView(newView);
  },

  userEdit: function (id) {
    var collection = Hippolyta.Collections.users
    var model = Hippolyta.Collections.users.getOrFetch(id);
    var editView = new Hippolyta.Views.UserEdit({
      model: model,
      collection: collection
    });
    this._swapView(editView);
  },

  searchResults: function () {
    Hippolyta.Collections.searchresults.fetch();
    var collection = Hippolyta.Collections.searchresults;
    var searchView = new Hippolyta.Views.SearchResults({
      collection: collection,
    });

    this._swapView(searchView);
  },

  productShow: function (seller_id, id) {
    var user = Hippolyta.Collections.users.getOrFetch(seller_id);
    var collection = user.products();
    var product = collection.getOrFetch(id)
    var productShowView = new Hippolyta.Views.ProductShow({
      product: product,
      collection: collection
    });

    this._swapView(productShowView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
