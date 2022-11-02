class Classroom
  def initialize(label)
    @label = label
    @students = []
  end

  attr_accessor :label, :students

  def add_student(student)
    @students << student unless @students.include?(student)
    student.update_classroom(self) unless student.classroom == self
  end
end
