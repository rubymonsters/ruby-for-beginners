require 'fileutils'

InvalidFilename = Class.new(StandardError)

class Paths < Struct.new(:dir)
  def all
    @all ||= find_all(dir)
  end

  private

    def find_all(dir)
      find(dir).inject([]) do |result, (path, ix)|
        result << [path, ix]
        result + find_all(path)
      end
    end

    def find(dir)
      # paths = Dir["#{dir}/*.md"]
      paths = Dir["#{dir}/**/*"]
      paths = paths.select { |path| path =~ /[\d]{2}-/ }
      # paths = paths.map { |path| path.sub('.md', '') }.uniq.sort
      paths.map.with_index { |path, ix| [path, ix] }
    end
end

class Source < Struct.new(:path, :number)
  def validate!
    raise InvalidFilename, "Invalid filename: #{basename}.md" unless basename =~ /^[\d]{2}-[\w_]+$/
  end

  def save
    File.write(filename, content)
  end

  def move
    # ['md', nil].each do |ext|
      # source, target = "#{path}.md", "#{self.target}.md"
      source, target = path, self.target
      # target = [self.target, ext].compact.join('.')
      puts "source: #{source}", "target: #{target}"
      unless source == target
        # FileUtils.mv(source, target)
      end
    # end
    # self.path = self.target
  end

  def exercise?
    dir == 'exercises'
  end

  def content
    @content ||= File.read(filename)
  end

  def target
    path.sub(/(.*)[\d]{2}-/, "\\1#{formatted_number}-")
  end

  def dir
    dirname.split('-').last
  end

  def name
    path.split('-').last
  end

  def filename
    "#{path}.md"
  end

  def dirname
    File.dirname(path)
  end

  def basename
    File.basename(path)
  end

  def formatted_number
    number.to_s.rjust(2, '0')
  end
end

class Fixes < Struct.new(:sources)
  def apply(source)
    [Hrefs, Headlines, Filenames].each do |fix|
      fix.new(sources).apply(source)
    end
  end
end

class Hrefs < Struct.new(:sources)
  def apply(source)
    path, dir, name = source.path.sub('source/', ''), source.dir, source.name
    sources.each do |source|
      matches = source.content.match(%r(["\(]/([\d]{2}-#{dir}/?[\d]{2}-#{name}).html["\)]))
      match = matches && matches.to_a.last
      next unless match && match != path
      source.content.gsub!(match, path)
      source.save
    end
  end
end

class Headlines < Struct.new(:sources)
  def apply(source)
    return unless source.exercise?
    source.content.gsub!(/([#]+ .+) [\d]+.([\d]+)/) do |match|
      "#{$1} #{source.number}.#{$2}"
    end
    source.save
  end
end

class Filenames < Struct.new(:sources)
  def apply(source)
    return unless source.exercise?
    name, target = source.name, File.basename(source.target)
    sources.each do |source|
      source.content.gsub!(/[\d]{1,2}-#{name}-([\d]{1,2}).rb/) do |match|
        filename = "#{target}-#{$1}.rb"
        move_solution(match, filename) unless match == filename
        filename
      end
      source.save
    end
  end

  def move_solution(source, target)
    dir = "source/solutions"
    FileUtils.mv("#{dir}/#{source}", "#{dir}/#{target}") if File.exists?("#{dir}/#{source}")
  end
end

class Sources < Struct.new(:dir)
  def renumber
    sources.reverse.each.with_index do |source, ix|
      # source.move
      # source.validate!
      # fixes.apply(source)
      path = source.path
      source.move
      # sources.select { |s| s.path.include?(path) }.each do |s|
      #   s.path.sub(path, source.path)
      # end
      # next_source = sources[ix + 1]
      # next unless next_source
      # if next_source.path.include?(path)
      #   puts path
      #   puts source.path
      #   next_source.path.sub(path, source.path)
      #   puts next_source.path
      # end
    end
  rescue InvalidFilename => e
    puts e.message
  end

  private

    def fixes
      @fixes ||= Fixes.new(sources)
    end

    def sources
      @sources ||= Paths.new(dir).all.map do |path, ix|
        Source.new(path, ix + 1)
      end
    end
end

fail 'kaputt'

sources = Sources.new('source')
sources.renumber
