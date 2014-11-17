countAsFraction =
  "Count as Fraction of Total": $.pivotUtilities.aggregatorTemplates.fractionOf($.pivotUtilities.aggregatorTemplates.Count(), 'Count as Fraction of Total', 'total')
  "Count as Fraction of Rows": $.pivotUtilities.aggregatorTemplates.fractionOf($.pivotUtilities.aggregatorTemplates.Count(), 'Count as Fraction of Rows', 'row')
  "Count as Fraction of Columns": $.pivotUtilities.aggregatorTemplates.fractionOf($.pivotUtilities.aggregatorTemplates.Count(), 'Count as Fraction of Columns', 'col')

$.extend $.pivotUtilities.aggregators, countAsFraction
