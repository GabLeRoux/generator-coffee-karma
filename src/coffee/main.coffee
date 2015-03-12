root = exports ? this
###
  Create stock of apples.
  Use the item class created in example.class.coffee
###

stock = new root.ITEM( 'apples' )

# Get the name of the stock
getName = () ->
  @stock.name

# Add more apples to stock
restock = ( amount ) ->
  @stock.add( amount )


# Remove apples from stock
sell = ( amount ) ->
  @stock.remove( amount )