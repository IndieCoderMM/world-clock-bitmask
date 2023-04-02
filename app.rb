require_relative './utility'

class App
    FILENAME = './cities_timezones.json'

    def initialize
        @cities = Utility.read_timezones FILENAME
    end 

    def display_cities
        puts "All Cities"
        @cities.keys.each {|k| puts "- #{k.capitalize}"}
    end

    def filter_cities
        print "Filter by timezone >> GMT "
        target_offset = gets.chomp.to_i
        target_bitmask = 1 << (12 + target_offset)
    
        filtered = []
        @cities.each do |name, timezone|
            if timezone.to_i(2) & target_bitmask == target_bitmask
                filtered << name 
            end
        end
        sign = target_offset.positive? ? '+' : '-'
        print "Cities in GMT #{sign} #{target_offset} "
        if filtered.empty?
            puts "are not in the data!"
        else
            puts 
            filtered.each {|c| puts "-#{c.capitalize}"}
        end        
    end

    def display_options(options, exit_key: "x")
        puts "\nAvailable Commands"
        options.each_with_index do |text, i|
            puts "-[#{i+1}] #{text.capitalize}"
        end
        puts "-[#{exit_key}] Close the App"
    end
end
