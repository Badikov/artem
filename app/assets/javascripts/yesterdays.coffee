# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $("form#search-form").on 'submit', ()->
    valuesToSubmit = $(@).serialize().replace(/[^&]+=\.?(?:&|$)/g, '')
    $.ajax
      type    : 'GET',
      url     : $(@).attr('action'),
      data    : valuesToSubmit,
      dataType: 'json'
      success : (data)->
        ul = $("ul.search_response")
        $("ul.search_response li").remove()
        $.each data, (i,item)->
          ul.prepend('<li>'+item.phone+'</li>') 
    return false

$(document).ready(ready)
$(document).on('page:load', ready)