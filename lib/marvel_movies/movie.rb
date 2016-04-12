class MarvelMovies::Movie
  attr_accessor :title, :url, :release_date, :rating, :description

  def self.all
    self.scrape_movies.map.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title} - #{movie.release_date}"
    end
  end

  def self.upcoming
    self.all
  end

  def self.dvd
    #Returns all Marvel movies already on DVD
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

end