if Meteor.isClient
  sizes = new ReactiveDict()

  setH1size = ->
    sizes.set 'h1', $('#h1').css('font-size')
  setPSize = ->
    sizes.set 'p', $('#p').css('font-size')
  setViewportHeight = ->
    sizes.set 'viewportH', window.innerHeight
  setViewportWidth = ->
    sizes.set 'viewportW', window.innerWidth

  Template.type.helpers
    h1: ->
      sizes.get 'h1'
    p: ->
      sizes.get 'p'

    viewportH: ->
      sizes.get 'viewportH'
    viewportW: ->
      sizes.get 'viewportW'

  Template.type.onRendered ->
    setH1size()
    setPSize()
    setViewportHeight()
    setViewportWidth()
    $(window).on 'resize', setH1size
    $(window).on 'resize', setPSize
    $(window).on 'resize', setViewportHeight
    $(window).on 'resize', setViewportWidth
