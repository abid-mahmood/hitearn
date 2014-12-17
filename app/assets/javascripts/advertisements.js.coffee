ready = ->
  page = document.location.toString().split('/')[3]
  if page == "advertisements"
    $('.footer-site').css('bottom','-78px')
  else if page == "homes"
    $('.footer-site').css('bottom','-91px')
    console.log 'choko'

  $("#advertisements").on 'click', ->
    window.location = "#{$('#advertisements').data('endpoint')}"

  $("#functional").on 'click', ->
    window.location = "#{$('#functional').data('endpoint')}"

  $("#non-functional").on 'click', ->
    window.location = "#{$('#non-functional').data('endpoint')}"

$(document).ready(ready)
$(document).load(ready)
