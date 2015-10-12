# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ignore_item = (element, itemid, search_term) ->
  $.post("/ignored_items", data: { itemid: itemid, search_term: search_term }).done(remove_row(itemid))

remove_row = (itemid) ->
  ->
    $('#' + itemid).remove()

$ ->
  $("button[data-itemid]").click (e) ->
    e.preventDefault()

    itemid = $(this).data("itemid")
    ignore_item(this, itemid, 'commodore')
