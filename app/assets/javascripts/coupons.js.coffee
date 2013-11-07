$ ->
  $('.validate_coupon #search_coupon').click ->
    if $('.validate_coupon input').val()
      $.get "/establishment/coupons/"+$('.validate_coupon input').val(), (data) ->
        $('#coupon_info').html data

