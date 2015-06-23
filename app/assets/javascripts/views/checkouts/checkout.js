Hippolyta.Views.Checkout = Backbone.View.extend({

  template: JST["checkouts/checkout"],

  shippingAddressesTemplate: JST["checkouts/shipping_addresses"],

  addressFormTemplate: JST["checkouts/address_form"],

  paymentMethodsTemplate: JST["checkouts/payment_methods"],

  paymentFormTemplate: JST["checkouts/payment_form"],

  initialize: function (options) {
    this.addressesAlreadyRendered = false;
    this.areAddressOptionsSlidDown = false;
    this.isAddressFormAppended = false;
    this.isCardFormAppended = false;
    this.cardsAlreadyRendered = false;
    this.noCardsAdded = false;
    this.arePaymentOptionsSlidDown = false;
    this.isCardFormOpen = false;
    this.isCartSlidDown = false;
    this.cart = options.cart;
    this.listenTo(this.cart, "sync", this.render);
    this.addresses = options.addresses;
    this.listenTo(this.addresses, "sync", this.renderAddresses);
    this.cards = options.cards;
    this.listenTo(this.cards, "sync", this.renderCards);
    this.listenTo(this.cards, "error", this.renderCardsError);
    this.cartProducts = options.cartProducts;
    this.products = options.products;
  },

  events: {
    "click #shipping-address-title": "slideDownShippingAdresses",
    "click #shipping-address-button": "slideDownShippingAdresses",
    "click #shipping-address-title-dropped": "slideUpShippingAdresses",
    "click #shipping-address-button-dropped": "slideUpShippingAdresses",
    // "click #shipping-address-button": "openAddressForm",
    "click #payment-method-title": "slideDownPaymentOptions",
    "click #payment-method-button": "slideDownPaymentOptions",
    "click #payment-method-title-dropped": "slideUpPaymentOptions",
    "click #payment-method-button-dropped": "slideUpPaymentOptions",
    "click #payment-add-first-card": "openCardForm",
    "click #payment-add-card": "openCardForm",
    "click .top-bar-x": "closeForms",
    "submit #add-card-form": "submitCard",
    "click #review-cart-title": "slideDownCart",
    "click #review-cart-button": "slideDownCart",
    "click #review-cart-title-dropped": "slideUpCart",
    "click #review-cart-button-dropped": "slideUpCart",
  },

  render: function () {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
        content = this.template({
          cart: this.cart,
          cartProducts: this.cartProducts,
          products: this.products,
        }),

    this.$el.html(content);

    $("form").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    $("#payment-method-current-selection").html(
      '<span id="loading-payment-current-selection">' +
      'Loading...' +
      '</span>'
    );

    $("#payment-method-options").html(
      '<span id="loading-payment-options">' +
      'Loading...' +
      '</span>'
    );

    // if (this.addressesAlreadyRendered === true) {
      this.renderAddresses();
    // };

    if (this.cardsAlreadyRendered === true) {
      this.renderCards();
    };

    return this;
  },

  renderAddresses: function () {
    // this.renderCurrentAddress()

    var csrfToken = $("meta[name='csrf-token']").attr('content'),
        content = this.shippingAddressesTemplate({
          addresses: this.addresses,
        });
    $("#shipping-address-options").html(content)
    $("#shipping-address-options").prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );

    this.addressesAlreadyRendered = true;
  },

  renderCards: function () {
    this.renderCurrentCard();

    var csrfToken = $("meta[name='csrf-token']").attr('content'),
        content = this.paymentMethodsTemplate({
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

  renderCurrentCard: function () {
    if (this.cards.currentCard !== undefined) {
        var card = this.cards.currentCard;

        $("#payment-method-current-selection").html(
          '<span id="current-card-brand">' +
          card.brand +
          '</span>' +
          '<span id="current-card-last4">' +
          ' ending in ' +
          '<span id="current-card-number">' +
          card.last4 +
          '</span>' +
          '</span>'
        );
    } else {
        $("#payment-method-current-selection").html(
          '<span id="loading-payment-current-selection">' +
          "You haven't added any credit or debit cards yet." +
          '</span>'
        );
        $("#payment-method-button").html("Add a card")

        this.noCardsAdded = true;
    };
  },

  renderCardsError: function () {
    $("#payment-method-current-selection").html(
      '<span id="error-loading-current-payment-selection">' +
      'Unable to load card data. Reload to try again.' +
      '</span>'
    );

    $("#payment-method-options").html(
      '<span id="error-loading-payment-options">' +
      'We were unable to load your card data. Please reload the page to try again.' +
      '</span>'
    );
  },

  slideDownShippingAdresses: function () {
    this.slideUpAll();

    $("#shipping-address-step-number")
      .attr("id", "shipping-address-step-number-dropped");
    $("#shipping-address-title")
      .attr("id", "shipping-address-title-dropped")
      .html("Select Address");
    $("#shipping-address-button")
      .attr("id", "shipping-address-button-dropped")
      .html("Cancel");

    $("#shipping-address-options").slideDown("fast");

    this.areAddressOptionsSlidDown = true;
  },

  slideUpShippingAdresses: function () {
    $("#shipping-address-step-number-dropped")
      .attr("id", "shipping-address-step-number");
    $("#shipping-address-title-dropped")
      .attr("id", "shipping-address-title")
      .html("Shipping Address");
    $("#shipping-address-button-dropped")
      .attr("id", "shipping-address-button")
      .html("Change Address");

    $("#shipping-address-options").slideUp("fast");

    this.areAddressOptionsSlidDown = false;
  },

  openAddressForm: function () {
    this.slideUpAll()

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    if (this.isAddressFormAppended === false) {
      $("#checkout-view").append(this.addressFormTemplate());
      $("#add-address-form").prepend(
        '<input type="hidden" name="authenticity_token" value="' +
        csrfToken +
        '">'
      );
      this.isAddressFormAppended = true;
    };

    var $form = $("#add-address-modal"),
        $formOverlay = $("#add-address-form-overlay");
    this.adjustFormPosition($form, $formOverlay)
    $(window).on("scroll", this.adjustFormPosition.bind(this, $form, $formOverlay));
    $(window).on("resize", this.adjustFormPosition.bind(this, $form, $formOverlay));
    $(window).on("keydown", this.handleKeyEvent.bind(this));

    $("#add-address-form-overlay").show();
  },

  slideDownPaymentOptions: function () {
    if (this.isCartSlidDown) {
      this.slideUpCart();
    };

    $("#payment-method-step-number")
      .attr("id", "payment-method-step-number-dropped");
    $("#payment-method-title")
      .attr("id", "payment-method-title-dropped")
      .html("Select Method");
    $("#payment-method-button")
      .html("Cancel")
      .attr("id", "payment-method-button-dropped");

    $("#payment-method-options").slideDown("fast");

    this.arePaymentOptionsSlidDown = true;
  },

  slideUpPaymentOptions: function () {
    if (this.noCardsAdded === true) {
        $("#payment-method-button-dropped")
          .html("Add a card")
          .attr("id", "payment-method-button");
    } else {
        $("#payment-method-button-dropped")
          .html("Change Card")
          .attr("id", "payment-method-button");
    };

    $("#payment-method-step-number-dropped")
      .attr("id", "payment-method-step-number");
    $("#payment-method-title-dropped")
      .attr("id", "payment-method-title")
      .html("Payment Method");

    $("#payment-method-options").slideUp("fast");

    this.arePaymentOptionsSlidDown = false;
  },

  openCardForm: function () {
    this.slideUpAll()

    if (this.isCardFormAppended === false) {
      $("#checkout-view").append(this.paymentFormTemplate());
      $("#add-card-form").prepend(
        '<input type="hidden" name="authenticity_token" value="' +
        csrfToken +
        '">'
      );
      this.isCardFormAppended = true;
    };

    var $form = $("#add-card-modal"),
        $formOverlay = $("#add-card-form-overlay");
    this.adjustFormPosition($form, $formOverlay)
    $(window).on("scroll", this.adjustFormPosition.bind(this, $form, $formOverlay));
    $(window).on("resize", this.adjustFormPosition.bind(this, $form, $formOverlay));
    $(window).on("keydown", this.handleKeyEvent.bind(this));

    $("#add-card-form-overlay").show();
  },

  adjustFormPosition: function ($form, $formOverlay) {
    this.adjustFormOverlaySize($formOverlay);

    if ($(window).height() > $form.height() + 2) {
        this.adjustFormIndentTop($form);
    } else {
        $form.css("top", 0);
    };

    if ($(window).width() > $form.width() + 2) {
      this.adjustFormIndentLeft($form);
    } else {
        $form.css("left", 0);
    };
  },

  adjustFormIndentTop: function ($form) {
    var modalHeight = $form.height() + 2,
        topScroll = $(window).scrollTop(),
        topIndent = ($(window).height() - modalHeight) / 2,
        totalTop = topIndent + topScroll + "px";
    $form.css({top: totalTop});
  },

  adjustFormIndentLeft: function ($form) {
    var modalWidth = $form.width() + 2,
        leftScroll = $(window).scrollLeft(),
        leftIndent = ($(window).width() - modalWidth) / 2,
        totalLeft = leftIndent + leftScroll + "px";
    $form.css({left: totalLeft});
  },

  adjustFormOverlaySize: function ($formOverlay) {
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

    $formOverlay.height(totalHeight);
    $formOverlay.width(totalWidth);
  },

  handleKeyEvent: function (event) {
    if (event.keyCode === 27) {
      event.preventDefault();
      this.closeForms();
    };
  },

  closeForms: function () {
    $(window).off("resize scroll");
    $(window).off("keydown");
    $("#add-card-form-overlay").hide();
    $("#add-address-form-overlay").hide()
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

  slideUpAll: function () {
    if (this.isCartSlidDown) {
      this.slideUpCart();
    };

    if (this.arePaymentOptionsSlidDown) {
      this.slideUpPaymentOptions();
    };
  },
});
