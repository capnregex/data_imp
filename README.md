# Data Imp Porter

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'data_imp'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install data_imp

## Usage

The use of this gem requires that you define an 'importer' for your files. 

the fields from your data will be available to the importer as if they were local variables. 
```ruby
class SampleImporter < DataImp::Porter
  def import
    User.create_with(
      name: name,
    ).find_or_create_by(
      email: email
    )
  end
end
```

If you had your users in a csv file like

```csv
name,email
George,george@example.com
Fred,fred@example.net
```

You could then use
```ruby
DataImp.import 'user.csv'
```

If you had your users in a yaml file like

```yaml
---
- name: George
  email: george@example.com
- name: Fred
  email: fred@example.net
```

You could then use
```ruby
DataImp.import 'user.yaml'
```

The same importer would be used for either example. 

The importer is looked up by the base name, or provided by the `importer:` parameter. . 'user' in this case. 

Parsing of the file is done by a Parser class and is looked up by the file extension, or the `parser:` parameter. 

Pre defined parsers are located in the lib/data_imp/parsers/ folder

If you need to write your own, define it as 'class ExtParser < DataImp::Parser' to create or override the 'ext' extension parser. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/data-porter. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Data::Porter project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/data-porter/blob/master/CODE_OF_CONDUCT.md).
