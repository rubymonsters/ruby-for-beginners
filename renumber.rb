require 'fileutils'

filenames = Dir['source/**/*.md']
filenames = filenames.select { |filename| filename =~ /[\d]{2}-/ }

filenames.sort.each.with_index do |source, number|
  number = number + 1
  number = number.to_s.rjust(2, '0')
  target = source.sub(/[\d]{2}-/, "#{number}-")
  FileUtils.mv(source, target) unless source == target
end
