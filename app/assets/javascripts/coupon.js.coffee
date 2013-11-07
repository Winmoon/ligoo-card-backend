$ ->
  $('.check_coupon').click ->
    el = $(this)
    $.get "/establishment/coupons/"+el.data('id')+"/check", (data) ->
      el.parent().html data