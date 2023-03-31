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
            "moscow"=> Utility.generate_bin(3),
            "paris" => Utility.generate_bin(2),
            "berlin" => Utility.generate_bin(2),
            "amsterdam" => Utility.generate_bin(2),
            "rome"  => Utility.generate_bin(2),
            "london" => Utility.generate_bin(1),
            "dublin" => Utility.generate_bin(1),
            "new york" => Utility.generate_bin(-4),
            "los angeles" => Utility.generate_bin(-7),
            "tokyo" => Utility.generate_bin(9),
            "beijing" => Utility.generate_bin(8),
            "mumbai" => Utility.generate_bin(5)
        }
        File.write(filename, JSON.generate(cities))
    end

end

