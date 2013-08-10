# Helproku

Helproku is a gem to make it easier to set up a Ruby on Rails application on Heroku. It commands Rails to set up the Postgres and SQLite databases in the right way, creates a Github repository for you, a Heroku app for you, and uploads everything to that Github repository.

In future relases Helproku will be able to add features to your app wholesale. For example, running `rails generate helproku:mailers` should set up Sendgrid on Heroku and Letter Opener for local development without you needing to type a single character more.

## Installation

Add this line to your application's Gemfile:

    gem 'helproku'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install helproku

## Usage

Helproku is best used in conjunction with a Rails application template, which is available on this repsository.

    rails new [APP NAME] -m [LOCATION OF APPLICATION TEMPLATE]

You can alias this in .bash_profile to a command like `railsnew`, like such:

    railsnew(){
      rails new $1 -m [LOCATION OF APPLICATION TEMPLATE]
    }

which can then replace your `rails new` command.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
