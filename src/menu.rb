# rubocop:disable Layout/LineLength
# rubocop:disable Metrics/CyclomaticComplexity
class Menu
  def initialize
    @user_choice = 0
  end

  def menu
    puts "\nPlease choose an option by entering a number:\n
              \n1 - List all books
              \n2 - List all people
              \n3 - Create a person\n4 - Create a book\n5 - Create a rental\n6 - List all rentals for given id\n7 - Exit"
    @user_choice = gets.chomp.to_i
    if @user_choice.between?(1, 7)
      switch_box
    else
      other_case
    end
  end

  def switch_box
    case @user_choice
    when 1
      list_all_books
    when 2
      list_all_people
    when 3
      create_person
    when 4
      create_book
    when 5
      create_rental
    when 6
      list_all_rentals_id
    when 7
      exit_app
    end
  end

  def exit_app
    puts "\nThank you for using this app!\n\n"
    exit
  end

  def other_case
    puts "\nNo comprendo! Try Again, but this time with a valid option from the menu!\n\n"
    menu
  end
end
# rubocop:enable Layout/LineLength
# rubocop:enable Metrics/CyclomaticComplexity
