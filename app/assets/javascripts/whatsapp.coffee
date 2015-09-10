# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
	markas = $("#marka_id")
	models = $("#model_id")
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
	$("#add-filter-form").on 'submit', ()->
		valuesToSubmit = $(@).serialize().replace(/[^&]+=\.?(?:&|$)/g, '')
		$.ajax
			type    : 'POST',
			url     : $(@).attr('action'),
			data    : valuesToSubmit,
			dataType: 'json'
		return false

$(document).ready(ready)
$(document).on('page:load', ready)