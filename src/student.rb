equire './person'

class Student < Person
  def initialize(*args, classroom)
    super(*args)
    @classroom = classroom
    update_classroom(@classroom)
  end
  attr_accessor :classroom

  def play_hooky
    '¯(ツ)/¯'
  end

  def update_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
