# Ruby is a dynamic object-oriented language. Everything in Ruby is an object.
# That's being said, one of the key things to understand about Ruby is that it is an object-oriented language,
# and that everything in Ruby is an object. Numbers, strings, arrays - they're all objects.

# -----------------------------------------

# About Basics
# Ruby is a dynamic and strongly typed language. In dynamic languages the type of a variable or object is resolved at runtime,
# which means that its value or type can be changed up to the very last moment (when it gets parsed by the interpreter).
# And what do we mean with strongly typed? Once we know the type of a variable or object,
# Ruby is strict about what you can do with it, for example:
x = '2'
y = x + 'n'
# =>  '2n'

# But

x = '2'
y = x + 2
# => TypeError (no implicit conversion of Integer into String)

# Remember, in Ruby everything is an object. Even classes are instances of the class Class. For example:
1.class
# => Integer

Integer.is_a?(Object)
# => true

Class.is_a?(Object)
# => true
# This means that we can also define classes like this:
Car = Class.new do
  def run
    'running'
  end
end

Car.new.run
# => 'running'
# Finally, bear in mind that the Integer object holds values that may be defined as one or more (consecutive) digits
# and its methods support many of the mathematical operators.

# Note
# The communication in documentation often will reference instance methods using syntax like Class#method_name
# while class or module level methods are referenced as Class::method_name. The :: is called the Scope Resolution Operator,
# the constant or method at the class or module level being referenced. You will encounter this in the Ruby documentation,
# and in mailing lists and other support areas. You will find that we reference class and
# module methods in our writing as ClassName.method_name or ModuleName.method_name, instead.

# More basic knowledge
# There are two primary ways to assign objects to names in Ruby - using variables or constants.
# Variables are always written in snake case.
# A variable can reference different objects over its lifetime.
# For example, my_first_variable can be defined and redefined many times using the = operator:

# -----------------------------------------

# Variables and Constants
my_first_variable = 1
my_first_variable = "Some string"
my_first_variable = SomeComplexObject.new

# Constants, however, are meant to be assigned once.
# They must start with capital letters and are normally written in block capitals with words separated by underscores.
# For example:

MY_FIRST_CONSTANT = 10

# Redefining not allowed
# MY_FIRST_CONSTANT = "Some String"

# -----------------------------------------

# Classes
# Ruby is organised into classes.
# Classes are defined using the class keyword followed by the name of the class.
# Objects are generally created by instantiating classes using the .new method.
# For example:

# Define a class
class Calculator
  #...
end

# Create an instance of it and assign it to a variable
my_first_calc = Calculator.new

# -----------------------------------------

# Methods
# Units of functionality are encapsulated in methods - similar to functions in other languages.
# A method can optionally be defined with positional arguments, and/or keyword arguments that are defined and called using the : syntax.
# Methods either implicitly return the result of the last evaluated statement, or can explicitly return an object via the return keyword.
# Methods are invoked using . syntax.
class Calculator

  # Unnamed params
  # Positional arguments
  def add(num1, num2)
    return num1 + num2 # Explicit return
  end

  # Named params
  # Keyword arguments
  def multiply(num1:, num2:)
    num1 * num2 # Implicit return
  end
end

calc = Calculator.new
calc.add(1, 3)
calc.multiply(num1: 2, num2: 5)

# -----------------------------------------