require_relative './app'

def main 
    app = App.new 
    options = ["Show All Cities", "Filter By Timezone", "Add New City"]

    loop do 
        app.display_options(options)
        print "Enter your option >> "
        command = gets.chomp
        break if command.downcase == 'x'
        puts 
        case command
        when '1'
            app.display_cities
        when '2' 
            app.filter_cities
        when '3'
            puts "Not implemented yet!"
        else
            puts "*Invalid Option!"
        end
    end

    puts "Thanks for using our app!"
end

main
