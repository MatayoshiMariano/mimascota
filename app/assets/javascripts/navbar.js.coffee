load({controller: 'welcome', action: 'index'}, (controller, action) ->
	$('.home').addClass("active");
)

load({controller: 'sessions', action: 'new'}, (controller, action) ->
	$('.login').addClass("active");
)

load({controller: 'registrations', action: 'new'}, (controller, action) ->
  $('.sign-up').addClass("active");
)
