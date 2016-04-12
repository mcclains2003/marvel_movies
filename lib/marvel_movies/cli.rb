class MarvelMovies::CLI

  def call
    list_choices
    menu
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
        MarvelMovies::Movie.upcoming
      when "3"
        MarvelMovies::Movie.dvd
      when "exit"
        goodbye
      else
        puts "Not familiar with that option, please type another option or exit"
      end
    end
  end

  def goodbye
    puts "Goodbye and check back later for more Marvel Universe"
  end

  def movie_description_menu
    puts "Choose the number of the movie you would like more information on, type back to go back to previous menu, or exit"
  end

end