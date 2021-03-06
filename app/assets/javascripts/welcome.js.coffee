load({controller: 'welcome', action: 'index'}, (controller, action) ->
  showLostDogs()
  showWantedDogs()
  showAdoptDogs()
  showFoundDogs()
)

showLostDogs = () ->
  $('.btn.lost-dogs').click( (event) ->
    $.getJSON "welcome/lost_dogs_json", (data) ->
      Gmaps.map.replaceMarkers data
  )

showWantedDogs = () ->
  $('.btn.wanted-dogs').click( (event) ->
    $.getJSON "welcome/wanted_dogs_json", (data) ->
      Gmaps.map.replaceMarkers data
  )

showAdoptDogs = () ->
  $('.btn.adopt-dogs').click( (event) ->
    $.getJSON "welcome/adopt_dogs_json", (data) ->
      Gmaps.map.replaceMarkers data
  )

showFoundDogs = () ->
  $('.btn.found-dogs').click( (event) ->
    $.getJSON "welcome/found_dogs_json", (data) ->
      Gmaps.map.replaceMarkers data
  )

showMarkers = (bShow, sCategory) ->
  Gmaps.map.callback = ->
    markers = Gmaps.map.markers    
    $.each(markers, (index, marker)->
      if(marker.category == sCategory)
        marker.serviceObject.setVisible(bShow)
      )