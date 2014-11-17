sumAsFraction =
  "Sum as Fraction of Total": $.pivotUtilities.aggregatorTemplates.fractionOf($.pivotUtilities.aggregatorTemplates.Sum(), 'Sum as Fraction of Total', 'total')
  "Sum as Fraction of Rows": $.pivotUtilities.aggregatorTemplates.fractionOf($.pivotUtilities.aggregatorTemplates.Sum(), 'Sum as Fraction of Rows', 'row')
  "Sum as Fraction of Columns": $.pivotUtilities.aggregatorTemplates.fractionOf($.pivotUtilities.aggregatorTemplates.Sum(), 'Sum as Fraction of Columns', 'col')

$.extend $.pivotUtilities.aggregators, sumAsFraction
