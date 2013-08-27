$(document).on 'keyup change', '#person_name', -> $('#name').text $(this).val()
$(document).on 'ajax:success', 'a[data-mark-as-confirmed]', (xhr, data)->
  $(this).parents('tr:first').replaceWith(data)
