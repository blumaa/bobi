require_relative '../config/environment'



def welcome
    font = TTY::Font.new(:doom)
    pastel = Pastel.new
    system 'clear'
    puts pastel.red(font.write("                                  BOBI            "))
end

#LOGIN

def login
    user = nil
    puts "enter your username"
    input = gets.chomp
    user = User.find_by(name:input)
    if user
        puts "welcome to bobi #{user.name}"
        menu(user)
    else
        puts "can't find user. would you like to create new user? Enter yes or no."
        input = gets.chomp
        case input
        when "yes"
            puts "enter a username:"
            username = gets.chomp
            user = User.all.find_by(name: username)
            if user
                puts "username already taken"
                login
            else
                user = User.create(name: username)
                puts "Your username is #{user.name}."
                menu(user)
            end
        when "no"
            login
        end
    end
    # binding.pry
end


#MENU

def menu(user)
    prompt = TTY::Prompt.new
    system 'clear'
    
    menu = %w(Babies Activities Log_Out Exit)
    
    input = prompt.select("You are at the main menu. Please select an option:", menu)
    
    case input
    when "Babies"
        babies(user)
    when "Activities"
        activities(user)
    when "Log_out"
        login
    when "Exit"
        exit
    end 
end

def logout
    login
end

#BABIES

def babies(user)
    prompt = TTY::Prompt.new
    # system 'clear'
    user.reload
    
    menu = %w(View Add Edit Delete Back)

    input = prompt.select("You are at the BABIES menu. Please select an option:", menu)

    case input
    when "View"
        view_babies(user)
        babies(user)
    when "Add"
        puts "adding baby"
        add_baby(user)
    when "Edit"
        puts "edit baby"
        edit_baby(user)
    when "Delete"
        puts "delete baby"
        destroy_baby(user)
    when "Back"
        menu(user)
    end
end


def view_babies(user)
    user.reload
    puts "your babies are:"
    user.babies.select do |baby|
        puts baby.name
        puts baby.birth_date
        puts baby.sex
    end
    
    # babies(user)
end


def select_baby(user)
    prompt = TTY::Prompt.new
    puts " "
    # binding.pry
    view_babies(user)
    puts "which baby would you like to select?"
    baby = user.babies
    menu = baby.map do |babe|
        babe.name
    end
    puts " "
    answer = prompt.select("Select a baby", menu, %w(Back_To_Main_Menu))
    if answer == "Back_To_Main_Menu"
        system "clear"
        main_menu
    end
    baby = Baby.all.find_by(name: answer)
    puts "You have selected #{baby.name}"
    baby
end

    
def add_baby(user)
    puts "create a new baby!"
    puts "what is your baby's name?"
    name = gets.chomp
    baby_name = Baby.all.find_by(name: name)
    if baby_name
        puts "baby already exists. please enter different name."
        add_baby(user)
    else
        puts "what is your baby's birthday?"
        birth_date = nil
        while birth_date == nil
            birth_date = gets.chomp
            birth_date = valid_date_time(birth_date)
        end
        puts "what is the sex of the baby?"
        sex = gets.chomp
        new_baby = Baby.create(name: name, birth_date: birth_date, sex: sex)
        puts "congrats! your new baby is called #{new_baby.name}. It was born #{new_baby.birth_date}. It's sex is #{new_baby.sex}."
        user.babies << new_baby
        view_babies(user)
        babies(user)
    end
end

def edit_baby(user)
    prompt = TTY::Prompt.new
    baby = select_baby(user)
    menu = baby.attributes.keys
    answer = prompt.select("What about the baby would you like to edit?", menu)
    
    case answer
    when "id"
        puts "You can't edit baby's id."
        edit_baby(user)
    when "name"
        puts "enter a new name:"
        baby_name = gets.chomp
        if baby_name
            puts "baby already exists. please enter different name."
            edit_baby(user)
        else
            baby.name = baby_name
            baby.save
            puts "the baby's new name is #{baby.name}"
            # binding.pry
            baby.reload
            babies(user)
        end
    when "birth_date"
        puts "enter a new birth date:"
        birth_date = nil
        while birth_date == nil
            birth_date = gets.chomp
            birth_date = valid_date_time(birth_date)
        end
        baby.birth_date = birth_date
        baby.save
        puts "baby's new birth date is #{baby.birth_date}."
        # binding.pry
        baby.reload
        babies(user)
    when "due_date"
    when "sex"
    end

end

def destroy_baby(user)
    prompt = TTY::Prompt.new
    baby = select_baby(user)
    baby.destroy
    babies(user)
    # binding.pry
    # answer = prompt.select("What about the baby would you like to edit?", menu)

end



#ACTIVITIES

def activities(user)
    puts "you are at activities"
    baby = select_baby(user)
    
end

#HELPER METHODS

def valid_date_time(datetime)
    begin
        DateTime.strptime(datetime,'%d-%m-%Y %I:%M %p')
    rescue ArgumentError
        puts "Entry invalid. Please enter valid datetime DD-MM-YYYY HH:MM AM/PM"
    end
end

#RUN

welcome
login




















true

# def welcome
#     spinner = TTY::Spinner.new("Loading App :spinner ... ", format: :spin_2)
#     8.times do
#     spinner.spin
#     sleep(0.1)
#     end
#     spinner.stop('done loading.')
#     puts " "
#     puts "Welcome to the Baby Activity Tracker"
#     puts " "
# end

# def main_menu
#     # puts " "
#     prompt = TTY::Prompt.new
    
#     menu = %w(Babies Activity_Menu Resources Log_Out Exit)

#     selection = prompt.select("You are at the main menu. Please select an option:", menu)
#     # conditionals dictating where to go.

#     case selection 
#     when "Babies"
#         system 'clear'
#         User.babies
#     when "Activity_Menu"
#         system 'clear'
#         User.activity_menu
#     when "Resources"
#         system 'clear'
#         resources
#     when "Log_Out"
#         font = TTY::Font.new(:doom)
#         pastel = Pastel.new
#         system 'clear'
#         puts "Logged out"
#         sleep (2)
#         system 'clear'
#         puts " "
#         puts pastel.red(font.write("                                  BOBI            "))
#         puts pastel.red(font.write("The     Baby    Activity"))
#         puts pastel.red(font.write("                           Tracker"))
#         # welcome
#         logout
#     when "Exit"
#         system 'clear'
#         # puts " "
#         puts "Thank you for using Baby Activity Tracker. Bye for now!"
#         puts " "
#         exit
#     else
#         main_menu
#     end
# end 

# welcome
# User.login
