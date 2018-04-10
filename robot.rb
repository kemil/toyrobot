class Robot
require 'commands'
include Commands

  def initialize(board_size=5, output=STDOUT)
    @board_size = board_size
    @output = output
  end

  def execute(cmd)
    cmd = cmd.strip.downcase
    op, args = cmd.split(/\s+/, 2)
    args = args.split(/\s*,\s*/) if args

    raise InvalidCommand.new unless Commands.public_method_defined?(op)
    begin
      send(op, *args)
    rescue ArgumentError
      raise InvalidCommand.new
    end
  end

  def execute_script(io)
    io.each_line do |line|
      begin
        execute(line)
      rescue InvalidCommand
        puts "Command Ignored"
      end
    end
  end

  private
  def validate(x, y, f)
    raise InvalidCommand.new unless x && y && f
    raise InvalidCommand.new unless (0..@board_size) === x
    raise InvalidCommand.new unless (0..@board_size) === y
  end
end
