(($) ->
  $.fn.china_city = () ->
    @each ->
      selects = $(@).find('.city-select')
      selects.change ->
        $this = $(@)
        next_selects = selects.slice(selects.index(@) + 1) # empty all children city

        $("option[value='']", $this).remove()
        $("option", next_selects).remove()
        if next_selects.first()[0] and $this.val() # init next child
          $.get "/china_city/#{$(@).val()}", (data) ->
            next_selects.first()[0].options.add(new Option(option[0], option[1])) for option in data
            $("option[value!='']", next_selects)[0].selected = true
            next_selects.change()
)(jQuery)
