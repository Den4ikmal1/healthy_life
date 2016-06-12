ready = ->
  $("#ration").on 'ajax:success', (e, data, status, xhr) ->
    $('.rations').append data

  $("#ration-delete").on 'click', (e) ->
    e.preventDefault()
    $('.lol').last().remove()
    return


$(document).ready(ready)
$(document).on('page:load', ready)

