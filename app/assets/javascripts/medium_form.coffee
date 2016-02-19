jQuery ->
  $('#medium_type').on 'change', ->
    value = $(this).val()
    window.location = "?type=#{value}"
