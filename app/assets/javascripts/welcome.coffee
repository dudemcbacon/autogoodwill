seen_item = (itemid, searchterm) ->
  data = { itemid: itemid, searchterm: searchterm }
  $.post("/welcome/seen_item", data: data).done(remove_row(element))

ignore_item = (element, itemid, searchterm) ->
  data = { itemid: itemid, searchterm: searchterm }
  alert itemid + ' - ' + searchterm
  $.post("/welcome/ignore_item", data: data).done(remove_row(element))

remove_row = (element) ->
  ->
    $(element).closest('tr').remove()

# Click event for Ignoring Search Result
$ ->
  $("button[data-itemid]").click (e) ->
    e.preventDefault()
    itemid = $(this).data("itemid")
    alert('fix me!')

# DataTables Init for in progress table
$ ->
  savedSearchTables = {}
  $('table[data-saved-search]').each( (element) ->
    name = $(this).data('saved-search')
    savedSearchTables[name] = $('table[data-saved-search=' + name + ']').DataTable({
      'ajax': {
        'url': '/welcome/search?search=' + name,
      },
      "columns": [
        { "data": "itemid" },
        { "class": "item", "data": "item" },
        { "data": "seller" },
        { "data": "current" },
        { "data": "shipping" },
        { "data": "bids" },
        { "data": "end" },
        {
          "data": null,
          "defaultContent": "<button class='btn btn-danger ignore'>Ignore</button>"
        }
      ],
      "fnRowCallback": (element, object) ->
        $(element).addClass('info') unless object.seen
        $(element).find('.item').html('<a href=' + object.href + '>' + object.item + '</a>')
        $(element).find('.item a').on('click', (event, element) ->
          $(event.target).closest('tr').removeClass('info')
          table_name = $(event.target).closest('table').data('savedSearch')
          itemid = savedSearchTables[name].row($(event.target).closest('tr')).data().itemid
          seen_item(itemid, table_name)
        )
      "fnInitComplete": () ->
        updated_at = data = savedSearchTables[name].row(0).data().updated_at
        $('#' + name + ' .updated_at').text(updated_at)
        $('#' + name + ' .updated_at').attr('title', updated_at)
        $('#' + name + ' .updated_at').timeago()
        $('table[data-saved-search=' + name + ']').on( 'click', 'button.ignore', () ->
          data = savedSearchTables[name].row( $(this).parents('tr') ).data()
          ignore_item(this, data.itemid, name)
        )
    })
  )

  in_progress_table = $('#in_progress_table').DataTable({
    "ajax": "/welcome/in_progress",
    "columns": [
      { "data": "itemid" },
      { "class": "item", "data": "item" },
      { "data": "seller" },
      { "data": "current" },
      { "data": "shipping" },
      { "data": "bids" },
      { "data": "end" },
    ],
    "fnRowCallback": (element, object) ->
      $(element).addClass('success') if object.winning
      $(element).addClass('danger') unless object.winning
      $(element).find('.item').html('<a href=' + object.href + '>' + object.item + '</a>')
    "fnInitComplete": () ->
      updated_at = $('#in_progress_table').DataTable().row(0).data().updated_at
      $('#in_progress .updated_at').text(updated_at)
      $('#in_progress .updated_at').attr('title', updated_at)
      $('#in_progress .updated_at').timeago()
  })

  $('input#saved_searches').selectize({
    delimiter: ',',
    persist: false,
    create: (input) ->
      return {
        value: input,
        text: input
      }
    });
