# CrystalGaze

Predict about anything – except for maybe the future.  
Oh, and it only does email addresses right now…

Looking into the crystal ball let's you take a peek into the spirit world.
Spirits manifest themselves as people's email addresses as part of visions.
The spirits present traces of real-world email addresses. Because of that and
because spirits can effortlessly shift their shape into different forms, they
can assist in predicting what other people's email addresses in the same context
would look like.

Sounds crazy? I'll all make sense in a minute. Promise.

## Structure

```
crystal_gaze/
|
+-- crystal_ball.rb
+-- spirit_world.rb
+-- email_vision.rb
+-- email_spirit.rb
+-- email_manifestation.rb
|
+--+ bin/
   + predict
```

The files above are obviously not ordered alphabetically but logically. From top
to bottom the files respresent the layers of the application from the outside
going further inside. Now the above should make more sense.

## Installation

This is neither necessary for testing purposes, nor, since this whole thing is
far from production-ready, recommended for any other purpose. But for the sake
of a complete picture, here are some installation instructions:

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

Speaking of configuration, the whole matching logic should probably go into a
configuration file, too, to make it easily extendable as well as adaptable. At
the moment it is hard coded and, therefore, obviously rigid.

There is not much error handling. The executable only handles the most obvious
mistakes a user can make. But it won't really work for people with more than a
first and a last name.

Last but not least, I usually don't commit failing tests to the master branch,
but I wanted to illustrate the process I went through getting the first version
working. Hopefully it also helps to better understand the relations between the
different domain models.

## Closing words

I really hope you, dear reader, think this is a funny take on the whole thing
about being domain specific and all. Being unable to locate a and speak to a
domain expert, I tried to do my very best to capture the aspects of the
prediction space in my implementation of it. But should you think, after reading
the code, this is lame and / or I am a crazy person, so be it.  
:)
