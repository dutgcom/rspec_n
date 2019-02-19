# rspec_n

rspec_n is a Ruby gem that makes it easy to run a project's RSpec test suite N times.  You can customize the command that is used to start RSpec, or let rspec_n guess the best command (based on the files in your project).  rspec_n is useful for finding repeatability or flakiness issues in automated test suites.

![sample](https://user-images.githubusercontent.com/2053901/52986788-d0bb7c80-33c6-11e9-9f13-0e191bdd2bb3.png)

## Installation

Install by executing

    $ gem install rspec_n

The gem will install an exectuable called `rspec_n` on your system.

## Usage

To run RSpec N times

    $ rspec_n N

If your project has a `bin/start_rspec` file, rspec_n will invoke it to start RSpec (rspec_n assumes you have placed the necessary commands to cleanly start your test suite in that file). Otherwise, it will attempt to identify your project type and use best practices to start RSpec for your given project type.  The following is a list of project types supported by rspec_n, and the commands used when that project type is selected:

1. Ruby on Rails - `DISABLE_DATABASE_ENVIRONMENT_CHECK=1 RAILS_ENV=test bundle exec rake db:drop db:create db:migrate && bundle exec rspec`.

If it cannot guess a project type, rspec_n will invoke `bundle exec rspec`.  You can override this by specifying a command directly on the CLI.

#### Use Custom Command to Start RSpec

By default, rspec_n will inspect the files in your project and pick the best way to start RSpec.  You can take control by using the `-c` option which lets you specify a custom command.  The following example deletes the `tmp` folder before starting RSpec:

    $ rspec_n 5 -c 'rm -rf tmp && bundle exec rspec'

You must wrap your entire command string in single or double quotes if it contains spaces (which it probably will). This command will be invoked each time rspec_n attempts to start RSpec.

#### Control spec Order

rspec_n provides three command line options for controlling the execution order of your specs.

1. `--order rand`    - Passes `--order rand` to RSpec which causes RSpec to run your specs in a random order.
1. `--order defined` - Passes `--order defined` to RSpec which causes RSpec to run your specs in the order that they are loaded by RSpec.
1. `--order project` - Passes nothing to RSpec, which means the project configuration files will determine the order.

If you do nothing, rspec_n will use `--order rand`.  This ensures the specs in your project are executed in random order for each iteration of RSpec.  rspec_n doesn't supply a seed when it start RSpec using a random strategy; it lets RSpec choose the seed and reports the values in the results.

#### Control File Ouput

rspec_n writes output for each iteration in a sequence of files `rspec_n_iteration.1`, `rspec_n_iteration.2`, etc...  This saves you from having to rerun your test suite when you find a particular seed that causes your test suite to fail.  If you want to disable this, add the `--no-file` option to the command.

**Note:** rspec_n deletes all files matching `rspec_n_iteration.*` when it starts so you must move those files to another location if you want to save them.

#### Stop on First Failure

You can tell rspec_n to abort when an iteration fails by using the `-s` flag.  Any remaining iterations will be skipped.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for a Pry console, or `rake console` for an IRB console, that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/roberts1000/rspec_n.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
