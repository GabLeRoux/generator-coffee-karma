###
  First example test to get you started

  USAGE
  - Make sure you have installed all the dependencies
    ( run: npm install )
  - Start testing with Jasmine and auto run the tests with Karma
    ( run: grunt karma )
###

describe 'The store', ->

  it 'should have a name', ->
    expect( getName() ).toEqual( 'apples' )

  it 'should be adding single products by restocking', ->
    expect( restock( 5 ) ).toBe( 5 )

  it 'should be removing products from stock when sold', ->
    expect( sell( 1 ) ).toBe( 4 )