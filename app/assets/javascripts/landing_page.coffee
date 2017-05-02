# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$ ->
  offset = undefined
  scroll_start = undefined
  startchange = undefined
  startch = undefined
  offs = undefined
  scroll_start = 0
  startchange = $('#que')
  startch =  $('#como')
  offset = startchange.offset()
  offs = startch.offset()

  if startchange.length && startch.length
    $(document).scroll ->
      scroll_start = $(this).scrollTop()
      if scroll_start > offset.top-1
        $('.navbar-default').css 'background-color', '#131f28'
        if scroll_start < offs.top
          $('#liInicio').removeClass 'active'
          $('#liQue').addClass 'active'
          $('#liComo').removeClass 'active'
        else
          $('#liInicio').removeClass 'active'
          $('#liQue').removeClass 'active'
          $('#liComo').addClass 'active'
      else 
        $('.navbar-default').css 'background-color', 'transparent'
        $('#liInicio').addClass 'active'
        $('#liQue').removeClass 'active'
        $('#liComo').removeClass 'active'
      return
  return

cycleBackgrounds = ->
  index = 0
  $imageEls = $('.toggle-image')
  # Get the images to be cycled.
  setInterval (->
    # Get the next index.  If at end, restart to the beginning.
    index = if index + 1 < $imageEls.length then index + 1 else 0
    # Show the next image.
    $imageEls.eq(index).addClass 'show'
    # Hide the previous image.
    $imageEls.eq(index - 1).removeClass 'show'
    return
  ), 10000
  return

$ ->
  cycleBackgrounds()
  return

scrollOnClickQue = ->
  offset = undefined
  offset = 0
  $('html, body').animate { scrollTop: $('#que').offset().top + offset }, 1400
  return

$ ->
  $('#linkQue, #flechitaL').on 'click', ->
    scrollOnClickQue()
    return

scrollOnClickComo = ->
  offset = undefined
  offset = 125
  $('html, body').animate { scrollTop: $('#como').offset().top + offset }, 1400
  return

$ -> 
  $('#linkComo').on 'click', ->
    scrollOnClickComo()
    return
