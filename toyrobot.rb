$LOAD_PATH << File.expand_path('../', __FILE__)
require 'exception'
require 'robot'
require 'commands'
require 'direction'

Robot.new.execute_script(ARGF)
