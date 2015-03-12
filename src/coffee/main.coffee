###
  First example class to get you started.

  Test file in test/coffee/main.test.coffee
###

class CALCULATOR
  constructor: () ->
#   Set @sum property to 0 when started
    @sum = 0

# Method to calculate new @sum
  add: () ->
    parent = @

#   Loop through the parameters and add them to @sum
    for number in arguments
      do ( number ) ->
        parent.sum += number

#   Return the calculated sum
    @sum
