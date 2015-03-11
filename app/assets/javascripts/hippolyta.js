window.Hippolyta = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new Hippolyta.Routers.Router({
      $rootEl: $("#content"),
    });

    Backbone.history.start();
  }
};

// $(document).ready(function(){
//   Hippolyta.initialize();
// });
