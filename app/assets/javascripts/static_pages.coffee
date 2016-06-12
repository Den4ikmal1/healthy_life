ready = ->
  $(".bxslider").bxSlider({
    auto: true,
    speed: 2000
  })


$(document).ready(ready)
$(document).on('page:load', ready)