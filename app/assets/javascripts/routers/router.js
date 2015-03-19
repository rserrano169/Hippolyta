Hippolyta.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    Hippolyta.Collections.users.fetch();
    this.$rootEl = options.$rootEl
  },

  routes: {
    "users/:id": "userShow",
    "users/:id/edit": "userEdit",
    "users/:user_id/products": "productsIndex",
    "products/new": "productsNew",
  },

  userShow: function (id) {
    var model = Hippolyta.Collections.users.getOrFetch(id);
    var showView = new Hippolyta.Views.UserShow({ model: model });
    this._swapView(showView);
  },

  productsIndex: function (user_id) {
    var user = Hippolyta.Collections.users.getOrFetch(user_id);
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

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
