Twitter Local Guide
===================

Author: Emma Beynon

Github: https://github.com/emmabeynon

Email: emma.beynon@gmail.com

Problem Statement
-----------------
"I know that Twitter is the best place to find out about what's going on in my local area, but there are so many tweets that I find it hard to find exactly what I want to know"

User stories
-------------
I created the following user stories based on the problem statement:

```
As a user
So that I can find out what's going on locally
I would like to see only tweets from my local area

As a user
So that I can choose somewhere to go out to eat
I would like to see tweets from restaurants and cafes only

As a user
So that I can choose somewhere to go for a drink
I would like to see tweets from pubs and bars only

As a user
So that I can choose somewhere to go to enjoy some culture
I would like to see tweets from museums, galleries and theatres only

As a user
So that I can do my shopping locally
I would like to see tweets from shops only
```

Instructions
------------
To create your own version:

* Fork this repo and clone to your local machine.
* Create the databases and migrate
```
$ bin/rake db:create
$ bin/rake db:migrate
```
* Launch the rails server
```
$ bin/rails s
```
* Navigate to `http://localhost:3000` in your browser.

Approach
---------


Screenshots
------------


Further Work
-------------