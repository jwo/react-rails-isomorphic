App.slidesNotification = App.cable.subscriptions.create("SlidesChannel", {
  connected: function() {},

  advanceSlide: function(data) {
    // tell action-cable rails to execute something
    return this.perform('slides', data);
  },
  
  received: function(data) {
    // ok, set all slides to it
    return Reveal.slide(data.indexh, data.indexv, data.indexf);
  }
});
