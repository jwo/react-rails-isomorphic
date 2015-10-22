React-Rails
===========

>React (which is obvs so hot right now) is hot; It is also a pretty cool view
>layer, but you have to adopt the entire JS stack to make use of it. OR WAIT, DO
>YOU!?!?!?!
>
>Let's look at how we can use the Rails asset pipeline, JSON APIs, pre-rendering,
>and React to build isomorphic rails apps that rule.
>
>We'll start with a quick intro to React, and then get inside Rails to pre-render
>and render React on the server.
>
>I (JWo) don't say this often, but this is a _compelling_ technology stack.

<a href="https://speakerdeck.com/jwo/react-rails-an-isomorphic-match-made-in-heaven">
![slides](speakerdeck.jpg)
</a>

[View Slides on SpeakerDeck](https://speakerdeck.com/jwo/react-rails-an-isomorphic-match-made-in-heaven)


To Start it up, each in their own terminal session:

```
bundle exec rails server 
bundle exec puma -p 28080 cable/config.ru
rake votes
```

* The rake task pushed out the last 300 seconds of votes (average of 1 to 100)

TODO:

1. Works locally, but not on heroku
   (`app/assets/javascripts/action_cable.coffee` is hard-coded to localhost)
1. Redis may not work in production
1. Create a procfile that works on heroku

-or-

1. Create a dockerfile

LICENSE
=======

Copyright 2015 Jesse Wolgamott, All Rights Reserved

