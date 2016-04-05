$(document).on 'page:load ready', ()->
  onSelectChange = () ->
    console.log "select changed"
    if $(this).attr('name').indexOf('field_type') >= 0
      console.log $(this).attr('name'), $(this).val()
      rangeMinMax = $(this).parent().siblings('.range-min-max')
      optionsList = $(this).parent().siblings('.options-list')
      switch $(this).val()
        when 'checkbox_set', 'radio_set'
          rangeMinMax.hide()
          optionsList.show()
        when 'range'
          rangeMinMax.show()
          optionsList.hide()
        else
          rangeMinMax.hide()
          optionsList.hide()

  $('form').on 'click', '.remove_field', (e) ->
    if window.confirm 'Are you sure you want to delete this field?'
      $(this).prev('input[type=hidden]').val '1'
      $(this).closest('fieldset').hide()
      e.preventDefault()

  $('form').on 'click', '.add_field', (e) ->
    time = new Date().getTime()
    regexp = new RegExp $(this).data('id'), 'g'
    $(this).before($(this).data('fields').replace(regexp, time))
    console.log($(this).parent().find('select'));
    $(this).parent().find('select').on 'change', onSelectChange
    e.preventDefault()

  $('select').on 'change', onSelectChange
