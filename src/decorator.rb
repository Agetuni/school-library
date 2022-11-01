module Decorator
  def correct_name(name)
    trimmer(capitalizer(name))
  end

  def capitalizer(name)
    name.to_s.capitalize
  end

  def trimmer(name)
    name[0..9]
  end
end
