ready = ->
  Morris.Line
    element: 'user_wight'
    data: $("#user_wight").data('index')
    xkey: 'updated_at'
    ykeys: ['activity_index']
    labels: ['Индекс актив']
    parseTime: false
    lineColors: ["red"]

  Morris.Area
    element: 'user_test'
    data: $("#user_test").data('index')
    xkey: 'date'
    ykeys: ["value"]
    labels: ['Индекс массы тела']
    parseTime: false
    lineColors: ["#33CC00"]

  Morris.Line
    element: 'user_one'
    data: $("#user_one").data('index')
    xkey: 'date'
    ykeys: ["value"]
    labels: ['Руфье']
    parseTime: false
    lineColors: ["blue"]

  $('#weight').click ->
    $('.charts_weight').toggle(1500)

  $('#metab').click ->
    $('.charts').toggle(1500)

  $('#rufe').click ->
    $('.charts_rufe').toggle(1500)

 

  Morris.Bar
    barGap:2,
    barSizeRatio:0.33,
    element: 'user_rufus'
    data: $("#user_rufus").data('index')
    xkey: 'date'
    ykeys: [["first"]]
    labels: ['Руфье']
    lineColors: ["#FFFF00", "#FFFF00"]

  $('#rufus').click ->
    $('.charts_wweigts').toggle(1500)


  Morris.Bar
    barGap:2,
    barSizeRatio:0.33,
    barColors: ['#0B62A4','#f75b68','#4DA74D','#646464'],
    hideHover: 'auto'
    element: 'weigtsl'
    data: $("#weigtsl").data('index')
    xkey: 'date'
    ykeys: ["first"]
    labels: ['Масса тела']
   

  $('#weigts').click ->
    $('.charts_wweigts').toggle(1500)


 
 
    

  
$(document).ready(ready)
$(document).on('page:load', ready)
