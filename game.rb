require_relative 'test'

class Game
  include Ui

  def initialize
    @menu = [
    'Explore the room',
    'Use the syringe',
    'Drink from the bottle',
    'Swallow the pill capsule',
    'Go back to sleep'
    ]

    @menu_loop = true
    @choices_made = {
    bottle: false,
    pill: false
    }
  end

  def play
    introduction
    introduction2
  end

  def introduction
    choice1 = nil

    while choice1 != 'yes'
      print 'Welcome'
      sleep(0.5)
      print '.'
      sleep(0.5)
      print '.'
      sleep(0.5)
      print '. '
      sleep(1)
      puts 'TO HELL!!!!!'
      sleep(1.5)

      start = ask_question('New game?')
      choice1 = respond_to_new_game(start.downcase)
    end
  end

  def introduction2
    continue = true

    while continue == true
      sleep(2)
      puts 'You wake up in a dimly lit room.'
      sleep(2)
      puts 'The floor is sticky. Everything is sticky.'
      sleep(2.5)
      puts 'Is your head pounding... or is that the walls?'
      sleep(2.5)
      puts 'On the ground before you lay a syringe, an unlabeled bottle, both filled with an unknown liquid, and a pill capsule.'
      sleep(4)
      puts ''

      main_menu
    end
  end

  def main_menu
    @menu_loop = true

    while @menu_loop == true
      @menu_loop = true
      puts 'What would you like to do?'
      sleep(0.5)
      display_menu_options(@menu)

      first_story_fork = ask_question('ENTER THE NUMBER ONLY')
      respond_to_first_story_fork(first_story_fork)
    end
  end

  def respond_to_new_game(newgame)
    if newgame == 'yes'
      puts 'Let\'s go!!!!!!!!!!!!!!!!!!!!'
      return 'yes'      
    end
  end

  def display_menu_options(menu_options)
    menu_options.each_with_index do |option, index|
      puts tab + "#{index + 1} " + option
    end
  end

  def respond_to_first_story_fork(first)  
    try = @menu.index('Try for the arch again')
    explore = @menu.index('Explore the room')
    use = @menu.index('Use the syringe')
    drink = @menu.index('Drink from the bottle')
    swallow = @menu.index('Swallow the pill capsule')
    go = @menu.index('Go back to sleep')

    if !explore.nil? && first == (explore + 1).to_s
      explore_the_room_pt1
    elsif !use.nil? && first == (use + 1).to_s
      use_the_syringe
    elsif !drink.nil? && first == (drink + 1).to_s
      drink_from_the_bottle
    elsif !swallow.nil? && first == (swallow + 1).to_s
      swallow_the_pill  
    elsif !go.nil? && first == (go + 1).to_s
      @menu_loop = false
    elsif !try.nil? && first == (try + 1).to_s
      # try_for_the_arch_again
    else
      puts 'Error. Try again.'   
    end
  end

  def explore_the_room_pt1
  #   elsif !@choices_made[:pill] && @choices_made[:bottle]
  #   elsif @choices_made[:pill] && @choices_made[:bottle]
  #   else
    puts tab + 'story for what happens if you click explore the room'
    puts tab + 'storyyyyyyy'
    puts ''

    loop do
      explore_the_room_pt2 = ask_question('Shall you continue forward?')
      break if respond_to_explore_the_room_pt2(explore_the_room_pt2.downcase) != false
    end  
  end

  def if_not_ready
    puts tab + 'story for if you hit continue after hitting explore the room'
    sleep(5)
    puts "Press ENTER to continue"
    gets
    @menu_loop = false
  end

  def respond_to_explore_the_room_pt2(second)
    if second == 'yes'
      if_not_ready
      true
    elsif second == 'no'
      puts tab + 'story for if you do not continue after hitting explore the room'
      sleep(4)
      @menu[0] = 'Try for the arch again'
      true
    else
      puts 'Error. Try again'
      false  
    end
  end 

  def use_the_syringe
    puts tab + 'story for what happens if you use the syringe'
    sleep(5)
    puts 'Press ENTER to continue'
    gets
    @menu_loop = false
  end

  def drink_from_the_bottle
    puts tab + 'story for what happens if you drink from the bottle.'
    sleep(5)
    @menu.delete('Drink from the bottle')
    @choices_made[:bottle] = true
    true
  end

  def swallow_the_pill
    puts tab + 'story for what happens if you swallow the pill.'
    sleep(5)
    @menu.delete('Swallow the pill capsule')
    @choices_made[:pill] = true
    true
  end

  # def try_for_the_arch_again
  #   elsif !@choices_made[:pill] && @choices_made[:bottle]
  #   elsif @choices_made[:pill] && @choices_made[:bottle]
  #   else
  #     if_not_ready

  #   end

  # end
end
