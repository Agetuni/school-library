require './nameable'
class Person < Nameable
  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end
  attr_reader :id
  attr_accessor :name, :age

  def can_use_services?
    of_age? || @parent_permission == true
    false
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
