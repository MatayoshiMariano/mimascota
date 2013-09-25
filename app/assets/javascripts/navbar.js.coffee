load({controller: 'welcome', action: 'index'}, (controller, action) ->
	$('.home').addClass("active");

)

load({controller: 'sessions', action: 'new'}, (controller, action) ->
	$('.login').addClass("active");
)

