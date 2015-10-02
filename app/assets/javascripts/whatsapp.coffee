# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	phone  = $("#phone")
	markas = $("#marka_id")
	models = $("#model_id")
	txtar_note   = $("#note")
	markas.change ()->
		$("#marka_id option:selected").each ()->
			marka_id = $(@).val()
			$("#model_id option:not(:first)").remove()

			if marka_id is ""
				$("#model").hide 400
			else
				$.ajax
		        type  : 'GET'
		        url   : '/markas/'+marka_id+'/models.json'
		        dataType: 'json'
		        success : (data)->
		        	$.each data, (i,item)->
		        		models.append('<option value='+item.id+'>'+item.name+'</option>')
		        	$("#model").show()

	$("#new-phone-form").on 'submit', ()->
		value = phone.val()
		reg = /^\d{11}$|^\d{6}$/
		if reg.test(value) #or value.length is 6  
			valuesToSubmit = $(@).serialize()
			$.ajax
				type    : 'POST',
				url     : $(@).attr('action'),
				data    : valuesToSubmit,
				dataType: 'script'
		else
			alert "Не верное значение!"
		return false

	$("#add-filter-form").on 'submit', ()->
		value = txtar_note.val()
		if value.length > 0
			valuesToSubmit = $(@).serialize().replace(/[^&]+=\.?(?:&|$)/g, '')
			$.ajax
				type    : 'POST',
				url     : $(@).attr('action'),
				data    : valuesToSubmit,
				dataType: 'script'
		else
			txtar_note.addClass "input-error"
			$("span.error").show()
			setTimeout remove_error_style,4000,false
		return false

	remove_error_style = ()->
		txtar_note.removeClass "input-error"
		$("span.error").hide 400

$(document).ready(ready)
$(document).on('page:load', ready)