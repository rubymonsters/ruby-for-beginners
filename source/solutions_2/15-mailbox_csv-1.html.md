```ruby
class EmailsCsvStore
  def initialize(filename)
    @csv = CSV.new(File.read(filename), headers: true)
  end

  def read
    @csv.map do |row|
      row = row.to_hash
      Email.new(row['Subject'], { from: row['From'], date: row['Date'] })
    end
  end
end
```
