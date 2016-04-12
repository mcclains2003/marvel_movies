How to Build a Marvel Universe Movie CLI Gem

1. Plan your gem, imagine your interface
2. Start with the project structure - google
3. Start with the entry point - the file run
4. force that to build the CLI interface
5. stub out the interface
6. start making things real
7. discover objects.
8. program

A command line interface for upcoming, and available now Marvel Universe Movies

user types marvel-movies

Show a list of options: (FIRST MENU)
1. Show a list of All Movies
2. Show only Upcoming Movies
3. Show movies Available Now on DVD
4. Back
5. Exit

When movies are displayed this menu will be displaced

1. Which movie do you want to see a description about
2. Back
3. Exit



<!-- require 'nokogiri'
require 'open-uri'

def self.scrape_movie_index_page(index_url)
  data = Nokogiri::HTML(open("http://marvel.com/movies/all"))
  movies = []

  movies = data.css("div.row-item").collect do |movie|
    {
      :title => movie.css("div.row-item-text h5 a").text,
      :profile_url => movie.css("div.row-item-text h5 a").attr("href").value
    }
  end
end

def self.scrape_movie_profile_page(profile_url)
  data = Nokogiri::HTML(open(profile_url))
  
end -->