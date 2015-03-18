Hippolyta.Views.UserEdit = Backbone.View.extend({

  template: JST["users/edit"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  },

  events: {
    "click #upload-form": "submitProfilePic",
  },

  render: function () {
    var content = this.template({ user: this.model });
    this.$el.html(content);
    return this;
  },

  submitProfilePic: function () {
    console.log($(event.target).parent());

    var attr = $(event.target).parent().serializeJSON(),
      that = this;

    this.model.save(attr, {
      success: function () {
        that.collection.add(that.model, { merge: true });
      },
    });
  },

});
