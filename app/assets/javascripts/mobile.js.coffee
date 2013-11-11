#= require util/base64

#root_url = "http://ligoo-card.herokuapp.com/"
root_url = "http://localhost:3000/"

url = (url) ->
  root_url + url

make_base_auth = (user, password) ->
  tok = user + ":" + password
  hash = $.base64.encode(tok)
  "Basic " + hash


sign_in = ->
  $.post url("user/users/sign_in.json"),
    user:
      remember_me: 1
      email: "admin@winmoon.com"
      password: "123321321"
  , (data) ->
    console.log data

sign_up = ->
  $.post url("user/users.json"),
    user:
      name: 'Usuario Teste 3'
      email: "admin34@winmoon.com"
      password: "123321321"
      password_confirmation: "123321321"
      gender: "M"
      birth_date: "23/10/1989"
      phone: "(62) 1234 5569"
      remember_me: 1
  , (data) ->
    console.log data

create_point = (establishment) ->
  $.get url("user/api/"+establishment+"/point.json"),
    point_type: "qrcode"
  , (data) ->
    console.log data

get_points = ->
  $.get url("user/api/points.json"), (data) ->
    console.log data

get_establishments = ->
  $.get url("user/api/establishments.json"), (data) ->
    console.log data

get_near_establishments = ->
  $.get url("user/api/near_establishments.json"),
    latitude: -16.6896407
    longitude: -49.2511995
  , (data) ->
    console.log data

get_news = ->
  $.get url("user/api/news.json"), (data) ->
    console.log data

get_establishment = (establishment) ->
  $.get url("user/api/"+establishment+"/establishment.json"), (data) ->
    console.log data

create_coupon = (promotion) ->
  $.get url("user/api/"+promotion+"/coupon.json"), (data) ->
    console.log data

get_coupons = ->
  $.get url("user/api/coupons.json"), (data) ->
    console.log data

like_establishment = (establishment) ->
  $.get url("user/api/"+establishment+"/like.json"), (data) ->
    console.log data

get_profile = ->
  $.get url("user/api/profile.json"),
    latitude: -16.6896407
    longitude: -49.2511995
  , (data) ->
    console.log data

update_profile = ->
  $.post url("user/api/update_profile.json"),
    user:
      name: "Usuário com nome atualizado"
      birth_date: '23/11/2013'
      phone: "(62) 1234 5678"
      gender: 'M'
  , (data) ->
    console.log data

$ ->

  $.ajaxSetup
    dataType: "json"
    crossDomain: true
    xhrFields: {
      withCredentials: true
    }
    statusCode:
      401: ->
        if confirm "Usuário não autenticado. Deseja fazer o Login?"
          sign_in()
      400: (error) ->
        alert "Não passou na validação: "+ error.responseText
      422: (error) ->
        alert "Não passou na validação: "+ error.responseText

  $("#facebook_sign_in").click (e) ->
    e.preventDefault()
    FB.login ((response) ->
      if response.authResponse
        console.log response.authResponse
        console.log "Connected! Hitting OmniAuth callback (GET users/auth/facebook/callback)..."
        $.getJSON url("users/auth/facebook/callback")+"?"+$.param({ signed_request: response.authResponse.signedRequest }),
          dataType: "json"
          crossDomain: true
          xhrFields: {
            withCredentials: true
          }
        , (json) ->
          console.log JSON.stringify(json)

    ),
      # Do some other stuff here (call more json, load in more elements, etc)
      scope: "email,read_stream" # These are the permissions you are requesting


  sign_in()
#  sign_up()
#  get_establishments()
#  get_near_establishments()
#  create_point(4)
  get_points()
#  get_news()
#  get_establishment(4)
#  like_establishment(4)
#  create_coupon(1)
#  get_coupons()
#  get_profile()
#  update_profile()
#  get_profile()


