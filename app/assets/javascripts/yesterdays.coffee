# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  regions = $("#region_id")
  cityes  = $("#location")
  regions.change ()->
    $( "#region_id option:selected" ).each ()->
      region_id = $(@).val()
      $("#location option:not(:first)").remove()
      if region_id isnt ""
        $.ajax
          type  : 'GET'
          url   : '/regions/'+region_id+'/locations.json'
          dataType: 'json'
          success : (data)->
            $.each data, (i,item)->
              cityes.append('<option value='+item.id+'>'+item.name+'</option>')
            # .append('<option selected="selected" value="whatever">text</option>')

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