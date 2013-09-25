load({controller: 'welcome', action: 'index'}, (controller, action) ->
	$('.home').addClass("active");
)

load({controller: 'devise/sessions', action: 'new'}, (controller, action) ->
	(debugger);
	$('.login').addClass("active");
)
