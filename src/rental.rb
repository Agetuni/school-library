class Rental
  def initialize(book, person, date)
    @book = book
    book.rentals << self unless book.rentals.include?(self)
    @person = person
    person.rentals << self unless person.rentals.include?(self)
    @date = date
  end

  attr_accessor :date
end
