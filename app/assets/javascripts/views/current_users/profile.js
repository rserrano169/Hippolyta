Hippolyta.Views.CurrentUserProfile = Backbone.View.extend({

  template: JST["current_users/profile"],

  events: {
    // "click #private-profile-header-image": "editPicture",
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  render: function () {
    var content = this.template({
      currentUser: this.model,
      dateString: this.dateString,
    });
    this.$el.html(content);
    return this;
  },

  // editPicture: function () {
  //   Backbone.history.navigate(
  //     "users/" + this.model.id + "/edit",
  //     { trigger: true }
  //   );
  // },

  dateString: function (dateObj) {
    return (dateObj + '').slice(0, 15);
  },
});
