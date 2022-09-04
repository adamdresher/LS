=begin
class AuthenticationError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    rand(200_000)
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    rescue Exception
      NoScore
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when NoScore
      "No idea about #{term}..."
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       # Sushi seems to be ok...
puts DoesItRock.find_out('Rain')        # Rain is not fun.
puts DoesItRock.find_out('Bug hunting') # Bug hunting rocks!
=end

=begin
The above code has an issue of attempting to handle an incorrect `API_KEY` with
two different and clashing approaches.
When the `API_KEY` is modified to something other than `LS1A`, the above code
raises the `Exception` `AuthenticationError` as expected.  However this occurs
on line 39, within the method `Score#for_term`.  Within this method,
`SearchEngine#count` raises the `Exception` and outside of `#count`, `#for_term`
siliences this `Exception`- returning `NoScore`.  So `Score#for_term` evaluates
to `NoScore` and is the value assigned to the variable `score`.
This means there is no `Exception` to rescue when the `case` block is evaluated
on lines 41-53.  This approach is further complicated by the use of `NoScore` as
a conditional expression within the `case` block.  As `NoScore` is not a range
expression, this condition will always return `false` and its `then` expression
will never be evaluated.  This means the expression for the `else` condition
will be evaluated whenever `score` is assigned to `NoScore`- not as expected.

This can be resolved by removing the `rescue` on lines 33-34, thereby allowing
the `AuthenticationError` `Exception` to be returned to `Score#for_term` and
thus being rescued on line 51 within `Score#find_out`'s `case` block.  Using
this approach negates the need for the condition on lines 42-43 and thus the
`NoScore` class being defined at all, on line 25.
=end

module DoesItRock

  # ...

  class Score
    def self.for_term(term)
      positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f

      positive / (positive + negative)
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    case score
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end
