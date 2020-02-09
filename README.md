# My::Congress

Welcome to My Congress! This gem prompts the user for an address
and returns the current U.S. Senators and Congressional representatives
for that location. It also has an option for looking up the upcoming
elections in that state, viewing current political headlines,
and seeing upcoming Senate and House Bills.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'my-congress'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install my-congress

My Congress requires ChromeDriver for some features. Please read installation instructions below:

ChromeDriver is a separate executable that Selenium WebDriver uses to control Chrome. It is maintained by the Chromium team with help from WebDriver contributors. If you are unfamiliar with Selenium WebDriver, you should check out the Selenium site.

Follow these steps to setup your tests for running with ChromeDriver:

Ensure Chromium/Google Chrome is installed in a recognized location
ChromeDriver expects you to have Chrome installed in the default location for your platform. You can also force ChromeDriver to use a custom location by setting a special capability.
Download the ChromeDriver binary for your platform at https://chromedriver.chromium.org/downloads
Help WebDriver find the downloaded ChromeDriver executable
Any of these steps should do the trick:
1) include the ChromeDriver location in your PATH environment variable
2) (Java only) specify its location via the webdriver.chrome.driver system property
3) (Python only) include the path to ChromeDriver when instantiating webdriver.Chrome

For more information, go to https://chromedriver.chromium.org/getting-started

## Usage
Launch My Congress with  $ my_congress

In order to use My Congress, follow the prompts to enter a valid
U.S. address. You can navigate the gem through the menus provided.
You can type 'exit' to quit the gem when you are done.

## Development

After checking out the repo, run `bin/setup` to install dependencies.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/thedannysoto/my-congress


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
