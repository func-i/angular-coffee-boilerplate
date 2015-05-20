'use strict'

LoginPage = ->
  @get = ->
    browser.get BASE_URL + "#/login"

  return @


describe 'Login Page', ->
  loginP = new LoginPage()

  it 'should resolve to the login page', ->
    loginP.get()
    expect(browser.getLocationAbsUrl()).toBe '/login'  

  it 'should allow for a login and redirect to home page', ->
    login()    
    expect(browser.getLocationAbsUrl()).toBe '/home'      