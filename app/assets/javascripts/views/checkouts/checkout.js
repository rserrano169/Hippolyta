Hippolyta.Views.Checkout = Backbone.View.extend({

  template1: JST["checkouts/checkout"],

  template2: JST["checkouts/cards"],

  initialize: function (options) {
    this.cardsAlreadyRendered = false;
    this.arePaymentOptionsSlidDown = false;
    this.isCardFormOpen = false;
    this.isCartSlidDown = false;
    this.cart = options.cart;
    this.listenTo(this.cart, "sync", this.render);
    this.cards = options.cards;
    this.listenTo(this.cards, "sync", this.renderCards);
    this.listenTo(this.cards, "error", this.renderCardsError);
    this.cartProducts = options.cartProducts;
    this.products = options.products;
    // this.user = options.user;
  },

  events: {
    "click #payment-method-title": "slideDownPaymentOptions",
    "click #payment-select-card-button": "slideDownPaymentOptions",
    "click #payment-method-title-dropped": "slideUpPaymentOptions",
    "click #payment-select-card-button-dropped": "slideUpPaymentOptions",
    "click #payment-add-first-card": "openCardForm",
    "click #payment-add-card": "openCardForm",
    "click .top-bar-x": "closeCardForm",
    "submit #add-card-form": "submitCard",
    "click #review-cart-title": "slideDownCart",
    "click #review-cart-button": "slideDownCart",
    "click #review-cart-title-dropped": "slideUpCart",
    "click #review-cart-button-dropped": "slideUpCart",
  },

  render: function () {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
        content = this.template1({
          cart: this.cart,
          cartProducts: this.cartProducts,
          products: this.products,
          // user: this.user,
        }),

    this.$el.html(content);

    $("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    if (this.cardsAlreadyRendered === false) {
        $("#payment-method-options").html(
          '<span id="loading-payment-options">' +
          'Loading...' +
          '</span>'
        );
    } else {
        this.renderCards();
    };

    return this;
  },

  renderCards: function () {
    var csrfToken = $("meta[name='csrf-token']").attr('content'),
        content = this.template2({
          cards: this.cards,
        });

    $("#payment-method-options").html(content)

    $("#payment-method-form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    this.cardsAlreadyRendered = true;
  },

  renderCardsError: function () {
    $("#payment-method-options").html(
      '<span id="error-loading-payment-options">' +
      'We were unable to load your card data. Please reload the page to try again.' +
      '</span>'
    );
  },

  slideDownPaymentOptions: function () {
    if (this.isCartSlidDown) {
      this.slideUpCart();
    };

    $("#payment-method-title")
      .attr("id", "payment-method-title-dropped")
      .html("Select Method");
    $("#payment-method").attr("id", "payment-method-dropped");
    $("#payment-select-card-button")
      .attr("id", "payment-select-card-button-dropped");
    $("#payment-method-options").slideDown("fast");
    this.arePaymentOptionsSlidDown = true;
  },

  slideUpPaymentOptions: function () {
    $("#payment-method-title-dropped")
      .attr("id", "payment-method-title")
      .html("Payment Method");
    $("#payment-method-dropped").attr("id", "payment-method");
    $("#payment-select-card-button-dropped")
      .attr("id", "payment-select-card-button");
    $("#payment-method-options").slideUp("fast");
    this.arePaymentOptionsSlidDown = false;
  },

  openCardForm: function () {
    if (this.isCartSlidDown) {
      this.slideUpCart();
    };

    if (this.arePaymentOptionsSlidDown) {
      this.slideUpPaymentOptions();
    };

    this.adjustCardFormPosition();
    $(window).on("scroll", this.adjustCardFormPosition.bind(this));
    $(window).on("resize", this.adjustCardFormPosition.bind(this));
    $(window).on("keydown", this.handleKeyEvent.bind(this));

    $("#add-card-form-overlay").show();
  },

  adjustCardFormPosition: function () {
    this.adjustCardFormModalSize();

    if ($(window).height() > $("#add-card-modal").height() + 2) {
        this.adjustCardFormIndentTop();
    } else {
        $("#add-card-modal").css("top", 0);
    };

    if ($(window).width() > $("#add-card-modal").width() + 2) {
        this.adjustCardFormIndentLeft();
    } else {
        $("#add-card-modal").css("left", 0);
    };
  },

  adjustCardFormIndentTop: function () {
    var modalHeight = $("#add-card-modal").height() + 2,
        topScroll = $(window).scrollTop(),
        topIndent = ($(window).height() - modalHeight) / 2,
        totalTop = topIndent + topScroll + "px";
    $("#add-card-modal").css({top: totalTop});

  },

  adjustCardFormIndentLeft: function () {
    var modalWidth = $("#add-card-modal").width() + 2,
        leftScroll = $(window).scrollLeft(),
        leftIndent = ($(window).width() - modalWidth) / 2,
        totalLeft = leftIndent + leftScroll + "px";
    $("#add-card-modal").css({left: totalLeft});
  },

  adjustCardFormModalSize: function () {
    var htmlHeight = $("html").height(),
        htmlWidth = $("html").width(),
        totalHeight = "",
        totalWidth = "";
    if (htmlHeight < $(window).height()) {
        totalHeight = $(window).height();
    } else {
        totalHeight = htmlHeight + "px";
    };
    if (htmlWidth < $(window).width()) {
        totalWidth = $(window).width();
    } else {
        totalWidth = htmlWidth + "px";
    };

    $("#add-card-form-overlay").height(totalHeight);
    $("#add-card-form-overlay").width(totalWidth);
  },

  handleKeyEvent: function (event) {
    if (event.keyCode === 27) {
      event.preventDefault();
      this.closeCardForm();
    };
  },

  closeCardForm: function () {
    $(window).off("resize scroll");
    $(window).off("keydown");
    $("#add-card-form-overlay").hide();
  },

  submitCard: function () {
    $("#add-card-form").find("button").prop("disabled", true);

    Stripe.card.createToken(
      $("#add-card-form"),
      this.stripeAppendCardToken.bind(this)
    );

    return false;
  },

  stripeAppendCardToken: function (status, response) {
    var $form = $("#add-card-form");

    if (response.error) {
      $form.find(".payment-errors").text(response.error.message);
      $form.find("button").prop("disabled", false);
    } else {
      var token = response.id;
      $form.append($('<input type="hidden" name="stripeToken"/>').val(token));
      $form.get(0).submit();
    };
  },

  slideDownCart: function () {
    if (this.arePaymentOptionsSlidDown) {
      this.slideUpPaymentOptions();
    };

    $("#review-cart-title")
      .attr("id", "review-cart-title-dropped")
      .html("Review Items");
    $("#review-cart").attr("id", "review-cart-dropped");
    $("#review-cart-button").html("Close");
    $("#review-cart-button").attr("id", "review-cart-button-dropped");
    $("#checkout-products").slideDown("fast");
    this.isCartSlidDown = true;
  },

  slideUpCart: function () {
    $("#review-cart-title-dropped")
      .attr("id", "review-cart-title")
      .html("Cart Items");
    $("#review-cart-dropped").attr("id", "review-cart");
    $("#review-cart-button-dropped").html("View");
    $("#review-cart-button-dropped").attr("id", "review-cart-button");
    $("#checkout-products").slideUp("fast");
    this.isCartSlidDown = false;
  },
});
