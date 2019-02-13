#!/usr/bin/env ruby
require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"
require 'pp'


welcome

puts get_all_drinks_from_ingredient_list
