Hippolyta.Views.UserEdit = Backbone.View.extend({

  template: JST["users/edit"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "change #upload-button": "selectProfilePic",
    "click #reset-picture": "render",
    "submit #upload-form": "submitProfilePic",
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

  submitProfilePic: function (event) {
    event.preventDefault();

    var $form = $(event.currentTarget),
      attr = $form.serializeJSON(),
      that = this;

    this.model.save(attr, {
      success: function () {
        that.collection.add(that.model, { merge: true });
        var $confirmation = $("<p>Your picture has been saved</p>");
        that.$("#upload-form").append($confirmation);
      },
    });
  },

  selectProfilePic: function (event) {
    var file = event.currentTarget.files[0],
        fileReader = new FileReader(),
        that = this;

    fileReader.onloadend = function () {
      that.model.set("picture", fileReader.result);
      that.$("#profile-pic").attr("src", fileReader.result);
    };

    fileReader.readAsDataURL(file);
  }

});
