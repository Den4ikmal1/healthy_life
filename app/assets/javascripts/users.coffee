ready = ->



  Morris.Area
    element: 'user_wight'
    data: $("#user_wight").data('index')
    xkey: 'updated_at'
    ykeys: ['activity_index']
    labels: ['Индекс актив']
    parseTime: false
    lineColors: ["red", "blue"]

  Morris.Line
    element: 'user_test'
    data: $("#user_test").data('index')
    xkey: 'date'
    ykeys: ["value"]
    labels: ['Индекс массы тела']
    parseTime: false
   
  $('#weight').click ->
    $('.charts_weight').toggle(1000)

  $('#metab').click ->
    $('.charts').toggle(1000)
 
  
 
    

  
$(document).ready(ready)
$(document).on('page:load', ready)
