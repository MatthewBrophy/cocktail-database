#!/usr/bin/env ruby
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require_relative "../db/seeds.rb"
require 'pp'
require_relative "../app/models/drink.rb"


puts "does run.rb have Drink?"
#puts Drink

welcome

Pry.start
