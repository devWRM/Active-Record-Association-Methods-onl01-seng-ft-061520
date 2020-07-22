class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    # return the number of songs in a genre

    self.songs.count
  end

  def artist_count
    # return the number of artists associated with the genre

    self.artists.count
  end

  def all_artist_names
    # return an array of strings containing every musician's name

    # Google for resource: get an array of names from an ActiveRecord column
    # Resource answer:  https://stackoverflow.com/questions/34713368/using-select-or-map-to-get-an-array-of-names-from-an-activerecord-model
    self.artists.pluck(:name)
    # self.artists.map(&:name)
  end
end


##########################################################

# map(&:name) EXPLANATION below: https://www.honeybadger.io/blog/how-ruby-ampersand-colon-works/

# words = ["would", "you", "like", "to", "play", "a", "game?"]

### this...
# words.map &:length

### ..is equivalent to this:
# words.map { |w| w.length }

##########################################################




# Return an array of actual Column names:   https://stackoverflow.com/questions/11011402/get-columns-names-with-activerecord
