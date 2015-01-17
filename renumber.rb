require 'fileutils'

def paths(dir)
  paths = Dir["#{dir}/*.md"]
  paths = paths.select { |path| path =~ /[\d]{2}-/ }
  paths = paths.map { |path| path.sub('.md', '') }.uniq
end

def renumber(source, number)
  number = number.to_s.rjust(2, '0')
  source.sub(/(.*)[\d]{2}-/, "\\1#{number}-")
end

def mv(source, target)
  FileUtils.mv(source, target) if File.exists?(source)
  FileUtils.mv("#{source}.md", "#{target}.md") if File.exists?("#{source}.md")
end

def renumber_all(dir)
  paths(dir).sort.each.with_index do |source, number|
    target = renumber(source, number + 1)
    mv(source, target) unless source == target
    renumber_all(source)
  end
end

renumber_all('source')


