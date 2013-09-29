load({controller: 'welcome', action: 'index'}, (controller, action) ->
  # showMarkers(false, 'WantedDog')
  # showMarkers(true, 'LostDog')
  # debugger
  Gmaps.map.callback = ->
    markers = Gmaps.map.markers
    $.each(markers, (index, marker)->
      if(marker.category == 'WantedDog')
        marker.serviceObject.setVisible(false)
      else if(marker.category == 'LostDog')
        marker.serviceObject.setVisible(false)
      )
)

# showMarkers = (bShow, category) ->
#   Gmaps.map.callback = ->
#     markers = Gmaps.map.markers
#     $.each(markers, (index, marker)->
#       if(marker.category == 'WantedDog')
#         marker.serviceObject.setVisible(false)
#       )