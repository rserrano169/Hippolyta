Hippolyta.Views.UserShow = Backbone.View.extend({

  template: JST["users/show"],

  events: {
    "click #user-image": "editPicture",
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({ user: this.model });
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
