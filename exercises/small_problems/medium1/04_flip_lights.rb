def flip_lights(num_of_lights)
  lights = Array.new(num_of_lights, false)
  counter = 1

  while counter <= num_of_lights
    lights.map!.with_index do |light, i|
      (i + 1) % counter == 0 ? !light : light
    end
    counter += 1
  end

  lights.map.with_index do |light, i|
    light == true ? i + 1 : next
  end.compact
end

p flip_lights(5) == [1, 4]
p flip_lights(10) == [1, 4, 9]
p flip_lights(1000) == [1, 4, 9, 16, 25, 36, 49, 64, 81, 100, 121, 144, 169, 196, 225, 256, 289, 324, 361, 400, 441, 484, 529, 576, 625, 676, 729, 784, 841, 900, 961]
