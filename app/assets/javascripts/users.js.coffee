# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  # if $('body').is 
  $('#all-customers').on 'click', ->
    window.location = "#{$('#all-customers').data('endpoint')}"

  $('#reg-users').on 'click', ->
    window.location = "#{$('#reg-users').data('endpoint')}"

  $("#unreg-users").on 'click', ->
    window.location = "#{$('#unreg-users').data('endpoint')}"

  $("#create-adv").on 'click', ->
    window.location = "#{$('#create-adv').data('endpoint')}"

load = ->
  window.location.reload()


$(document).ready(ready)
$(document).load(load) 