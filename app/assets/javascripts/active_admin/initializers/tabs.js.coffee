onDOMReady = ->
  # Tab navigation
  $('#active_admin_content .tabs').tabs()
  $('.select2').select2()
$(document).
  ready(onDOMReady).
  on 'page:load turbolinks:load', onDOMReady
