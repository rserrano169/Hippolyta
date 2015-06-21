Hippolyta.Collections.CurrentUserCards = Backbone.Collection.extend({
  url: 'api/current_user/cards',

  parse: function (response) {
    if (response.default_card) {
      this.defaultCard = response.default_card;
    };

    if (response.current_card) {
      this.currentCard = response.current_card;
    };

    response = response.all_cards;

    return response;
  },
});
