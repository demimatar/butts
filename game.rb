require_relative 'test'

class Game
  include Ui

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
    menu = [
    'Explore the room',
    'Use the syringe',
    'Drink from the bottle',
    'Swallow the pill capsule',
    'Go back to sleep'
    ]

    menu_loop = true

    while menu_loop == true
      puts 'What would you like to do?'
      sleep(1.5)
      display_menu_options(menu)

      first_story_fork = ask_question('ENTER THE NUMBER ONLY')
      menu_loop = respond_to_first_story_fork(first_story_fork)
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
    if first == '1'
      explore_the_room_pt1
    elsif first == '2'
      use_the_syringe
    elsif first == '3'
      drink_from_the_bottle
    elsif first == '5'
      return false
    else
      puts 'Error. Try again.'
    end
  end

  def explore_the_room_pt1
    puts tab + 'story for what happens if you click explore the room'
    puts tab + 'storyyyyyyy'
    puts ''

    explore_the_room_pt2 = ask_question('Shall you continue forward?')
    respond_to_explore_the_room_pt2(explore_the_room_pt2.downcase)
  end

  def respond_to_explore_the_room_pt2(second)
    if second == 'yes'
      puts tab + 'story for if you hit continue after hitting explore the room'
      sleep(5)
      puts "Press ENTER to continue"
      gets
      return false
    elsif second == 'no'
      puts tab + 'story for if you do not continue after hitting explore the room'
      sleep(4)
      return true
    else
      puts 'Error. Try again'  
    end
  end 

  def use_the_syringe
    puts tab + 'story for what happens if you use the syringe'
    sleep(5)
    puts 'Press ENTER to continue'
    gets
    return false
  end

  def drink_from_the_bottle
    puts tab + 'story for what happens if you drink from the bottle.'
    return true
  end

end
