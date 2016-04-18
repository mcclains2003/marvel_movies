class MarvelMovies::Movie
  attr_accessor :title, :url, :release_date, :rating, :description

  def self.scrape_movies
    data = Nokogiri::HTML(open("http://marvel.com/movies/all"))
    movie_array = []

    data.css("div.JCMultiRow div.row-item").collect do |movies|
      movie = self.new
      movie.title = movies.css("div.row-item-text h5 a").text
      movie.release_date = movies.css("div.row-item-text p.media-item-meta").text
      movie.url = "http://marvel.com" + movies.css("div.row-item-text h5 a").attr("href").value
      movie_array << movie
    end
    movie_array.uniq
  end

  def profile_scrape
    profile_data = Nokogiri::HTML(open(self.url))

    if profile_data.css("span.block3")[0]
      self.rating = profile_data.css("span.block3").first.text.gsub(" Rating:  ", "").strip
      description = profile_data.css("div.featured-item-desc p").last
    else
      self.rating = profile_data.css("div.details p").last.text.strip.gsub("Rating: ", "")
      description = profile_data.css("div#pull-quote h1")
    end
    description.css("a").remove
    self.description = description.text.gsub( /\n|\t|\r|[ ]{2,}/, "" ).strip
  end

  def self.all
    self.scrape_movies
  end

  def self.list_all
    self.all.map.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end
  end

  def self.upcoming
    today = Date.today
    movie_list = []

    self.scrape_movies.map do |movie|
      movie_date = Date.parse(movie.release_date)
      if today < movie_date
        movie_list << movie
      end
    end
    movie_list
  end

  def self.list_upcoming
    self.upcoming.map.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end
  end

  def self.dvd
    today = Date.today
    movie_list = []

    self.scrape_movies.map do |movie|
      movie_date = Date.parse(movie.release_date)
      if today >= movie_date
        movie_list << movie
      end
    end
    movie_list
  end

  def self.list_dvd
    self.dvd.map.with_index(1) do |movie, i|
      puts "#{i}. #{movie.title}"
    end
  end

  def self.find_movie(array, index)
    array[index-1]
  end

end