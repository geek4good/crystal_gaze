# CrystalGaze

Predict about anything – except for maybe the future.  
Oh, and it only does email addresses right now…

## Installation

If you want to use this in one of your applications, which is *not* recommended,
add this line to your application's Gemfile:

```ruby
gem 'crystal_gaze'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install crystal_gaze

If you just want to tinker with it, simply get the source code, change into the
gems root directory, and call the executable like this `bin/predict`.

## Usage

**CrystalGaze** comes with the executable `predict`. Call it to (hopefully) get
predictions of people's email addresses.

`predict email 'Lucas Mbiwe' alphasights.com`

The above should yield the result `lucas.mbiwe@alphasights.com`.

## Caveats

At the momemt, the gem cannot access a big set of sample data to base prediction
on. So it will only reliably predict email addresses ending in either
alphasights.com or apple.com. Getting sample data from a configuration file is
prepared but not implemented yet.

There is not much error handling. The executable only handles the most obvious
mistakes a user can make.

## Parting words

I really hope you think this is a funny take on the problem. But should you
think, after reading the code, this is lame and I am a crazy person, so be it. 
:)
