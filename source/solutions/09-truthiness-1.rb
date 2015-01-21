objects = [true, false, 0, 1, "", [], Object.new, Class.new, Module.new]
rows = objects.map do |object|
  representation = object.inspect.sub(/:.*>/, ">").ljust(9)
  value = object == true
  [representation, value].join(" | ")
end
puts rows.join("\n")
