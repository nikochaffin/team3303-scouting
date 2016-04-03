$(document).on 'page:load ready', ()->
  $('select').on 'change', ()->
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
