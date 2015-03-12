###
  First example test to get you started

  USAGE
  - Make sure you have installed all the dependencies
    ( run: npm install )
  - Start testing with Jasmine and auto run the tests with Karma
    ( run: grunt karma )
###

describe 'To test if the main.coffee works', ->
  it 'should add the params', ->
    calculator = new CALCULATOR()
    expect( calculator.add(1, 4, 5) ).toBe( 10 )