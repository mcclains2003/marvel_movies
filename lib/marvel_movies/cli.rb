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
    puts "Please enter the option you would like to see or type exit: "
    while input != "exit"
      input = gets.strip.downcase

      case input
      when "1"
        puts ""
        MarvelMovies::Movie.list_all
        movie_description_menu(MarvelMovies::Movie.all)
      when "2"
        puts ""
        MarvelMovies::Movie.list_upcoming
        movie_description_menu(MarvelMovies::Movie.upcoming)
      when "3"
        puts ""
        MarvelMovies::Movie.list_dvd
        movie_description_menu(MarvelMovies::Movie.dvd)
      when "exit"
        goodbye
      else
        puts ""
        puts "Not familiar with that option, please type another option or exit: "
      end
    end
  end

  def goodbye
    puts ""
    puts "Goodbye and check back later for more Marvel Universe"
    exit
  end

  def movie_description_menu(array)
    input = nil

    while input != "exit"
      puts " "
      puts "Choose the number of the movie you would like more information on, type back to go back to previous menu, or exit: "
      input = gets.strip.downcase

      if input.to_i > 0
        movie = MarvelMovies::Movie.find_movie(array, input.to_i)
        movie.profile_scrape
        puts "Title: #{movie.title}"
        puts "Release Date: #{movie.release_date}"
        puts "Rating: #{movie.rating}"
        puts "Description: #{movie.description}"
        puts ""
      elsif input == "back"
        call
      elsif input == "exit"
        goodbye
      end
    end
  end

end