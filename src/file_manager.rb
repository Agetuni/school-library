require 'json'
require './student'
require './rental'
require './book'
require './teacher'
require './classroom'

module Persist
  def load_people
    if File.exist?('people.json')
      JSON.parse(File.read('people.json')).map do |people|
        if people['instance'] == 'teacher'
          teacher = Teacher.new(age: people['age'], id: people['id'], name: people['name'],
                                specialization: people['specialization'])
          teacher
        else
          parent_permission = people['permission'] && true
          student = Student.new(age: people['age'], id: people['id'], name: people['name'],
                                parent_permission: parent_permission, classroom: people['classroom'])
          student
        end
      end
    else
      []
    end
  end

  def load_books
    file = 'books.json'
    if File.exist? file
      JSON.parse(File.read(file)).map do |book|
        Book.new(book['title'], book['author'])
      end
    else
      []
    end
  end

  def find_person(id)
    @person_list.each { |person| return person if person.id == id }
  end

  def find_book(title)
    @book_list.each { |book| return book if book.title == title }
  end

  def load_rentals
    file = 'rentals.json'
    if File.exist? file
      
      JSON.parse(File.read(file)).map do |rental|
        date = rental['date']
        person = find_person(rental['person'])
        book = find_book(rental['book'])
        Rental.new(book,person,date )
      end
    else
      []
    end
  end

  def save_people
    json = []
    @person_list.each do |people|
      if people.instance_of?(Teacher)
        json.push({ instance: 'teacher', id: people.id, age: people.age, name: people.name,
                    specialization: people.specialization })
      else
        json.push({ instance: 'student', id: people.id, age: people.age, name: people.name,
                    permission: people.parent_permission, classroom: people.classroom })
      end
    end
    open('people.json', 'w') { |f| f.write JSON.generate(json) }
  end

  def save_rental
    json = []
    @rental_list.each do |rental|
      json.push({ date: rental.date, person: rental.person.id, book: rental.book.title })
    end
    open('rentals.json', 'w') { |f| f << JSON.generate(json) }
  end
  def save_books
    json = []
    @book_list.each do |book|
      json.push({ title: book.title, author: book.author })
    end
    open('books.json', 'w') { |f| f << JSON.generate(json) }
  end

  def persist_data
    save_people unless @person_list.empty?
    save_books unless @book_list.empty?
    save_rental unless @rental_list.empty?
  end
end