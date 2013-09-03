jQuery ->
  I18n.currentLocale();
  Morris.Line
    element: 'chart'
    data: $('#chart').data('poems')
    xkey: 'date'
    ykeys: ['total']
    labels:[I18n.t('layouts.total')]



