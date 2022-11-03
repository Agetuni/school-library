require './nameable'
class Decorator < Nameable
  def initialize(_nameable)
    super()
    @nameable = Nameable
  end

  def decorated_name
    @nameable.correct_name
  end
end
