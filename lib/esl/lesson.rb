class Esl::Lesson
   attr_accessor :name, :url, :place, :summary

   def self.all
     self.scrape_lessons
   end

   def self.scrape_lessons
     lessons = []

     lessons << self.scrape_library
     lessons << self.scrape_ccny

     lessons
   end

   def self.scrape_library
     doc_1 = Nokogiri::HTML(open("http://www.nypl.org/events/classes/english#2"))

     lesson_1 = self.new
     lesson_1.place = "New York Public Library"
     lesson_1.name = doc_1.search("h1.title").text
     lesson_1.url = "http://www.nypl.org/events/classes/english#2"
     lesson_1.summary = "The New York Public Library helps adult students improve their communication skills in English. We offer two types of English classes, available at more than 40 libraries in the Bronx, Manhattan, and Staten Island. These are series-based classes, held year-round in 10-week cycles. Most classes meet two days each week, for two hours each day. Select classes meet on Saturday mornings for four hours. Classes are for beginner, intermediate, and advanced level students. Students must attend an information session to register for classes, and registration is required in order to attend these classes.
ESOL Classes: for non-native speakers to improve listening, speaking, reading and writing. Adult Basic Education Classes: for students who already speak English but want to improve their reading and writing."

     lesson_1
   end

   def self.scrape_ccny
     doc_2 = Nokogiri::HTML(open("https://www.ccny.cuny.edu/cps/esl"))

     lesson_2 = self.new
     lesson_2.place = "The City University of New York"
     lesson_2.name = doc_2.search("div.field-items h2").text
     lesson_2.url = doc_2.search("#cs_control_120852 a").attr("href").value
     lesson_2.summary = doc_2.search("#content_section p").text

     lesson_2
   end

end
