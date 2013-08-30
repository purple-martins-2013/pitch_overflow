==============
pitch_overflow

Eric Kristensen, Leslie Lai, Martino Visentin, Ishwar Nagar


# Configuring Omniauth
We are usng the dotenv gem to set the environment variables required by omniauth.
Omniauth requires these variables in the `/config/initializers/omniauth.rb` file.
These variables are defined in a file called `.env` in your root directory.
To avoid exposing the credentials to the world, the `.env` file is ignored by git.

To configure this:

1. Make a new file called `.env` in your application's root directory

2. Add the following lines to it

```ruby
github_id = 'blabberblabber'
github_secret = 'blabberblabber'
```

You should obtain this information from the github API.
