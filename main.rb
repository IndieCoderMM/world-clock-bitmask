require_relative './utility'

filename = './cities_timezones.json'

# Utility.init_cities filename 

cities = Utility.read_timezones filename

puts "All Cities"
cities.keys.each {|k| puts k}

print "Filter by timezone >> GMT "
target_offset = gets.chomp.to_i
target_bitmask = 1 << (12 + target_offset)

filtered = []
cities.each do |name, timezone|
    if timezone.to_i(2) & target_bitmask != 0
        filtered << name 
    end
end

puts "Cities with Timezone GMT+ #{target_offset}"
puts filtered
