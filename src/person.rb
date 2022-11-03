require './nameable'
class Person < Nameable
  include Decorator
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end
  attr_reader :id
  attr_accessor :name, :age, :rentals

  def can_use_services?
    of_age? || @parent_permission == true
    false
  end

  def correct_name
    decorated_name(@name)
  end

  def add_rental(date, book)
    @rentals << Rental.new(book, self, date)
  end

  private

  def of_age?
    @age >= 18
  end
end
