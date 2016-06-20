class Esl::Scraper

  def get_page
    Nokogiri::HTML(open("https://coursehorse.com/nyc/classes/language/esl/intensive-english"))
  end

  def scrape_lessons
    self.get_page.css("div.common")
  end

  def make_lessons
    scrape_lessons.collect do |le|
      Esl::Lesson.new_from_index_page(le)
    end
  end

end
