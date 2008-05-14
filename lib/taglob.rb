class Taglob
  VERSION = '0.0.1'
end

class Dir
  
  def self.taglob(pattern,*tags)
    tagged_files = []
    Dir.glob(pattern).each do |file|
      parsed_tags = []
      File.readlines(file).each do |line|
        parsed_tags = parsed_tags | self.parse_tags(line)
      end
      tagged_files << file unless (parsed_tags & tags).empty?
    end
    tagged_files
  end
  
  def self.parse_tags(line)
    line =~ /^#tags:\s+(.*)/ ?$1.split(',') : []
  end
  
end