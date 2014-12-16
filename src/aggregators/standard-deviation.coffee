StdDev = (formatter) -> ([attr]) -> (data, rowKey, colKey) ->
  name: 'Standard Deviation'
  avg: $.pivotUtilities.aggregatorTemplates.Average($.pivotUtilities.numberFormat())([attr])(data, rowKey, colKey)
  values: []
  variance: 0

  push: (record) ->
    @avg.push record
    unless isNaN parseFloat(record[attr])
      @values.push parseFloat(record[attr])

  value: ->
    s = 0

    for value in @values
      s += Math.pow(value - @avg.value(), 2)

    @variance = s/@values.length
    Math.sqrt(@variance)

  format: formatter or $.pivotUtilities.formatterTemplates.default
  numInputs: 1


stddev =
  "Standard Deviation": StdDev($.pivotUtilities.numberFormat())

$.extend $.pivotUtilities.aggregators, stddev

$.pivotUtilities.aggregatorTemplates?.StdDev = StdDev
