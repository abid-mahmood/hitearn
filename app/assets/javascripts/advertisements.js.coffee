ready = ->
  page = document.location.toString().split('/')[3]
  if page == "advertisements"
    $('.footer-site').css('bottom','-78px')
  else if page == "homes"
    $('.footer-site').css('bottom','-91px')

  $("#advertisements").on 'click', ->
    window.location = "#{$('#advertisements').data('endpoint')}"

  $("#functional").on 'click', ->
    window.location = "#{$('#functional').data('endpoint')}"

  $("#non-functional").on 'click', ->
    window.location = "#{$('#non-functional').data('endpoint')}"

  $('#all-customers').on 'click', ->
    console.log 'All Before'
    window.location = "#{$('#all-customers').data('endpoint')}"
    console.log 'All After'

  $('#reg-users').on 'click', ->
    console.log 'register before'
    window.location = "#{$('#reg-users').data('endpoint')}"
    console.log 'register after'

  $("#unreg-users").on 'click', ->
    console.log 'unregister b4'
    window.location = "#{$('#unreg-users').data('endpoint')}"
    console.log 'unreg after'

  $("#create-adv").on 'click', ->
    console.log 'adver b4'
    window.location = "#{$('#create-adv').data('endpoint')}"
    console.log 'advert after'

$(document).ready(ready)
$(document).load(ready)
