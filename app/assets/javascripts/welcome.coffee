ignore_item = (element, itemid, search_term) ->
  data = { itemid: itemid, search_term: search_term }
  $.post("/ignored_items", data: data).done(remove_row(element))

remove_row = (element) ->
  ->
    $(element).closest('tr').remove()

snipe_item = (element, itemid, snipe_bid, auction_endtime) ->
  data = { itemid: itemid, snipe_bid: snipe_bid, auction_endtime: auction_endtime }
  $.post("/snipes", data: data).done(data) ->
    alert 'butt'

# Click event for Ignoring Search Result
$ ->
  $("button[data-itemid]").click (e) ->
    e.preventDefault()
    itemid = $(this).data("itemid")
    # TODO: fix this
    search_term = 'commodore'
    ignore_item(this, itemid, search_term)

# Click event for Sniping Item
$ ->
  $("button[data-snipe-itemid]").click (e) ->
    e.preventDefault()
    itemid = $(this).data("snipe-itemid")
    # TODO: validate this input
    snipe_bid = $('input[name=' + itemid + ']').val()
    # TODO: validate this input
    auction_end = 'butt'
    alert 'snipe'
    snipe_item(this, itemid, snipe_bid, auction_end)

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
        { "data": "item" },
        { "data": "seller" },
        { "data": "current" },
        { "data": "bids" },
        {
          "data": null,
          "defaultContent": "<button class='btn btn-danger'>Ignore</button>"
        }
      ],
      "fnInitComplete": $('table[data-saved-search=' + name + ']').on( 'click', 'button', () ->
        data = savedSearchTables[name].row( $(this).parents('tr') ).data()
        ignore_item(this, data.itemid, name)
      ),
      "fnRowCallback": (element, object) ->
        $(element).click(object, (event) ->
          document.location.href = event.data.href
        )
    })
  )

  in_progress_table = $('#in_progress').DataTable({
    "ajax": "/welcome/in_progress",
    "columns": [
      { "data": "itemid" },
      { "data": "item" },
      { "data": "seller" },
      { "data": "current" },
      { "data": "bids" },
    ],
    "fnRowCallback": (element, object) ->
      $(element).addClass('success') if object.winning
      $(element).addClass('danger') unless object.winning
  })
