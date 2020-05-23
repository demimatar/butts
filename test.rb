module Ui
  def ask_question(question)
      puts question
      gets.chomp
    end

  def tab
    return ' ' * 4
  end
end
