```ruby
objects = [true, false, 0, 1, "", [], Object.new, Class.new, Module.new]

rows = objects.map do |left|
  objects.map { |right| [left, right] }
end

headers = [""] + objects.map { |object| object.inspect.sub(/:.*>/, ">") }
width = headers.max_by { |header| header.length }.length
headers = headers.map { |header| header.ljust(width) }

lines = rows.map.with_index do |row, ix|
  cells = row.map do |cell|
    value = cell[0] == cell[1]
    value.inspect.ljust(width)
  end
  cells = [headers[ix + 1]] + cells
  cells.join(" | ")
end
lines = [headers.join(" | ")] + lines

puts lines.join("\n")
```
