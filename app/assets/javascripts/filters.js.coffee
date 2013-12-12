$ ->
  $("select[data-filter-target]").change ->
    if $(this).attr("data-filter-clear")
      $($(this).attr("data-filter-clear")).val('')
    $($(this).attr("data-filter-target")).click()