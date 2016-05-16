$ ->
  Morris.Line
    element: 'user_wight'
    data: $("#user_wight").data('index')
    xkey: 'updated_at'
    ykeys: ['activity_index']
    labels: ['Индекс актив']
    parseTime: false
    
