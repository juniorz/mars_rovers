#!/usr/bin/env ruby

$:.unshift 'lib'
require 'input_processor'

input = STDIN.read

unless input.empty?
  processor = InputProcessor.new(input, STDOUT)
  processor.process
end

