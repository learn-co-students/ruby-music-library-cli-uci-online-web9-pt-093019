class MusicLibraryController
attr_reader :importer

def initialize(path = './db/mp3s')
  @importer = MusicImporter.new(path)
  importer.import
end

def call
  puts "Welcome to your music library!"
  input = ""
  while input == "" || input != "exit"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp
  end #end of while loop
end

def list_songs
  Song.all.sort{|s1,s2| s1.name <=> s2.name}.each.with_index(1) do |s,i|
    #binding.pry
    puts "#{i}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
  end
end

def list_artists
  Artist.all.sort{|a1,a2| a1.name <=> a2.name}.each.with_index(1) do |artist, i|
    puts "#{i}. #{artist.name}"
  end
end

def list_genres
  Genre.all.sort{|g1, g2| g1.name <=> g2.name}.each.with_index(1) do |genre, i|
    puts "#{i}. #{genre.name}"
  end
end

def list_songs_by_artist
  input = ""
  puts "Please enter the name of an artist:"
  input = gets.chomp
  if Artist.find_by_name(input)
    Artist.find_by_name(input).songs.sort{|s1,s2| s1.name <=> s2.name}.each.with_index(1) do |s,i|
      puts "#{i}. #{s.name} - #{s.genre.name}"
    end
  end
end

def list_songs_by_genre
  input = ""
  puts "Please enter the name of a genre:"
  input = gets.chomp
  if Genre.find_by_name(input)
    Genre.find_by_name(input).songs.sort{|s1,s2| s1.name <=> s2.name}.each.with_index(1) do |s,i|
      puts "#{i}. #{s.artist.name} - #{s.name}"
    end
  end
end

def play_song
  input = ""

end

end #end of class
