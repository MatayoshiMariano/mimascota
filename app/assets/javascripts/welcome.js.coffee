load({controller: 'welcome', action: 'index'}, (controller, action) ->
  showLostDogs()
  showWantedDogs()
  # Gmaps.map.callback = () ->
  #   markers = Gmaps.map.markers
  #   $.each(markers, (index, marker)->
  #     marker.serviceObject.setVisible(false)
  #   )

  # Gmaps.map.callback = () ->
  #    Gmaps.map.createMarker({
  #       Lat: -30.612
  #       Lng: -50.312
  #    });    
)

showLostDogs = () ->
  $('.btn.lost-dogs').click( (event) ->
    debugger
    $.getJSON "welcome/lost_dogs_json", (data) ->
      Gmaps.map.replaceMarkers data
  )

showWantedDogs = () ->
  $('.btn.wanted-dogs').click( (event) ->
    $.getJSON "welcome/wanted_dogs_json", (data) ->
      Gmaps.map.replaceMarkers data
  )

showMarkers = (bShow, sCategory) ->
  Gmaps.map.callback = ->
    markers = Gmaps.map.markers    
    $.each(markers, (index, marker)->
      if(marker.category == sCategory)
        marker.serviceObject.setVisible(bShow)
      )