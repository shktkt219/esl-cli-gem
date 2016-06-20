class Esl::CLI

  def call
    Esl::Scraper.new.make_lessons
    puts ""
    puts "******** English Classes in the NYC **********"
    start
  end

  def start
    puts ""
    puts "What class would you like more information on?"
    puts ""
    lesson_list
    input = gets.strip.to_i

    lesson = Esl::Lesson.find(input)
    print_lesson(lesson)

    puts ""
    puts "Would you like to see another class? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "See you next time!"
    end
  end

  def lesson_list
    Esl::Lesson.all.each.with_index(1) do |lesson, index|
      puts "#{index}. #{lesson.name}"
    end
  end

  def print_lesson(lesson)
    puts ""
    puts "----#{lesson.name}-----"
    puts ""
    puts "Place: #{lesson.place}"
    puts "Price: #{lesson.price}"
    puts ""
  end

end
