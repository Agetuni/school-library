equire './person'

class Student < Person
  def initialize(*args, classroom)
    super(*args)
    @classroom = classroom
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
