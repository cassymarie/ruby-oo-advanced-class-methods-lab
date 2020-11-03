class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end
  def self.new_by_name(new_song)
    song = self.new 
    song.name = new_song
    song.class.all << song
    song
  end
  def self.create_by_name(artist)
    song = self.new 
    song.name = artist
    song.class.all << song
    song
  end
  def self.find_by_name(name)
    self.all.find{|song| song.name == name}
  end
  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else 
      self.find_by_name(name)
    end
  end
  def self.alphabetical
    self.all.sort {|a, b| a.name <=> b.name}
  end
  def self.new_from_filename(filename)
    uploadFile = filename.scan(/(\w+) - (.+[^.mp3])/)
    file_name = uploadFile[0][1]
    file_artist = uploadFile[0][0]
    song = new_by_name(file_name)
    song.artist_name = file_artist
    song
  end
  def self.create_from_filename(filename)
    uploadFile = filename.scan(/(\w+) - (.+[^.mp3])/)
    file_name = uploadFile[0][1]
    file_artist = uploadFile[0][0]
    song = create_by_name(file_name)
    song.artist_name = file_artist
    song
  end
  def self.destroy_all
    @@all = []
  end
end


