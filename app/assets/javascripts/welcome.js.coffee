load({controller: 'welcome', action: 'index'}, (controller, action) ->
  debugger
  Gmaps.map.callback = ->
    Gmaps.map.createMarker
      Lat: -34.6
      Lng: -58.45
      rich_marker: null
      marker_picture: ""
)