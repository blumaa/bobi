class User < ActiveRecord::Base
    has_many :baby_users
    has_many :babies, through: :baby_users

end

# def initialize
#     @name = name
# end




def login
    binding.pry
    puts "enter a user name:"
    user = gets.chomp
end



# @todays_day = Time.now.day
# @todays_month = Time.now.month 
# @todays_year = Time.now.year

# def self.reload
#     reset
#     load
# end

    # def is_it_date_time?(time)
    #     begin
    #         DateTime.strptime(time,'%d-%m-%Y %I:%M:%S %p')
    #     rescue ArgumentError
    #        puts "Entry invalid. Please enter valid datetime DD-MM-YYYY HH:MM:SS AM/PM"
    #     end
    # end

    # def self.add_activity
    #     # binding.pry
    #     prompt = TTY::Prompt.new
    #     system 'clear'
    #     baby = @current_user.select_baby
    #     # binding.pry
    #     baby_object = Baby.find_by(name: baby)
    #     puts "You have selected #{baby_object.name}"
    #     activity = prompt.select("Please select an activity", %w(Feeding Sleep Diaper_change Bath Main_Menu))
    #     #icebox - write each of this in its own method
    #     if activity == "Feeding"
    #         puts "Time of feeding? (DD-MM-YYYY HH:MM:SS AM/PM)"
    #         start_time = nil
    #         while start_time == nil
    #             start_time = gets.chomp
    #             start_time = @current_user.is_it_date_time?(start_time)
    #         end
    #         puts "What was the amount?"
    #         amount = gets.chomp
    #         puts "any notes?"
    #         notes = gets.chomp
    #         new_feeding = Activity.create(name: activity, start_time: start_time, amount: amount, notes: notes)
    #         baby_object.activities << new_feeding
    #         puts "For #{baby_object.name}, you added the activity: #{new_feeding.name}, time: #{new_feeding.start_time}, amount: #{new_feeding.amount}, notes: #{new_feeding.notes}"
    #         # puts new_feeding
    #         # puts baby_object.activities
    #         main_menu

    #     elsif activity == "Sleep"

    #         puts "What time did the baby go to sleep? (DD-MM-YYYY HH:MM:SS AM/PM)"
    #         start_time = nil
    #         while start_time == nil
    #             start_time = gets.chomp
    #             start_time = @current_user.is_it_date_time?(start_time)
    #         end
    #         puts "What time did the baby wake up? (DD-MM-YYYY HH:MM:SS AM/PM)"
    #         end_time = nil
    #         while end_time == nil
    #             end_time = gets.chomp
    #             end_time = @current_user.is_it_date_time?(end_time)
    #         end
    #         puts "any notes?"
    #         notes = gets.chomp
    #         new_sleep = Activity.create(name: activity, start_time: start_time, end_time: end_time, notes: notes)
    #         # binding.pry
    #         baby_object.activities << new_sleep
    #         puts "For #{baby_object.name}, you added the activity: #{new_sleep.name}, start time: #{new_sleep.start_time}, end time: #{new_sleep.end_time}, notes: #{new_sleep.notes}"
    #         # puts new_sleep
    #         # puts baby_object.activities
    #         main_menu

    #     elsif activity == "Diaper_change"

    #         puts "What time did you change the diaper? (DD-MM-YYYY HH:MM:SS AM/PM)"
    #         start_time = nil
    #         while start_time == nil
    #             start_time = gets.chomp
    #             start_time = @current_user.is_it_date_time?(start_time)
    #         end
    #         puts "How was the baby's diaper?"
    #         diaper_status = gets.chomp
    #         puts "any notes?"
    #         notes = gets.chomp
    #         new_diaper = Activity.create(name: activity, start_time: start_time, diaper_status: diaper_status, notes: notes)
    #         # binding.pry
    #         baby_object.activities << new_diaper
    #         puts "For #{baby_object.name}, you added the activity: #{new_diaper.name}, start time: #{new_diaper.start_time}, diaper status: #{new_diaper.diaper_status}, notes: #{new_diaper.notes}"
    #         # puts new_diaper
    #         # puts baby_object.activities
    #         main_menu

    #     elsif activity == "Bath"

    #         puts "What time was the bath? (DD-MM-YYYY HH:MM:SS AM/PM)"
    #         start_time = nil
    #         while start_time == nil
    #             start_time = gets.chomp
    #             start_time = @current_user.is_it_date_time?(start_time)
    #         end
    #         puts "How long was the bath?"
    #         duration = gets.chomp
    #         puts "any notes?"
    #         notes = gets.chomp
    #         new_bath = Activity.create(name: activity, start_time: start_time, duration: duration, notes: notes)
    #         # binding.pry
    #         baby_object.activities << new_bath
    #         puts "For #{baby_object.name}, you added the activity: #{new_bath.name}, start time: #{new_bath.start_time}, duration: #{new_bath.duration} notes: #{new_bath.notes}"
    #         # puts new_bath
    #         # puts baby_object.activities
    #         main_menu
    #     elsif activity == "Main_Menu"
    #         main_menu
    #     else
    #         "invalid input, try again"
    #         self.select_activity
    #     end
    # end

    # def test_method
    #     @selected_baby.activities.select do |activity|
    #         activity.start_time != nil && activity.start_time.day == 2
    #     end
    # end

    # def self.view_activities
    #     # system 'clear'
    #     prompt = TTY::Prompt.new
    
    #     if @current_user.babies.count == 1 
    #         @selected_baby = @current_user.babies.first
    #         selection = prompt.select("How would you like to view activities?", %w[All For_Today 7_day Back])

    #     else
    #         baby_selection = @current_user.select_baby
    #         puts "Selected #{baby_selection}."
    #         @selected_baby = Baby.find_by(name: baby_selection)
    #         selection = prompt.select("How would you like to view activities?", %w[All For_Today 7_day Back])
    #     end
        
    #     case selection 
    #     when "All"
    #         system "clear"
    #         puts " "
    #         if Activity.all.where(baby_id: @selected_baby).empty?
    #             puts 'No activities'
    #         else
    #     tp all_activities = Activity.all.where(baby_id: @selected_baby.id), :start_time, :end_time, :name, :diaper_status, :notes
    #         end
    #     User.view_activities

    #     when "For_Today"
            
    #     when "7_day"

    #     when "Back"
    #         main_menu
    #     else
    #         exit
    #     end
    
    # end
