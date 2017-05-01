# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


document.onscroll = ->
  if $(window).scrollTop() > $('.titulo').height()
    $('nav > div.navbar').removeClass('navbar-static-top').addClass 'navbar-fixed-top'
  else
    $('nav > div.navbar').removeClass('navbar-fixed-top').addClass 'navbar-static-top'
  return

images = new Array('jascha-huisman-74571.jpg', 'jason-briscoe-104292.jpg', 'kari-shea-109894.jpg')
nextimage = 0

doSlideshow = ->
  if nextimage >= images.length
    nextimage = 0
  $('.titulo').css('background-image', 'image-url("' + images[nextimage++] + '")').fadeIn 500, ->
    setTimeout doSlideshow, 1000
    return
  return

doSlideshow()
