Hippolyta.Routers.Router = Backbone.Router.extend({

  initialize: function (options) {
    Hippolyta.Collections.users.fetch();
    this.$rootEl = options.$rootEl
  },

  routes: {
    "users/:id": "usersShow",
    "users/:user_id/products": "productsIndex",
  },

  usersShow: function (id) {
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

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

});
