Hippolyta.Views.ProductNewForm = Backbone.View.extend({

  template: JST["products/new"],

  events: {
    "submit #product-new-form": "submit",
    "change #input-picture-file": "choosePicture",
  },

  render: function () {
    var content = this.template({ product: this.model });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault();
    $("#product-new-form-button").prop("disabled", true);

    var attr = $("#product-new-form").serializeJSON(),
      that = this;

    this.model.save(attr,{
      success: function () {
        $("#product-new-form-button").prop("disabled", false);
        Backbone.history.navigate(
          "current_user/products",
          { trigger: true }
        );
      },
      error: function () {
        $("#product-new-form-button").prop("disabled", false);
        $("#product-new-form-errors").show();
      }
    });

    return false
  },

  choosePicture: function (event) {
    var file = event.currentTarget.files[0],
        fileReader = new FileReader(),
        that = this;

    fileReader.onloadend = function () {
      that.model.set("picture", fileReader.result);
      that.previewPic(fileReader.result);
    };

    if (file === undefined) {
        $("#picture-new-preview").hide();
    } else {
        fileReader.readAsDataURL(file);
    };
  },

  previewPic: function (src) {
    $("#picture-new-preview").attr("src", src);
    $("#picture-new-preview").show();
  },
});
