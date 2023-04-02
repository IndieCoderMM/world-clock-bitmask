require 'json'

class Utility
    def self.read_timezones(filename)
        return unless File.exist? filename
        file = File.open filename
        data = file.read 
        file.close
        return [] if data.empty?
    
        JSON.parse(data) 
    end

    def self.generate_bin(offset)
        binary = Array.new(24, 0)
        offsetIndex = 11 - offset

        binary[offsetIndex] = 1

        binary.join('')
    end

    def self.add_city(city_name, tz_offset, cities, filename)
        cities[city_name] = Utility.generate_bin(tz_offset)
        File.write(filename, JSON.generate(cities))
    end

    def self.init_cities(filename)
        cities = {
            "moscow"=> 3,
            "paris" => 2,
            "berlin" => 2,
            "amsterdam" => 2,
            "rome"  => 2,
            "london" => 1,
            "dublin" => 1,
            "new york" => -4,
            "los angeles" => -7,
            "tokyo" => 9,
            "beijing" => 8,
            "mumbai" => 5
        }
        data = {}
        cities.each {|city, tz| data[city] = Utility.generate_bin(tz)}
        File.write(filename, JSON.generate(data))
    end

end

