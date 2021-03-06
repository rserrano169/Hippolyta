Hippolyta.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "current_user/profile": "currentUserProfile",
    "current_user/edit": "currentUserEdit",
    "current_user/products": "currentUserProducts",
    "products/new": "productsNew",
    "search_results": "searchResults",
    "sellers/:seller_id/products/:id": "productShow",
    "cart": "currentCartShow",
    "must_sign_in": "checkoutSignIn",
    "checkout": "checkout",
    "checkout_placed": "checkoutPlaced",
    "current_user/purchased_products": "currentUserPurchases",
    "new_review/current_user/purchased_products/:product_id": "addProductReview",
    "sellers/:seller_id/products/:product_id/review_created": "reviewCreated",
  },

  currentUserProfile: function () {
    Hippolyta.Models.currentUser.fetch();

    var model = Hippolyta.Models.currentUser,
        profileView = new Hippolyta.Views.CurrentUserProfile({ model: model, });

    this._swapView(profileView);
  },

  currentUserProducts: function () {
    Hippolyta.Collections.currentUserProducts.fetch();

    var collection = Hippolyta.Collections.currentUserProducts,
        productsView = new Hippolyta.Views.CurrentUserProducts({
          collection: collection,
        });

    this._swapView(productsView);
  },

  productsNew: function () {
    var model = new Hippolyta.Models.Product(),
        newView = new Hippolyta.Views.ProductNewForm({ model: model, });
    this._swapView(newView);
  },

  currentUserEdit: function () {
    Hippolyta.Models.currentUser.fetch();

    var model = Hippolyta.Models.currentUser,
        editView = new Hippolyta.Views.CurrentUserEdit({ model: model, });

    this._swapView(editView);
  },

  searchResults: function () {
    Hippolyta.Collections.searchResults.fetch();

    var collection = Hippolyta.Collections.searchResults,
        searchView = new Hippolyta.Views.SearchResults({
          collection: collection,
        });

    this._swapView(searchView);
  },

  productShow: function (seller_id, id) {
    Hippolyta.Collections.users.fetch();

    var users = Hippolyta.Collections.users,
        seller = users.getOrFetch(seller_id),
        collection = seller.products(),
        product = collection.getOrFetch(id),
        reviews = product.reviews(),
        productShowView = new Hippolyta.Views.ProductShow({
          users: users,
          seller: seller,
          product: product,
          reviews: reviews,
        });

    this._swapView(productShowView);
  },

  currentCartShow: function () {
    Hippolyta.Models.currentUserCart.fetch();

    var cart = Hippolyta.Models.currentUserCart,
        cartProducts = cart.cartProducts(),
        products = cart.products(),
        cartItemsView = new Hippolyta.Views.CartItems({
          cart: cart,
          cartProducts: cartProducts,
          products: products,
        });

    this._swapView(cartItemsView);
  },

  checkoutSignIn: function () {
    var signInView = new Hippolyta.Views.SignInBeforeCheckout();
    this._swapView(signInView);
  },

  checkout: function () {
    Hippolyta.Models.currentUserCurrentAddress.fetch();
    Hippolyta.Models.currentUserCart.fetch();
    Hippolyta.Collections.currentUserAddresses.fetch();
    Hippolyta.Collections.currentUserCards.fetch();

    var cart = Hippolyta.Models.currentUserCart,
        addresses = Hippolyta.Collections.currentUserAddresses,
        currentAddress = Hippolyta.Models.currentUserCurrentAddress,
        cards = Hippolyta.Collections.currentUserCards,
        cartProducts = cart.cartProducts(),
        products = cart.products(),
        checkoutView = new Hippolyta.Views.Checkout({
          cart: cart,
          cartProducts: cartProducts,
          products: products,
          addresses: addresses,
          currentAddress: currentAddress,
          cards: cards,
        });

    this._swapView(checkoutView);
  },

  checkoutPlaced: function () {
    var checkoutPlacedView = new Hippolyta.Views.CheckoutPlaced();
    this._swapView(checkoutPlacedView);
  },

  currentUserPurchases: function () {
    Hippolyta.Collections.currentUserPurchasedProducts.fetch();

    var purchasedProducts = Hippolyta.Collections.currentUserPurchasedProducts;
        purchasedProductsView = new Hippolyta.Views.CurrentUserPurchasedProducts({
          purchasedProducts: purchasedProducts,
        });

    this._swapView(purchasedProductsView);
  },

  addProductReview: function (product_id) {
    Hippolyta.Collections.currentUserPurchasedProducts.fetch();
    var purchasedProduct = Hippolyta
                            .Collections
                            .currentUserPurchasedProducts
                            .getOrFetch(product_id),
        newReviewView = new Hippolyta.Views.NewReview({
          purchasedProduct: purchasedProduct,
        });

    this._swapView(newReviewView);
  },

  reviewCreated: function (seller_id, product_id) {
    var reviewedProductSellerId = seller_id,
        reviewedProductId = product_id,
        reviewCreatedView = new Hippolyta.Views.ReviewCreated({
          reviewedProductSellerId: reviewedProductSellerId,
          reviewedProductId: reviewedProductId,
        });

    this._swapView(reviewCreatedView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
