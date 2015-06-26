Hippolyta.Views.CurrentUserEdit = Backbone.View.extend({

  template: JST["current_users/edit"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "change #current-user-edit-choose-button": "selectProfilePic",
    "click #current-user-reset-picture": "render",
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    this.$("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    return this;
  },

  selectProfilePic: function (event) {
    var file = event.currentTarget.files[0],
        fileReader = new FileReader(),
        that = this;

    fileReader.onloadend = function () {
      $("#current-user-edit-profile-pic").attr("src", fileReader.result);
    };

    if (file === undefined) {
      this.render();
    } else {
      fileReader.readAsDataURL(file);
    };
  }

});
