# Instructions
# In this exercise you'll be processing log-lines.
#
# Each log line is a string formatted as follows: "[<LEVEL>]: <MESSAGE>".
#
# There are three different log levels:
#
# INFO
# WARNING
# ERROR
#
# You have three tasks, each of which will take a log line and ask you to do something with it.
# There are lots of ways to solve these tasks - choose your favourite methods from the examples above and see what you can come up with.
#
# Implement the LogLineParser#message method to return a log line's message:
#
# LogLineParser.new('[ERROR]: Invalid operation').message
# => "Invalid operation"
#
# Any leading or trailing white space should be removed:
# LogLineParser.new("[WARNING]:  Disk almost full\r\n").message
# => "Disk almost full"
#
# Implement the LogLineParser#log_level method to return a log line's log level, which should be returned in lowercase:
#
# LogLineParser.new('[ERROR]: Invalid operation').log_level
# => "error"
#
# Implement the LogLineParser#reformat method that reformats the log line, putting the message first and the log level after it in parentheses:
#
# LogLineParser.new('[INFO]: Operation completed').reformat
# => "Operation completed (info)"

#---------- 1st solution (all 11 tests are passed) ----------

class LogLineParser

  def initialize(line)
    @line = line
  end

  def message
    @line.split(':')[1].strip
  end

  def log_level
    @line.split(':')[0][1...-1].downcase
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

#---------- 2nd solution (all 11 tests are passed) ----------

class LogLineParser
  attr_reader :message, :log_level

  def initialize(line)
    message_string = /\[(?<log_level>[A-Z]+)\]:\s*(?<message>[\w| ]+\b)/.match(line)
    @log_level = message_string[:log_level].downcase
    @message = message_string[:message]
  end

  def reformat
    "#{@message} (#{@log_level})"
  end
end

#---------- 3rd solution (all 11 tests are passed) ----------

class LogLineParser

  attr_reader :message, :log_level

  REGULAR_EXPRESSION = {
    message_and_level: /\[(?<log_level>[A-Z]+)\]:\s*(?<message>[\w| ]+\b)/
  }

  def initialize(line)
    message_string = REGULAR_EXPRESSION[:message_and_level].match(line)
    @log_level = message_string[:log_level].downcase
    @message = message_string[:message]
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

#---------- 4th solution (all 11 tests are passed) ----------

class LogLineParser
  attr_reader :message, :log_level
  REGULAR_EXPRESSION = {
    message_and_level: /\[(?<log_level>[A-Z]+)\]:\s*(?<message>[\w| ]+\b)/
  }

  RE = REGULAR_EXPRESSION
  private_constant :RE

  def initialize(line)
    matches = RE[:message_and_level].match(line)
    @log_level = matches[:log_level].downcase
    @message = matches[:message]
  end

  def reformat
    "#{message} (#{log_level})"
  end
end

#---------- 5th solution (all 11 tests are passed) ----------

class LogLineParser

  REGULAR_EXPRESSION = {
    message_and_level: /\[(?<log_level>[A-Z]+)\]:\s*(?<message>[\w| ]+\b)/
  }

  RE = REGULAR_EXPRESSION
  private_constant :RE

  def initialize(line)
    matches = RE[:message_and_level].match(line)
    @log_level = matches[:log_level].downcase
    @message = matches[:message]
  end

  public

  attr_reader :message, :log_level

  def reformat
    '%s (%s)' % [message, log_level]
  end
end
