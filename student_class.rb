# frozen_string_literal: true

class Student
  def initialize(name, grade)
    @name = name
    @grade = grade
  end

  def better_grade_than?(other_student)
    grade > other_student.grade
  end

  protected

  attr_reader :grade
end

class Person
  def initialize(name)
    @name = name
  end

  def hi
    puts "Hi, my name is #{@name}"
  end
end

bob = Person.new('Bob')
bob.hi

joe = Student.new('Joe', 90)
bob = Student.new('Bob', 84)
puts 'Well Done!' if joe.better_grade_than?(bob)
