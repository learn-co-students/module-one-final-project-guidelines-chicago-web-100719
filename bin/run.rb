require_relative '../config/environment'

# puts "HELLO WORLD"

puts "Thinking of hiring an NFL player? See what crimes they've committed!"
Player.all.each { |p| puts p.name }
puts "Enter a player's name to find out what they've done:"
