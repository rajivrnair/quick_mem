# QuickMem

[![Gem Version](https://badge.fury.io/rb/quick_mem.svg)](http://badge.fury.io/rb/quick_mem)

A simple gem to dump memory stats. Primarily written to tick off the "I wrote a gem" box.
I'll probably improve it to be some kind of analyzer/profiler if time permits.
Suggestions welcome!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'quick_mem'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install quick_mem

## Usage

```ruby
require 'quick_mem'

QuickMem::QuickMemory.show_config
```

## Contributing

1. Fork it ( https://github.com/rajivrnair/quick_mem/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## Useful Reading
http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf
http://www.omniref.com/blog/blog/2014/03/27/ruby-garbage-collection-still-not-ready-for-production/
http://samsaffron.com/archive/2014/04/08/ruby-2-1-garbage-collection-ready-for-production
http://samsaffron.com/archive/2013/11/22/demystifying-the-ruby-gc
http://thorstenball.com/blog/2014/03/12/watching-understanding-ruby-2.1-garbage-collector/
http://www.rubyenterpriseedition.com/documentation.html#_garbage_collector_performance_tuning
http://stackoverflow.com/questions/16850551/ruby-gcprofiler-use-size-is-greater-than-total-size
https://github.com/ko1/gc_tracer/

https://quickleft.com/blog/engineering-lunch-series-step-by-step-guide-to-building-your-first-ruby-gem/
http://www.smashingmagazine.com/2014/04/08/how-to-build-a-ruby-gem-with-bundler-test-driven-development-travis-ci-and-coveralls-oh-my/
http://recipes.sinatrarb.com/p/development/bundler