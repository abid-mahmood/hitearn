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
    window.location = "#{$('#all-customers').data('endpoint')}"

  $('#reg-users').on 'click', ->
    window.location = "#{$('#reg-users').data('endpoint')}"

  $("#unreg-users").on 'click', ->
    window.location = "#{$('#unreg-users').data('endpoint')}"

  $("#create-adv").on 'click', ->
    window.location = "#{$('#create-adv').data('endpoint')}"

  $("#complete-payment").on 'click', ->
    window.location = "#{$('#complete-payment').data('endpoint')}"

  $("#pending-payment").on 'click', ->
    window.location = "#{$('#pending-payment').data('endpoint')}"

  $("#payments").on 'click', ->
    window.location = "#{$('#payments').data('endpoint')}"

  $("#new-payment").on 'click', ->
    window.location = "#{$('#new-payment').data('endpoint')}"

$(document).ready(ready)
$(document).load(ready)
