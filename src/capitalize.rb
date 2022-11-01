require './base_decorator'

class Capitalizer < Decorator
  def correct_name
    @nameable.correct_name.cap
  end
end
