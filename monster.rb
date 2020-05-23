module Monster
  def if_drank_bottle
    @monster_loop = true

    while @monster_loop == true
      @monster_loop = true
      puts "\nWhat do you do?"
      display_menu_options(@monster_menu)

      monster_intro = ask_question('ENTER THE NUMBER ONLY')
      respond_to_monster_intro(monster_intro)
    end
  end
end

def respond_to_monster_intro(choice)
    talk = @monster_menu.index("Talk to the monster")
    run = @monster_menu.index('Run past the monster')
    attack = @monster_menu.index('Attack the monster')
    nothing = @monster_menu.index('Do nothing')

    if !talk.nil? && choice == (talk + 1).to_s
      talk_to_the_monster
    elsif !run.nil? && choice == (run + 1).to_s
      run_past_the_monster
    elsif !attack.nil? && choice == (attack + 1).to_s
      attack_the_monster
    elsif !nothing.nil? && choice == (nothing + 1).to_s
      do_nothing
    else
      puts 'Error. Try again.'   
    end
  end

  def talk_to_the_monster
    puts tab + 'story for what happens if you talk to the monster'
    sleep(5)
    puts 'Press ENTER to continue'
    gets
    @monster_loop = false
    @menu_loop = false
  end

  def run_past_the_monster
    puts tab + 'story for what happens if you run past the monster'
    sleep(5)
    puts 'Press ENTER to continue'
    gets
    @monster_loop = false
    @menu_loop = false
  end

  def attack_the_monster
    puts tab + 'story for what happens if you attack the monster'
    sleep(5)
    puts 'Press ENTER to continue'
    gets
    @monster_loop = false
    @menu_loop = false
  end

  def do_nothing
    puts tab + 'story for what happens if you do nothing.'
    
  end