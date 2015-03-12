###
  Class test to get you started

  USAGE
  - Make sure you have installed all the dependencies
    ( run: npm install )
  - Start testing with Jasmine and auto run the tests with Karma
    ( run: grunt karma )
###

root = exports ? this

describe 'The item class', ->

  item = null

# Reset the item before each test
  beforeEach () ->
    item = new root.ITEM( 'sneakers' )
    item.add( 5 )

  it 'should get the name of the item', ->
    expect( item.name ).toEqual( 'sneakers' )

  it 'should add the amount of items and return the new count', ->
    expect( item.add(1, 4, 5) ).toBe( 15 )

  it 'should subtract the amount of items and return the new count', ->
    expect( item.remove(2) ).toBe( 3 )