Hippolyta.Views.CurrentUserShow = Backbone.View.extend({

  template: JST["current_users/show"],

  events: {
    "click #user-image": "editPicture",
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({ currentUser: this.model });
    this.$el.html(content);
    return this;
  },

  editPicture: function () {
    Backbone.history.navigate(
      "users/" + this.model.id + "/edit",
      { trigger: true }
    );
  },
});
