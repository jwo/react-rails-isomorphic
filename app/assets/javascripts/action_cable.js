#= require cable

this.App = {};

App.cable = Cable.createConsumer("ws://localhost:28080");
