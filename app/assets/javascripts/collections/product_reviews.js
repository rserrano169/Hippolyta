Hippolyta.Collections.ProductReviews = Backbone.Collection.extend ({
  url: "/api/users/:user_id/products/:product_id/reviews",

  model: Hippolyta.Models.ProductReview,
});

Hippolyta.Collections.productReviews = new Hippolyta.Collections.ProductReviews();
