ready = ->
  page = document.location.toString().split('/')[3]
  if page == "advertisements"
    $('.footer-site').css('bottom','-78px')
  else if page == "homes"
    $('.footer-site').css('bottom','-91px')
  else if page == "users"
    $('.footer-site').css('bottom','-100px')
  else if page == "cash_outs"
    $('.footer-site').css('bottom','-100px')
  else if page == "payment"
    $('.footer-site').css('bottom','-100px')

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

  $("#cash-out").on 'click', ->
    console.log "clicked"
    window.location = "#{$('#cash-out').data('endpoint')}"

  return if not /[0-9]+/.test(document.location.toString().split('/')[4])
  @i = ((@i or 0) + 1)
  @j = ((@j or -1) + 1)
  @update = setInterval(updateBar, 2000);

updateBar = ()->
  if !$('.progress').hasClass('empty')
    @i += 10
    @j += 1
    $('.progress-bar').css('width',@i + '%')
    $('.progress-bar').html(@j+'s')

    if @i == 11
      $('.progress-bar').addClass('progress-bar-danger')

    if @i == 51
      $('.progress-bar').removeClass('progress-bar-danger')
      $('.progress-bar').addClass('progress-bar-info')

    if @i == 101
      $('.progress-bar').removeClass('progress-bar-info')
      $('.progress-bar').addClass('progress-bar-success')
      clearInterval(@update)
      req = $.ajax({url: "#{$('.progress').data('endpoint')}", type: 'get'})

      req.done (res, status, jqXhr) =>
        opt = confirm("Continue to explore Ad?")
        if opt
          return
        else
          window.close()
    console.log @i
clean = ()->
  clearInterval(@update)

window.clean = clean()

$(document).ready(ready)
$(document).load(ready)
$(document).change(clearInterval(@update))
