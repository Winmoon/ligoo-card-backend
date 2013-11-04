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
      name: 'Usuario Teste'
      email: "admin@winmoon.com"
      password: "123321321"
      password_confirmation: "123321321"
      remember_me: 1
  , (data) ->
    console.log data

create_point = ->
  $.post url("user/points.json"),
    point:
      establishment_id: '4'
      point_type: "qrcode"
  , (data) ->
    console.log data

get_points = ->
  $.get url("user/points.json"), (data) ->
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
  $.get url("user/api/news.json"),
    latitude: -16.6896407
    longitude: -49.2511995
  , (data) ->
    console.log data


$ ->

  $.ajaxSetup
    dataType: "json"
    crossDomain: true
    xhrFields:
      withCredentials: true
    beforeSend: (req) ->
      req.setRequestHeader "Authorization", make_base_auth("ligoocard", "uyP4RnNMGe4coOm6kIcfAt9E1S8AHK9wwHqPZO9xz7I")
    statusCode:
      401: ->
        if confirm "Usuário não autenticado. Deseja fazer o Login?"
          sign_in()
      400: (error) ->
        alert "Não passou na validação: "+ error.responseText
      422: (error) ->
        alert "Não passou na validação: "+ error.responseText

  #sign_up()
  #create_point()
  #get_points()
  #get_establishments()
  get_near_establishments()
