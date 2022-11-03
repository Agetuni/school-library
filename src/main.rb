#!/usr/bin/env ruby

require './app'
def main
  app = App.new
  puts "\nWelcome to School Library App!\n\n"
  app.run
end

main
