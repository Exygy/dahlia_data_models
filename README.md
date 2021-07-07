# Dahlia Data Models

This gem provides a shared Rails engine consisting of ActiveRecord models used by the Regional DAHLIA websites ([admin repo](https://github.com/Exygy/dahlia-admin) / [listings repo](https://github.com/Exygy/dahlia-listings)).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dahlia_data_models', git: 'https://github.com/Exygy/dahlia_data_models.git'
```

(_Note: you can add `ref: 'xyz'` at the end of the line if you want to reference a specific commit hash._)

And then execute:

    $ bundle

If the app into which you're importing this gem is responsible for setting up the DAHLIA database, you'll need to import migrations to your app:

    rails g dahlia_data_models:install
    rails db:migrate

## Development Testing

Run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

## Migrations

When migration generators are added to `lib/generators`, you will need to cd into `spec/dummy` and run `rails g dahlia_data_models:install` so that the migrations are available for the rspec test suite.

## Releasing

_Note: this section is still under review._

To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/Exygy/dahlia_data_models.

## License

The gem is available as open source under the terms of the GNU General Public License v3 (see LICENSE.txt).
