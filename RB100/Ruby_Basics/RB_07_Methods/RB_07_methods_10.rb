def name(ideas)
  ideas.sample
end

def activity(ideas)
  ideas.sample
end

def sentence(noun, verb)
  "#{noun} went #{verb} today!"
end

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))
