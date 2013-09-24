load({controller: 'welcome', action: 'index'}, (controller, action) ->
	$('.home').addClass("active");
)

load({controller: 'registrations', action: 'sign_in'}, (controller, action) ->
	(debugger);
	$('.login').addClass("active");
)
