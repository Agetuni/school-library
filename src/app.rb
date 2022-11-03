require './student'
require './teacher'
require './book'
require './rental'

# Menu blueprint
# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/MethodLength
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

# Blueprint for the full app
class App < Menu
  def initialize
    super
    @user_choice = 0
    @person_list = []
    @book_list = []
    @rental_list = []
  end

  def list_all_books
    if @book_list.length.zero?
      puts "\nThere aren't any books in here yet! Create a book first!\n\n"
    else
      @book_list.each do |book|
        puts "Title: '#{book.title}', Author: #{book.author}\n"
      end
    end
    menu
  end

  def list_all_people
    if @person_list.length.zero?
      puts "\nThere's nobody here yet! Create a person first!\n\n"
    else
      @person_list.each do |person|
        puts "[#{person.class}] Name: #{person.name} Age: #{person.age}  ID: #{person.id}\n"
      end
    end
    menu
  end

  def create_person
    puts "\nDo you want to create a student (1) or a teacher (2)? [Input the number]:"
    @user_choice = gets.chomp.to_i
    print 'Age:'
    age = gets.chomp.to_i
    print 'Name:'
    name = gets.chomp
    case @user_choice
    when 1
      print 'Has parent permission? [y/n]:'
      permission = gets.chomp
      permission = permission == 'y'
      @person_list << Student.new('none', age, name, permission)
    when 2
      print 'Specialization:'
      specialization = gets.chomp
      @person_list << Teacher.new(age, name, specialization)
    end
    puts "\nPerson created succesfully!\n\n"
    menu
  end

  def create_book
    print "\nTitle:"
    title = gets.chomp
    print 'Author:'
    author = gets.chomp
    @book_list << Book.new(title, author)
    puts "\nBook created succesfully!\n\n"
    menu
  end

  def create_rental
    if @book_list.length.zero?
      puts "\nThere aren't any books to rent! Create a book first!\n\n"
      menu
    else
      puts "\nSelect a book from the following list by number:\n"
      @book_list.each do |book|
        puts "#{@book_list.index(book)}) Title: '#{book.title}', Author: #{book.author}\n"
      end
    end
    book_to_rent = gets.chomp.to_i
    if @person_list.length.zero?
      puts "There is nobody in the system to rent a book! Create a person first!\n\n"
      menu
    else
      puts "\nSelect a person from the following list by number (not id):"
      @person_list.each do |person|
        puts "#{@person_list.index(person)})[#{person.class}] Name: #{person.name}, Age: #{person.age}, ID:#{person.id}"
      end
    end
    person_renting = gets.chomp.to_i
    print 'Date:'
    rental_date = gets.chomp
    @rental_list << Rental.new(@book_list[book_to_rent], @person_list[person_renting], rental_date)
    puts "\nRental created succesfully!\n\n"
    menu
  end

  def list_all_rentals_id
    print "\nID of person:"
    person_id = gets.chomp.to_i
    puts "\nRentals:"
    @person_list.find { |person| person.id == person_id }.rentals.each do |rental|
      puts "Date: #{rental.date}, Book: '#{rental.book.title}' by #{rental.book.author}\n"
    end
    menu
  end

  # rubocop:enable Metrics/CyclomaticComplexity
  # rubocop:enable Metrics/MethodLength
  def run
    menu
  end
end
