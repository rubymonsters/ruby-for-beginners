require 'fileutils'

Dir['*.md'].sort.each.with_index do |source, number|
  number = number.to_s.rjust(2, '0')
  target = [number, source.sub(/[\d]{2}_/, '')].join('_')
  FileUtils.mv(source, target) unless source == target
end
