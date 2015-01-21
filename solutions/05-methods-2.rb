def greet(name)
  greetings = ["Hello", "Hi", "Ohai", "ZOMG"].shuffle
  "Hello #{greetings.first}!"
end
