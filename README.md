# Log4r::DateDirectoryFileOutputter

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/log4r/date_directory_file_outputter`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'log4r-date_directory_file_outputter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install log4r-date_directory_file_outputter

## Usage

```yaml
log4r_config:
# ...
  outputters:
    - type        : DateDirectoryFileOutputter
      name        : logfile
      level       : DEB
      file_path: '/var/log/%Y/%m/%d/request.log'
      trunc       : 'false'
      formatter   :
        date_pattern: '%y%m%d %H:%M:%S'
        pattern     : '%d %l: %m'
        type        : PatternFormatter
```

In this setting, the logs at 2018/01/23 is outputted in /var/log/2018/01/23/request.log directory.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/log4r-date_directory_file_outputter.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
