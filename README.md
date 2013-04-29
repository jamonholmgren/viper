# Viper

Automatic snake case for Objective-C methods in RubyMotion.

```ruby
v = UIView.new # => #<UIView:0xaa45260>
v.background_color = UIColor.white_color # => #<UICachedDeviceWhiteColor:0xaa41180>
v.backgroundColor => #<UICachedDeviceWhiteColor:0x967c2e0>
v.asdf # => #<NoMethodError: asdf>
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'viper', "~> 0.1.0"
```

## Usage

```ruby
class MyView < UIView
  include Viper::SnakeCase
end
class MyColor < UIColor
  include Viper::SnakeCase
end

v = MyView.new
v.background_color = MyColor.white_color
```

Or...

```ruby
class NSObject
  include Viper::SnakeCase
end

# Now everything has snake case...
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Create your feature and specs
4. Ensure all specs pass (`rake spec`)
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
