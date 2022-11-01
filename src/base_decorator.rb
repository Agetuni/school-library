require './nameable'
class Decorator < Nameable
  def initialize(_nameable)
    super()
    @nameable = Nameable
  end

  def correct_name
    @nameable
  end
end
