class Artist 
  extend Concerns::Findable
  
  attr_accessor :name, :songs 
  @@all = [] 
  
  def initialize(name)
    @name = name 
    @songs = []
    
  end
  
  def self.all 
    @@all 
  end
  
  def self.destroy_all
    @@all.clear
  end
  
  def save 
    @@all << self unless @@all.include?(self)
  end
  
  def self.create(name)
    self.new(name).tap do |artist|
      artist.save
    end
  end
  
  def add_song(song)
    song.artist = self unless song.artist
    songs << song unless songs.include?(song)
  end
  
  def genres 
    songs.map(&:genre).uniq 
  end
end