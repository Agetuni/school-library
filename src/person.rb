require './decorator'
require './rental'

class Person
  include Decorator

  # rubocop:disable Style/OptionalBooleanParameter
  def initialize(age:, id:, name: 'Unknown', parent_permission: true)
    super()
    @id=id
    @id = rand(1..1000) if @id.nil?
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end
  # rubocop:enable Style/OptionalBooleanParameter

  attr_reader :id
  attr_accessor :name, :age, :rentals, :parent_permission

  def can_use_services?
    return true if of_age? || @parent_permission == true

    false
  end

  def correct_name
    decorated_name(@name)
  end

  def add_rentals(person)
    @rentals.push(person)
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
