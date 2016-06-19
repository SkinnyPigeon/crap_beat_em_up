require 'pry-byebug'
require_relative 'guy'
require_relative 'arena'
require_relative 'game'


system"clear"
puts "Left: a or l   Right: d or '   Punch: w or p   Kick: s or ;   Block: q or o   Super: e or [ "
puts "Please enter your move: "
hit = gets.chomp

