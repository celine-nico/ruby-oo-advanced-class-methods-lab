class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.create 
    song = self.new 
    song.name = name
    @@all << song
    song
  end 

  def Song.new_by_name(name)
    song = self.new
    song.name = name  
    song
  end 

  def Song.create_by_name(name)
    song = self.new
    song.name = name  
    @@all << song
    song
  end 

  def Song.find_by_name(name)
    @@all.find {|song| song.name == name}
  end 

  def Song.find_or_create_by_name(name)
    if Song.find_by_name(name) 
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end 
  end

  def Song.alphabetical
    @@all.sort_by {|song| song.name}
  end 

  def Song.new_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    song_name = part[1].gsub(".mp3", "")

    song = self.new
    song.name = song_name
    song.artist_name = artist_name
    song
  end
  
  def Song.create_from_filename(filename)
    part = filename.split(" - ")
    artist_name = part[0]
    song_name = part[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song.save
    song
  end 

  def Song.destroy_all
    @@all.clear()
  end 

end
