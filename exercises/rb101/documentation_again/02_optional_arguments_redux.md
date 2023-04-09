I'm just making an educated guess here, but I believe the `require` method imports RubyGems.  With that assumption in mind, a RubyGem called `date` is being imported to provide the `Date#civil` method.

Continuing to make assumptions, `#civil` can accept or not accept up to 3 parameters.  The given parameters look like year, month, and day.  It stands to reason that this method returns a default date which can be modified by up to 3 parameters.  Let's test this in irb and find out!
```ruby
puts Date.civil # => -4712-01-01
puts Date.civil(2016) # => 2016-01-01
puts Date.civil(2016, 5) # => 2016-05-01
puts Date.civil(2016, 5, 13) # => 2016-05-13
```
It looks like my theory is largely correct.  Interestingly though is the default year, `-4712`.  That seems a bit obscure.  Time to go to the Ruby docs and see what I can learn!

Looks like I'm wrong about `date` being a RubyGem.  It's a class!  I'm not sure why it needs `require` yet.  Will dig more.

A hint was that `date` is capitalized when being called, `Date`.  That seems to be the syntax for calling a Class.

It starts at year `-4712` due to Ruby following the BCE/CE (Before/Common Era).  It's calculated using the Julian Day Number (from the Julian calander) which seems to start on -4712, but seems to be based on the Greogrian calander.  Honestly, it all gets a bit confusing, but the BCE/CE is an international, secular standard.  It's interesting to note that it seems to line up with BC/AD.
