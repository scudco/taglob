class Dir

  def self.tags(pattern)
    Dir.glob(pattern).each do |file|
      yield(file, File.tags(file))
    end
  end

  def self.taglob(pattern,tags)
    if(tags.include?('|'))
      Dir.tagor(pattern,*tags.split('|'))      
    else
      Dir.tag_and(pattern,*tags.split(','))      
    end
  end

  def self.tag_and(pattern, *tags)
    tagged_files = []
    self.tags(pattern) do |file,parsed_tags|
      tagged_files << file if (tags - parsed_tags).empty?
    end
    tagged_files
  end
  
  def self.tagor(pattern, *tags)
    tagged_files = []
    self.tags(pattern) do |file,parsed_tags|
      tagged_files << file if !(tags & parsed_tags).empty?
    end
    tagged_files
  end

end