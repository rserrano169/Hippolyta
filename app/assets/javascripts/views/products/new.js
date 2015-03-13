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

  submit: function (event) {
    event.preventDefault();

    var attr = this.$el.serializeJSON(),
      that = this;

    this.model.save(attr,{
      success: function () {
        console.log(that.model);
        // that.collection.add(that.model);
        Backbone.history.navigate(
          "users/" + that.model.seller_id + "/products",
          { trigger: true }
        );
      },
    });
  },

  changePicture: function () {
    var file = event.currentTarget.files[0],
      fileReader = newFileReader(),
      that = this;

    fileReader.onloadend = function () {
      that.model.set("picture", fileReader.result);
      that.previewPic(fileReader.results);
    };

    fileReader.readAsDataURL(file);
  },

  previewPic: function (src) {
    this.$("#picture-preview").attr("src", src);
  },
});
