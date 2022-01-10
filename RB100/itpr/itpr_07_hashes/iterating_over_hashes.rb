new_hash = {
  :bff => "Birdman",  # Old syntax.
  sidekick: "Morty",  # New syntax.
  backup_sidekick: "Summer",
  daughter: "Beth"
}

new_hash.each { |k, v| puts "#{v} is Rick's #{k}."}
