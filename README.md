Twitter Local Guide
===================
[![Build Status](https://travis-ci.org/emmabeynon/twitter_local_guide.svg?branch=master)](https://travis-ci.org/emmabeynon/twitter_local_guide)
[![Coverage Status](https://coveralls.io/repos/github/emmabeynon/twitter_local_guide/badge.svg?branch=master)](https://coveralls.io/github/emmabeynon/twitter_local_guide?branch=master)

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

As a user
So that I can see tweets from local accounts that I know already
I would like to add a Twitter account to the app
```

Instructions
------------
You can find a deployed version of this app at http://se23-local-guide.herokuapp.com/
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

Technologies used
-----------------
* Rails
* Ruby
* PostgreSQL
* Twitter API
* HAML
* Bootstrap
* RSpec
* Capybara

Approach
---------
For this project I decided to start by compiling a list of Twitter accounts whose tweets I would want to display in the app.  I created a form for users to input a Twitter account username and select a category for the account.  This category acts as a filter to only display  tweets from accounts whose category matches the one that user has selected.  I added validations to ensure that duplicate accounts, blank usernames and usernames more than 15 characters (Twitter's max username limit) weren't added.  In future, I would like to find a way to verify that the username exists on Twitter.  The accounts are saved to a PostgreSQL database and loaded by the controller when the page loads.

Next I looked at displaying each account's tweets.  I used the Twitter Ruby gem as an interface to the Twitter API so that I could load the last 20 tweets for each account.  After the tweets have been loaded, they are sorted in descending chronological order and are ready to be displayed in the view.  As an alternative approach, I could have used a database to store the tweets instead of hitting the Twitter API every time the page loads.

Now that I could retrieve tweets, I wanted to display them by category.  I initially attempted this by creating routes for each category, however I then realised I could make use of the pre-generated Rails routes.  Using the id param at the end of the URI (e.g. '/tweets/eating_out') for each category, the app can load only the accounts that belong to that category and subsequently only the tweets from those accounts.  This each time the user navigates to a category page.

This project was test-driven using RSpec for the unit and controller tests, and RSpec/Capybara for the feature tests.  

Screenshots
------------
![Eating out](http://i.imgur.com/b1pupDv.png)

Further Work
-------------
* Check if twitter accounts exist before adding to database
* Format tweet text to display special characters correctly
* Format links in tweets to link properly
* Format hashtags to link through to Twitter hashtag search
* Format mentions in tweets to link through to user's twitter page
