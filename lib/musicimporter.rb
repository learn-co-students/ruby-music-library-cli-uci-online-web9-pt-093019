class MusicImporter
attr_accessor :path
attr_writer :files

def initialize(path)
  @path = path
end

def files
  self.files = Dir.new(self.path).children
end

def import
  self.files.each {|file| Song.create_from_filename(file)}
end


end #end of class
