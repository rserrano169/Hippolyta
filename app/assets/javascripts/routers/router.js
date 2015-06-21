Hippolyta.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "current_user/profile": "currentUserProfile",
    "users/:user_id/edit": "userEdit",
    "current_user/products": "currentUserProducts",
    "products/new": "productsNew",
    "search_results": "searchResults",
    "sellers/:seller_id/products/:id": "productShow",
    "cart": "currentCartShow",
    "must_sign_in": "checkoutSignIn",
    "checkout": "checkout",
    "checkout_placed": "checkoutPlaced",
  },

  currentUserProfile: function () {
    var model = new Hippolyta.Models.CurrentUser();
    model.fetch();
    var profileView = new Hippolyta.Views.CurrentUserProfile({ model: model });
    this._swapView(profileView);
  },

  currentUserProducts: function () {
    var collection = new Hippolyta.Collections.CurrentUserProducts();
    collection.fetch();
    var productsView = new Hippolyta.Views.CurrentUserProducts({
      collection: collection,
    });
    this._swapView(productsView);
  },

  productsNew: function () {
    var model = new Hippolyta.Models.Product(),
        newView = new Hippolyta.Views.ProductNewForm({ model: model, });
    this._swapView(newView);
  },

  userEdit: function (user_id) {
    Hippolyta.Collections.users.fetch();
    var collection = Hippolyta.Collections.users,
        model = Hippolyta.Collections.users.getOrFetch(user_id),
        editView = new Hippolyta.Views.UserEdit({
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
    this._swapView(searchView);
  },

  productShow: function (seller_id, id) {
    Hippolyta.Collections.users.fetch();
    var seller = Hippolyta.Collections.users.getOrFetch(seller_id),
        collection = seller.products(),
        product = collection.getOrFetch(id),
        productShowView = new Hippolyta.Views.ProductShow({
          seller: seller,
          product: product
        });
    this._swapView(productShowView);
  },

  currentCartShow: function () {
    var cart = new Hippolyta.Models.CurrentUserCart();
    cart.fetch();
    var cartProducts = cart.cartProducts(),
        products = cart.products(),
        cartItemsView = new Hippolyta.Views.CartItems({
          cart: cart,
          cartProducts: cartProducts,
          products: products
        });
    this._swapView(cartItemsView);
  },

  checkoutSignIn: function () {
    var signInView = new Hippolyta.Views.SignInBeforeCheckout({});
    this._swapView(signInView);
  },

  checkout: function () {
    var cart = new Hippolyta.Models.CurrentUserCart(),
        cards = new Hippolyta.Collections.CurrentUserCards();
    cart.fetch();
    cards.fetch();
    var cartProducts = cart.cartProducts(),
        products = cart.products(),
        checkoutView = new Hippolyta.Views.Checkout({
          cart: cart,
          cartProducts: cartProducts,
          products: products,
          cards: cards,
        });
    this._swapView(checkoutView);
  },

  checkoutPlaced: function () {
    var checkoutPlacedView = new Hippolyta.Views.CheckoutPlaced();
    this._swapView(checkoutPlacedView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
