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
    "sellers/:seller_id/products/:id": "productShow",
  },

  userShow: function (id) {
    var model = Hippolyta.Collections.users.getOrFetch(id);
    var showView = new Hippolyta.Views.UserShow({ model: model });
    this._swapView(showView);
  },

  productsIndex: function (seller_id) {
    var seller = Hippolyta.Collections.users.getOrFetch(seller_id);
    var indexView = new Hippolyta.Views.ProductsIndex({
      user: seller,
      collection: seller.products(),
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
    var seller = Hippolyta.Collections.users.getOrFetch(seller_id);
    var collection = seller.products();
    var product = collection.getOrFetch(id)
    var productShowView = new Hippolyta.Views.ProductShow({
      product: product
    });

    this._swapView(productShowView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
