require './person'
class Student < Person
  def initialize(age:, classroom:, id: nil, name: 'Unknown', parent_permission: true)
    super(id: id, name: name, age: age, parent_permission: parent_permission)
    @classroom = classroom
  end

  attr_accessor :classroom

  def play_hooky
    '¯(ツ)/¯'
  end

  def update_classroom(classroom)
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
