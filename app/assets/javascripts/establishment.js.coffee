$ ->
  $('.validate_coupon button').click ->
    if $('.validate_coupon input').val()
      $.get "/establishment/"+$('.validate_coupon input').val(), (data) ->
        $('#coupon_info').html data