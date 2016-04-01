# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

changeNumberInput = (input, amount) ->
  newVal = parseInt($(input).val()) + amount || 0
  $(input).val (if newVal > 0 then newVal else 0)

$(document).on 'page:load ready', ()->
  $('.number-increase').on 'click', ()->
    changeNumberInput($(this).closest('.input-group').find('input'), 1)

  $('.number-decrease').on 'click', ()->
    changeNumberInput($(this).closest('.input-group').find('input'), -1)
