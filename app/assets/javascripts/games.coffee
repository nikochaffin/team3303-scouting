$(document).on 'page:load ready', ()->
  $('form').on 'click', '.remove_field', (e) ->
    $(this).prev('input[type=hidden]').val '1'
    $(this).closest('fieldset').hide()
    e.preventDefault()

  $('form').on 'click', '.add_field', (e) ->
    time = new Date().getTime()
    regexp = new RegExp $(this).data('id'), 'g'
    $(this).before($(this).data('fields').replace(regexp, time))
    e.preventDefault()
