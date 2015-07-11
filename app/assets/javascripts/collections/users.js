Hippolyta.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",
  // comparator: "name",
  model: Hippolyta.Models.User,

  getOrFetch: function (id) {
    var user = this.get(id),
        users = this;

    if (!user) {
      user = new Hippolyta.Models.User({ id: id });
      user.fetch({
        success: function () {
          users.add(user);
        },
      });
    } else {
      user.fetch();
    }

    return user;
  },
});

Hippolyta.Collections.users = new Hippolyta.Collections.Users();
