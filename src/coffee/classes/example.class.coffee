root = exports ? this

###
  First example class to get you started.

  Test file in test/coffee/main.test.coffee
###

class root.ITEM
  constructor: ( @name ) ->

    # Set @inventory property to 0 when started
    @inventory = 0




  # Method to calculate new @inventory
  add: () ->

    parent = @

    for number in arguments
      do ( number ) ->
        parent.inventory += number

    # Return the new inventory
    @inventory




  # Method to subtract items from the inventory
  remove: () ->

    parent = @

    for number in arguments
      do ( number ) ->
        parent.inventory -= number

    # Return the new inventory
    @inventory