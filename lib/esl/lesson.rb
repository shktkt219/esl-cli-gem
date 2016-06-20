class Esl::Lesson
   attr_accessor :name, :place, :price, :summary
   @@all = []

   def initialize(name = nil, place = nil, price = nil, summary = nil)
     @name = name
     @place = place
     @price = price
     @summary = summary
     @@all << self
   end

   def self.new_from_index_page(le)
     self.new(
      le.css("a.title").text.strip,
      le.css("div.place").text.gsub("\n", ""),
      le.css("div.price").text.strip,
      le.css("p.course-desc").text.split("...")
     )
   end

   def self.all
     @@all
   end

   def self.find(id)
     self.all[id - 1]
   end
end
