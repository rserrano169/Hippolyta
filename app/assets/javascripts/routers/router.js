Hippolyta.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "users/:user_id": "userShow",
    "users/:user_id/edit": "userEdit",
    "users/:seller_id/products": "productsIndex",
    "products/new": "productsNew",
    "search_results": "searchResults",
    "sellers/:seller_id/products/:id": "productShow",
    "carts/:cart_id": "cartShow",
  },

  userShow: function (user_id) {
    Hippolyta.Collections.users.fetch();
    var model = Hippolyta.Collections.users.getOrFetch(user_id);
    var showView = new Hippolyta.Views.UserShow({ model: model });
    this._swapView(showView);
  },

  productsIndex: function (seller_id) {
    Hippolyta.Collections.users.fetch();
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

  userEdit: function (user_id) {
    Hippolyta.Collections.users.fetch();
    var collection = Hippolyta.Collections.users
    var model = Hippolyta.Collections.users.getOrFetch(user_id);
    var editView = new Hippolyta.Views.UserEdit({
      model: model,
      collection: collection
    });
    this._swapView(editView);
  },

  searchResults: function () {
    Hippolyta.Collections.searchresults.fetch();
    var collection = Hippolyta.Collections.searchresults,
        searchView = new Hippolyta.Views.SearchResults({
          collection: collection,
        });
    console.log(collection);
    this._swapView(searchView);
  },

  productShow: function (seller_id, id) {
    Hippolyta.Collections.users.fetch();
    var seller = Hippolyta.Collections.users.getOrFetch(seller_id);
    var collection = seller.products();
    var product = collection.getOrFetch(id)
    var productShowView = new Hippolyta.Views.ProductShow({
      seller: seller,
      product: product
    });
    this._swapView(productShowView);
  },

  cartShow: function (cart_id) {
    var cart = new Hippolyta.Models.Cart({ id: cart_id });
    cart.fetch();
    var cartProducts = cart.cartProducts();
    var products = cart.products();
    var cartItemsView = new Hippolyta.Views.CartItems({
      cart: cart,
      cartProducts: cartProducts,
      products: products
    });
    this._swapView(cartItemsView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
