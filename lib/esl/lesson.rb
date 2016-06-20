class Esl::Lesson
   attr_accessor :name, :place, :price
   @@all = []

   def initialize(name = nil, place = nil, price = nil)
     @name = name
     @place = place
     @price = price
     @@all << self
   end

   def self.new_from_index_page(le)
     self.new(
      le.css("a.title").text.strip,
      le.css("div.place").text.gsub("\n", ""),
      le.css("div.price").text.strip
     )
   end

   def self.all
     @@all
   end

   def self.find(id)
     self.all[id - 1]
   end
end
