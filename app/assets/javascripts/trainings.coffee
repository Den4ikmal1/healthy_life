# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready = ->
  $('#cardios').click ->
    $('.cardio').toggle(1500)

  $('#full_train').click ->
    $('.full_training').toggle(1500)


$(document).ready(ready)
$(document).on('page:load', ready)
