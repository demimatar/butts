require_relative 'test'
require_relative 'monster'

class Game
  include Ui
  include Monster

  def initialize
    @monster_menu = [
      'Talk to the monster',
      'Run past the monster',
      'Attack the monster',
      'Do nothing'
    ]

    @menu_loop = true
    @monster_loop = true
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

  def respond_to_new_game(newgame)
    if newgame == 'yes'
      puts 'Let\'s go!!!!!!!!!!!!!!!!!!!!'
      sleep(2)
      return 'yes'      
    end
  end

  def introduction2
    continue = true

    while continue == true
      @menu = [
        'Explore the room',
        'Use the syringe',
        'Drink from the bottle',
        'Swallow the pill capsule',
        'Go back to sleep'
      ]

      @intro_array = [
        {
          text: "\nYou wake up in a dimly lit room.",
          sleep_time: 2
        },
        {
          text: 'The floor is sticky. Everything is sticky.',
          sleep_time: 2.5
        },
        {
          text: 'Is your head pounding... or is that the walls?',
          sleep_time: 2.5
        },
        {
          text: 'On the ground before you lay a syringe, an unlabeled bottle, both filled with an unknown liquid, and a pill capsule.',
          sleep_time: 4
        }
      ]
      display_intro_array(@intro_array)
      main_menu
    end
  end

  def main_menu
    @menu_loop = true

    while @menu_loop == true
      @menu_loop = true
      puts "\nWhat do you do?"
      sleep(0.5)
      display_menu_options(@menu)

      first_story_fork = ask_question('ENTER THE NUMBER ONLY')
      respond_to_first_story_fork(first_story_fork)
    end
  end

  def display_menu_options(menu_options)
    menu_options.each_with_index do |option, index|
      puts tab + "#{index + 1} " + option
    end
  end

  def display_intro_array(intro_array)
    intro_array.each do |option|
      puts option[:text]
      sleep(option[:sleep_time])
    end
  end

  def respond_to_first_story_fork(first)  
    try = @menu.index('Try for the passageway again')
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
      back_to_sleep
    elsif !try.nil? && first == (try + 1).to_s
      try_for_the_arch_again
    else
      puts 'Error. Try again.'   
    end
  end

  def explore_the_room_pt1
    if @choices_made[:bottle]
      puts tab + 'As you stand, you notice that you are without clothes or shoes. The room smells like vomit. You are covered in a sticky, rubbery mucus that you can\'t wipe off, despite all of your efforts. The mucus is dark red, almost black. It appears to be materializing from the floor and the walls which are the same color. As you walk, your feet sink slightly into the floor with each step. Is your head pounding... or is that the walls?'
      puts tab + 'The room is vast. Looking up, you can see only darkness. As you continue forward, you see what looks like an arch in the distance. As you approach, you realize that the arch is an entrance to a passageway. The mucus is getting thicker, and it is becoming hard to walk through.'
      puts tab + 'You reach the passageway, but beyond it, you only see darkness. You take a few steps into the abyss, pulling your feet free one at a time from the sticky mucus only to plunge them right back in.'
    else
      puts tab + 'As you stand, you notice that you are without clothes or shoes. The room is warm and very humid. It smells like vomit. You are covered in a sticky, rubbery mucus that you can\'t wipe off, despite all of your efforts. The mucus is dark red, almost black. It appears to be materializing from the floor and the walls which are the same color. As you walk, your feet sink slightly into the floor. Is your head pounding... or is that the walls?'
      puts tab + 'The room is vast. Looking up, you can only see darkness. As you continue forward, you see what looks like an arch in the distance. The closer you get to the arch, the warmer the room becomes. It is getting hard to breathe. The arch is the entrance to a passageway. You see that now. The mucus is getting thicker, and it is becoming hard to walk through. You are sweating now. The air is so thick here.'
      puts ''
    end
    loop do
      explore_the_room_pt2 = ask_question('Shall you continue forward?')
      break if respond_to_explore_the_room_pt2(explore_the_room_pt2.downcase) != false
    end  
  end

  def if_not_ready
    puts tab + 'You trudge through the mucus, breathing heavily. You can\'t seem to get enough air in your lungs. You reach the passageway, but beyond it, you see only darkness. You take a few steps into the abyss, pulling your feet free one at a time from the sticky mucus only to plunge them right back in, but the effort required to continue is too great and now you can\'t breathe at all. You collapse.'
    sleep(20)
    puts tab*6 + 'GAME OVER'
    sleep(3)
    puts "Press ENTER to continue"
    gets
    display_intro_array(@intro_array)
  end

  def respond_to_explore_the_room_pt2(second)
    if second == 'yes' && !@choices_made[:bottle]
      if_not_ready
      true
    elsif second == 'yes' && @choices_made[:bottle]
      puts tab + 'This is where the stench is coming from. It smells sour, putrid, like fermented meat. It clouds your brain, and your eyes water. With every breath you can taste it in the back of your tongue. With every step it gets stronger. With eyes like saucers, you attempt to see, but the light eludes you. You walk with hands outstretched, trying your best to stay erect despite the thick layer of muck now enveloping halfway up your shins.'
      puts tab + 'And then you hear it. Gurgling. Bubbling. Popping. It\'s in front of you and it\'s moving. It\'s not walking; it sounds like it is sliding toward you, like a slug, with rhythmic waves of muscular contraction. You can hear the sticky phlegm lodged in its throat as it breathes. You can smell its breath and you know it is right in front of you.' 
      sleep(38)
      if_drank_bottle 
    elsif second == 'no'
      puts tab + 'You head back to where you first regained consciousness.'
      sleep(2)
      @menu[0] = 'Try for the passageway again'
      true
    else
      puts 'Error. Try again'
      false  
    end
  end 

  def use_the_syringe
    puts tab + 'You see that you are not wearing any clothes or shoes, and there is nothing nearby that could be used as a tourniquet. Your body is covered in a sticky, rubbery mucus, and no matter how hard you try, you can’t wipe it off. The needle is covered in the same sticky, rubbery mucus. You decide to try a vein closest to your wrist. You insert and flag the needle. You see your blood flow into the syringe. You slowly inject yourself. You instantly feel calm, heavy, familiar. It\'s becoming difficult to keep your eyes open. You nod off.'
    sleep(25)
    puts tab*6 + 'GAME OVER'
    sleep(3)
    puts 'Press ENTER to continue'
    gets
    display_intro_array(@intro_array)
  end

  def drink_from_the_bottle
    puts tab + 'You unscrew the cap. The liquid is green and somewhat luminescent. It has a foul, garlic-like odor, but it\'s also fragrant. It\'s nauseating. Where have you smelled this before? Luckily, the bottle is small and you down it in one gulp.'
    puts tab + 'The liquid was cold. It moves down your throat and your throat becomes cold, numb. It moves to your stomach and your stomach becomes cold, numb. The cold spreads. Each breath you take is sharp but somewhat refreshing. You touch your face. Your fingers can\'t feel your face, and neither can your face feel your fingers.'
    sleep(27)
    @menu.delete('Drink from the bottle')
    @choices_made[:bottle] = true
    true
  end

  def swallow_the_pill
    puts tab + 'The capsule is orange and blue. It\'s about an inch in length and it’s covered in a sticky, rubbery mucus. You put the capsule in your mouth. It tastes sour. You swallow it. It forms a lump in your throat, and you have to swallow a few more times to get it down. You immediately feel nauseous. It\'s unpleasant but not overwhelming.'
    puts tab + 'A few minutes pass. Was that the pill\'s only effect? The longer you wait, the more you are convinced of this.'
    sleep(25)
    @menu.delete('Swallow the pill capsule')
    @choices_made[:pill] = true
    true
  end

  def back_to_sleep
    sleep_text = tab + 'You lay back down and close your eyes. Maybe this is just a dream. You can deal with it in the morning.'
    
    if @choices_made[:bottle]
    puts sleep_text
    sleep(4)
    display_intro_array(@intro_array)
    @menu.delete('Drink from the bottle')
    elsif @choices_made[:pill]
      puts sleep_text
    sleep(4)
    display_intro_array(@intro_array)
    @menu.delete('Swallow the pill capsule')
    end
  end

  def try_for_the_arch_again
    if @choices_made[:bottle]
      puts tab + 'As you head toward where you saw the passageway, you realize that you are no longer bothered by the warmth in the room, in fact, you can\'t even feel it. You can breathe easily even with the extra effort of navigating through the mucus. You reach the passageway and continue through it into the darkness.' 
      respond_to_explore_the_room_pt2('yes')
    else
      if_not_ready
    end
  end
end
