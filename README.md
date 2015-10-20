React-Rails
===========


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
