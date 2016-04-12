class MarvelMovies::CLI

  def call
    list_choices
    menu
    goodbye
  end

  def list_choices
    puts "Hello Marvel Fans"
    puts <<-DOC.gsub /^\s*/, ''
    1. Show All Marvel Movies
    2. Show Upcoming Marvel Movies
    3. Show Marvel Movies Available Now on DVD
    DOC
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the option you would like to see or type exit: "
      input = gets.strip.downcase
      case input
      when "1"
        MarvelMovies::Movie.all
      when "2"
        puts "All Upcoming Movies List"
      when "3"
        puts "All Movies already on DVD List"
      else
        puts "Not familiar with that option, please type another option or exit"
      end
    end
  end

  def goodbye
    puts "Goodbye and check back later for more Marvel Universe"
  end

end