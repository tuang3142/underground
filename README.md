# Underground

Youtube is the most entertaining thing humanity has ever created. There are billions and billions and billions (invoke Trump bot) of hours of content. User this site to watch selectively. Good life you have lived, eh?

Live demo on Heroku: [here](https://shrouded-spire-77353.herokuapp.com/)

## Run locally

Clone this project.

```cmd
git clone git@github.com:daenylio/underground.git
cd /underground
```

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
After getting the API key, run `bundle exec figaro install` and add this to the newly created file: `config/application.yml`  

```
youtube_api_key: [YOUR_KEY]
```

Ok there might be more to write but I am dead numb. PRs are more than welcome tho!

# Todo

- [ ] Pagy
- [ ] Footer
- [ ] JavaScript for not reloading page
- [ ] More tests
