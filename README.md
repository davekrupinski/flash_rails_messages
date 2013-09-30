# FlashRailsMessages

[![Build Status](https://travis-ci.org/alejandrogutierrez/flash_rails_messages.png?branch=master)](https://travis-ci.org/alejandrogutierrez/flash_rails_messages)

This gem provides an easy and simple way to display flash messages in a fancy way. It requires the
[bootstrap](http://twitter.github.io/bootstrap)
framework.

## Installation

Add this line to your application's Gemfile:

    gem 'flash_rails_messages'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install flash_rails_messages

## Usage

You only need to add this line wherever you want to display the messages:

    <%= render_flash_messages %>

You should add the line above in your html view. You can add it in multiple places.

## Defaults

The flash messages are displayed according to the flash type. By default shows a yellow alert.

**success**
- Shows a green alert

**notice**
- Shows a blue alert

**alert**
- Shows a red alert

## Customize alerts

By the way, the alerts are customizable. They will have a specific class according to the flash key. Example...

    flash[:whatever] = "Some flash rails message"

It'll generate a class in the html alert wrapper like this `alert-whatever` to customize the style.

## Adding HTML elements

The alerts that will be generated can include html elements. You just need to add html elements in the flash message.
Example...

    flash[:success] = "<strong>This text will be bold</strong> and this one will be normal"

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
