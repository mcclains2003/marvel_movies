class MarvelMovies::Movie
  attr_accessor :title, :url, :release_date, :rating, :description

  def self.all
    self.scrape_movies.map.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} - #{movie.release_date}"
    end
  end

  def self.upcoming
    today = Date.today
    counter = 0
    self.scrape_movies.map do |movie|
      movie_date = Date.parse(movie.release_date)
      if today < movie_date
        counter += 1
        puts "#{counter}. #{movie.title} - #{movie.release_date}"
      end
    end
  end

  def self.dvd
    today = Date.today
    counter = 0
    self.scrape_movies.map do |movie|
      movie_date = Date.parse(movie.release_date)
      if today >= movie_date
        counter += 1
        puts "#{counter}. #{movie.title} - #{movie.release_date}"
      end
    end
  end

  def self.scrape_movies
    data = Nokogiri::HTML(open("http://marvel.com/movies/all"))
    movie_array = []

    data.css("div.JCMultiRow div.row-item").collect do |movies|
      movie = self.new
      movie.title = movies.css("div.row-item-text h5 a").text
      movie.url = movies.css("div.row-item-text h5 a").attr("href").value
      movie.release_date = movies.css("div.row-item-text p.media-item-meta").text
      movie_array << movie
    end
    movie_array.uniq
  end

  # def movie_date(date_string)
  #   Date.parse(date_string)
  # end

end