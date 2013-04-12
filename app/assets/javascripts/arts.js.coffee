# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

truncate_helper(stringValue, length) ->
	returnedString = ""
	if length < stringValue.length
		returnedString = stringValue.substring(0, length)

	returnedString