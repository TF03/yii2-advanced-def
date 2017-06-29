(function() {

    var TransactionIndexView = Backbone.View.extend({

        el: '.transaction',
        transactionDate: '#transaction-date',
        events: {
            'click .show-range-period': 'redirectInCustomPeriod'
        },

        initialize: function() {
        },

        redirectInCustomPeriod: function(event) {
            var currentEl = $(event.currentTarget);
            var url = currentEl.data('url');
            var periodFromDate = $('.range-period input[name="period_from_date"]').val();
            var periodToDate = $('.range-period input[name="period_to_date"]').val();
            url = url + '&periodFrom='+ periodFromDate;
            url = url + '&periodTo='+ periodToDate;

            window.location.replace(url);
        }
    });

    BudgetFE.view = TransactionIndexView;
})();
