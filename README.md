# Underground

A website that allows user share youtube video and interact with each other. This is also a toy project I created for learning and testing.
I used to create new projects everytime I learn something new which makes my knowledge scatter. With this project, I could see more clearly how things intertwine.

Live demo on Heroku: [here](https://shrouded-spire-77353.herokuapp.com/)

## Run locally

Install and update nessessary gems. Install `ruby 2.6.3` if needed. It's recommended to use `rvm`.

```cmd
bundle update && bundle install
```

Set-up database. Install `psql` if needed.
Runtest to make sure everything works fine.

```cmd
rails db:create
rails db:migrate
rails db:migrate RAILS_ENV=test
rspec /spec
```

Finally, run the project. It is lived on `localhost:3000`.

```cmd
rails s
```

## Youtube API Key

We use Youtube data API v3 to get the video information. Read the [doc](https://developers.google.com/youtube/v3/docs/) for more clearance.
After getting the API key, run `bundle exec figaro install` and add the credential to the newly created file: `config/application.yml`
