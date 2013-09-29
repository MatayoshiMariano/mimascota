load({controller: 'welcome', action: 'index'}, (controller, action) ->
  Gmaps.map.callback = ->
    markers = Gmaps.map.markers
    $.each(markers, (index, marker)->
      marker.serviceObject.setVisible(false)
    )
)