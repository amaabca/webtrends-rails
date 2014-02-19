# Webtrends::Rails

[![Gem Version](https://badge.fury.io/rb/webtrends-rails.png)](http://badge.fury.io/rb/webtrends-rails)
[![Code Climate](https://codeclimate.com/github/amaabca/webtrends-rails.png)](https://codeclimate.com/github/amaabca/webtrends-rails)
[![Build Status](https://travis-ci.org/amaabca/webtrends-rails.png?branch=master)](https://travis-ci.org/amaabca/webtrends-rails)
[![Coverage Status](https://coveralls.io/repos/amaabca/webtrends-rails/badge.png)](https://coveralls.io/r/amaabca/webtrends-rails)
[![Dependency Status](https://gemnasium.com/amaabca/webtrends-rails.png)](https://gemnasium.com/amaabca/webtrends-rails)

Make use of Webtrends gem to allow server-side tracking in a Rails application.

## Installation

Add this line to your application's Gemfile:

    gem 'webtrends-rails'

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install webtrends-rails

## Usage

### Controller configuration

Track hook

track :object_to_track, options, optional_block

NOTE: Any options that can be passed to before_action can be used as options.

By default the track hook will use the following tags:

- dcsuri
- dcsdat
- dcssip
- WT.es
- WT.co_f

#### Tracking with custom tags

    track :object_to_track, only: :create do |tags|
      tags.store('your_custom_tag', 'custom_tag_value')
    end

#### Tracking with default tags

    track :object_to_track, only: [:create, :update]


### Model configuration

#### ActiveRecord

Make use of an after_save hook to call track_event

    after_save :track_event

#### ActiveModel

Make use of an after_validation hook to call track_event

    after_validation :track_event, if: 'errors.blank?'


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create tests for your feature
4. Make sure coverage meets minimum requirements
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request