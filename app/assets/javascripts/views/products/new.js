Hippolyta.Views.ProductNewForm = Backbone.View.extend({

  template: JST["products/new"],

  tagName: "form",

  events: {
    "submit": "submit",
    "change #input-picture-file": "changePicture",
  },

  render: function () {
    var content = this.template({ product: this.model });
    this.$el.html(content);
    return this;
  },

  submit: function () {
    console.log("Submit!");
  },

  changePicture: function () {

  },

});
