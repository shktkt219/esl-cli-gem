class Esl::CLI

  def call
    list_esl
    menu
    goodbye
  end

  def list_esl
    puts ""
    puts "************* Free ESL classes in NY *************"
    puts ""
    Esl::Lesson.all.each.with_index(1) do |le, i|
      puts "#{i}. #{le.place} - #{le.name}"
    end
    puts ""
  end

  def print_esl(lesson)
    puts ""
    puts "---- #{lesson.place} - #{lesson.name} ----"
    puts ""
    puts lesson.summary
    puts ""
    puts "URL: #{lesson.url}"
    puts ""
  end

  def menu
    input = nil
    while input != "exit"
      puts "Please enter the number of the class you'd like more information on."
      puts "Enter list to see the classes again or enter exit to end the program."
      input = gets.strip.downcase

      if input.to_i > 0
        lesson = Esl::Lesson.all[input.to_i-1]
        print_esl(lesson)
      elsif input == "list"
        list_esl
      end
    end
  end

  def goodbye
    puts "See you again!"
  end

end
