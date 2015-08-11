$(document).on 'ready page:load', ->
  # Clear Filters button
  $('.js-clear-filters-button').click ->
    params = window.location.search.slice(1).split('&')
    regex = /^(q\[|q%5B|q%5b|page|commit)/
    window.location.search = (param for param in params when not param.match(regex)).join('&')

  # Filter form: don't send any inputs that are empty
  $('.filter-form').submit ->
    $(@).find(':input').filter(-> @value is '').prop 'disabled', true

  # Filter form: for filters that let you choose the query method from
  # a dropdown, apply that choice to the filter input field.
  $('.filter-form-field.select-and-search select').change ->
    $(@).siblings('input').prop name: "q[#{@value}]"
