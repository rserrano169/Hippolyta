Hippolyta.Views.Checkout = Backbone.View.extend({

  template: JST["checkouts/checkout"],

  currentAddressTemplate: JST["checkouts/current_address"],

  shippingAddressesTemplate: JST["checkouts/shipping_addresses"],

  addAddressFormTemplate: JST["checkouts/address_form"],

  currentCardTemplate: JST["checkouts/current_card"],

  paymentMethodsTemplate: JST["checkouts/payment_methods"],

  addPaymentFormTemplate: JST["checkouts/payment_form"],

  cartItemsTemplate: JST["checkouts/cart_items"],

  currentCartUnitsTemplate: JST["checkouts/current_cart_units"],

  initialize: function (options) {
    this.cartItemsAlreadyRendered = false;
    this.addressesAlreadyRendered = false;
    this.currentAddressAlreadyRendered = false;
    this.areAddressOptionsSlidDown = false;
    this.isAddressFormAppended = false;
    this.noAddressesAdded = false;
    this.isCardFormAppended = false;
    this.cardsAlreadyRendered = false;
    this.noCardsAdded = false;
    this.arePaymentOptionsSlidDown = false;
    this.isCardFormOpen = false;
    this.isCartSlidDown = false;
    this.addresses = options.addresses;
    this.listenTo(this.addresses, "sync", this.renderAddresses);
    this.currentAddress = options.currentAddress;
    this.listenTo(this.currentAddress, "sync", this.renderCurrentAddress);
    this.listenTo(this.currentAddress, "error", this.renderAddressesError);
    this.cards = options.cards;
    this.listenTo(this.cards, "sync", this.renderCards);
    this.listenTo(this.cards, "error", this.renderCardsError);
    this.cart = options.cart;
    this.listenTo(this.cart, "sync", this.renderCartItems);
    this.cartProducts = options.cartProducts;
    this.products = options.products;
  },

  events: {
    "click #shipping-address-title": "slideDownAddressOptions",
    "click #current-address-clickable": "slideDownAddressOptions",
    "click #shipping-address-button": "slideDownAddressOptions",
    "click #shipping-address-title-dropped": "slideUpAddressOptions",
    "click #shipping-address-button-dropped": "slideUpAddressOptions",
    "click #shipping-add-first-address": "openAddressForm",
    "click #add-another-address": "openAddressForm",
    "click #add-address-form-insert-info": "insertTestAddressInfo",
    "click #payment-method-title": "slideDownPaymentOptions",
    "click #payment-method-button": "slideDownPaymentOptions",
    "click #payment-method-title-dropped": "slideUpPaymentOptions",
    "click #payment-method-button-dropped": "slideUpPaymentOptions",
    "click #payment-add-first-card": "openCardForm",
    "click #payment-add-card": "openCardForm",
    "click #add-card-form-insert-info": "insertTestCardInfo",
    "click .top-bar-x": "closeForms",
    "submit #add-card-form": "submitCard",
    "click #cart-items-title": "slideDownCartItems",
    "click #cart-items-button": "slideDownCartItems",
    "click #cart-items-title-dropped": "slideUpCart",
    "click #cart-items-button-dropped": "slideUpCart",
    // "submit .checkout-product-update-quantity": "updateQuantity",
  },

  render: function () {
    var content = this.template();

    this.$el.html(content);
    this.prependCsrfToken($("form"));

    if (this.cartItemsAlreadyRendered) {
      this.renderCartItems();
    };

    if (this.currentAddressAlreadyRendered) {
      this.renderCurrentAddress();
    };

    if (this.addressesAlreadyRendered) {
      this.renderAddresses();
    };

    if (this.cardsAlreadyRendered) {
      this.renderCards();
    };

    return this;
  },

  prependCsrfToken: function ($form) {
    var csrfToken = $("meta[name='csrf-token']").attr('content');
    $form.prepend(
      '<input type="hidden" name="authenticity_token" value="' +
      csrfToken +
      '">'
    );
  },

  renderAddresses: function () {
    var content = this.shippingAddressesTemplate({
      addresses: this.addresses,
      capitalize: this.capitalize,
    });

    $("#shipping-address-options").html(content);
    $("#shipping-address-form-button").prop("disabled", true);
    $("input:radio[name='addressId']").change(this.enableAddressSelect);

    this.prependCsrfToken($("#shipping-address-form"));

    this.addressesAlreadyRendered = true;
  },

  renderCards: function () {
    this.renderCurrentCard();

    var content = this.paymentMethodsTemplate({
      cards: this.cards,
      capitalize: this.capitalize,
    });

    $("#payment-method-options").html(content)
    $("#payment-method-form-button").prop("disabled", true);
    $("input:radio[name='cardId']").change(this.enableCardSelect);

    this.prependCsrfToken($("#payment-method-form"));

    this.cardsAlreadyRendered = true;
  },

  renderCartItems: function () {
    this.renderCurrentCartUnits();

    var content = this.cartItemsTemplate({
      cart: this.cart,
      cartProducts: this.cartProducts,
      products: this.products,
    });

    $("#checkout-products").html(content);
    this.prependCsrfToken($(".checkout-product-update-quantity"));
    this.insertCartTotals();

    this.cartItemsAlreadyRendered = true;
  },

  insertCartTotals: function () {
    var totalPrice = this.cart.escape("cart_total");

    $("#checkout-sidebar-items-quantity").html(
      this.cart.escape("cart_quantity")
    );
    $("#checkout-sidebar-items-price").html(totalPrice);
    $("#checkout-sidebar-items-subtotal").html(totalPrice);
    $("#checkout-total-price").html(totalPrice);
  },

  enableAddressSelect: function () {
    $("#shipping-address-form-button").prop("disabled", false);
  },

  enableCardSelect: function () {
    $("#payment-method-form-button").prop("disabled", false);
  },

  renderCurrentAddress: function () {
    console.log(this.capitalize(this.currentAddress.escape("name")));

    var content = this.currentAddressTemplate({
      address: this.currentAddress,
      capitalize: this.capitalize,
    });

    $("#shipping-address-current-selection").html(content);

    if (_.isEmpty(this.currentAddress.attributes)) {
      $("#shipping-address-button").html("Add an Address")

      this.noAddressesAdded = true;
    };

    this.currentAddressAlreadyRendered = true;
  },

  renderCurrentCard: function () {
    var content = this.currentCardTemplate({
      card: this.cards.currentCard,
    });
    $("#payment-method-current-selection").html(content);

    if (!this.cards.currentCard) {
      $("#payment-method-button").html("Add a Card")

      this.noCardsAdded = true;
    };
  },

  renderCurrentCartUnits: function () {
    var content = this.currentCartUnitsTemplate({
      units: this.cart.escape("cart_units"),
      price: this.cart.escape("cart_total"),
    });

    $("#cart-items-current-quantity").html(content);
  },

  renderAddressesError: function () {
    $("#shipping-address-current-selection").html(
      '<span id="error-loading-current-address-selection">' +
      'Unable to load address data. Reload to try again.' +
      '</span>'
    );

    $("#shipping-address-options").html(
      '<span id="error-loading-address-options">' +
      'We were unable to load your address data.' +
      'Please reload the page to try again.' +
      '</span>'
    );
  },

  renderCardsError: function () {
    $("#payment-method-current-selection").html(
      '<span id="error-loading-current-payment-selection">' +
      'Unable to load card data. Reload to try again.' +
      '</span>'
    );

    $("#payment-method-options").html(
      '<span id="error-loading-payment-options">' +
      'We were unable to load your card data.' +
      'Please reload the page to try again.' +
      '</span>'
    );
  },

  insertTestAddressInfo: function () {
    var testName = 'Test Address',
        testStreet = '123 Test Street',
        testApt = '1t',
        testCity = 'New Test City',
        testZip = '10001';

    $("input[name='address[name]']").prop("value", testName);
    $("input[name='address[street]']").prop("value", testStreet);
    $("input[name='address[apt]']").prop("value", testApt);
    $("input[name='address[city]']").prop("value", testCity);
    $("option[value='NY']").prop("selected", "selected");
    $("input[name='address[zip]']").prop("value", testZip);
  },

  insertTestCardInfo: function () {
    var testNumber = '4242424242424242',
        testCVC = '123',
        testName = 'Test Card',
        testExpMo = '01',
        testExpYr = '2020';

    $("input[data-stripe='number']").prop("data-stripe", testNumber);
    $("input[data-stripe='cvc']").prop("data-stripe", testCVC);
    $("input[data-stripe='name']").prop("data-stripe", testName);
    $("input[data-stripe='exp-month']").prop("data-stripe", testExpMo);
    $("input[data-stripe='exp-year']").prop("data-stripe", testExpYr);
  },

  slideDownAddressOptions: function () {
    this.slideUpAll();

    $("#shipping-address-step-number")
      .attr("id", "shipping-address-step-number-dropped");
    $("#shipping-address-title")
      .attr("id", "shipping-address-title-dropped")
      .html("Select Address");
    $("#current-address-clickable")
      .attr("id", "current-address-clickable-dropped");
    $("#shipping-address-button")
      .attr("id", "shipping-address-button-dropped")
      .html("Cancel");

    $("#shipping-address-options").slideDown("fast");

    this.areAddressOptionsSlidDown = true;
  },

  slideDownPaymentOptions: function () {
    this.slideUpAll();

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


  slideDownCartItems: function () {
    this.slideUpAll();

    $("#cart-items-step-number").attr("id", "cart-items-step-number-dropped");
    $("#cart-items-title")
      .attr("id", "cart-items-title-dropped")
      .html("Review Items");
    $("#cart-items-button").html("Close");
    $("#cart-items-button").attr("id", "cart-items-button-dropped");
    $("#checkout-products").slideDown("fast");

    this.isCartSlidDown = true;
  },

  slideUpAddressOptions: function () {
    if (this.noAddressesAdded === true) {
        $("#shipping-address-button-dropped")
          .html("Add an Address")
          .attr("id", "shipping-address-button");
    } else {
        $("#shipping-address-button-dropped")
          .html("Change Address")
          .attr("id", "shipping-address-button");
    };

    $("#shipping-address-step-number-dropped")
      .attr("id", "shipping-address-step-number");
    $("#shipping-address-title-dropped")
      .attr("id", "shipping-address-title")
      .html("Shipping Address");
    $("#current-address-clickable-dropped")
      .attr("id", "current-address-clickable");
    $("#shipping-address-button-dropped")
      .attr("id", "shipping-address-button")
      .html("Change Address");

    $("#shipping-address-options").slideUp("fast");

    this.areAddressOptionsSlidDown = false;
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

  slideUpCart: function () {
    $("#cart-items-step-number-dropped").attr("id", "cart-items-step-number");
    $("#cart-items-title-dropped")
      .attr("id", "cart-items-title")
      .html("Cart Items");
    $("#cart-items-button-dropped").html("View");
    $("#cart-items-button-dropped").attr("id", "cart-items-button");
    $("#checkout-products").slideUp("fast");

    this.isCartSlidDown = false;
  },

  slideUpAll: function () {
    if (this.areAddressOptionsSlidDown) {
      this.slideUpAddressOptions();
    };

    if (this.arePaymentOptionsSlidDown) {
      this.slideUpPaymentOptions();
    };

    if (this.isCartSlidDown) {
      this.slideUpCart();
    };
  },

  openAddressForm: function () {
    this.slideUpAll()

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    if (this.isAddressFormAppended === false) {
      $("#checkout-view").append(this.addAddressFormTemplate());
      this.prependCsrfToken($("#add-address-form"));

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

  openCardForm: function () {
    this.slideUpAll()

    var csrfToken = $("meta[name='csrf-token']").attr('content');
    if (this.isCardFormAppended === false) {
      $("#checkout-view").append(this.addPaymentFormTemplate());
      this.prependCsrfToken($("#add-card-form"));

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

  // updateQuantity: function (event) {
  //
  // },

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

  capitalize: function (string) {
    var words = [],
        wordsArray = string.split(/\s*(\W|-)\s*/);

    wordsArray.forEach( function (word) {
      if (word === '') {
        return;
      };
      words.push(word.charAt(0).toUpperCase() + word.toLowerCase().slice(1));
    })

    return words.join(' ');
  },
});
