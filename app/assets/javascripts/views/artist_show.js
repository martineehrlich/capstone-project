CapstoneProject.Views.ArtistShow = Backbone.CompositeView.extend({
  template: JST["artists/artist_show"],

  initialize: function (options) {
    this.artist = options.artist;
    this.addArtworkIndexView();
    this.listenTo(this.artist, "sync", this.render);
    // this.listenTo(this.collection, 'add', this.addArtistItemView);
    // this.collection.each(this.addArtistItemView.bind(this));
  },

  render: function () {
    var content = this.template({artist: this.artist});
    this.$el.html(content);
    this.attachSubviews();
    return this;
  },

  addArtworkIndexView: function () {
    var subview = new CapstoneProject.Views.ArtworkIndex({ collection: this.artist.arts });
    this.addSubview('.artist', subview);
  }

});
