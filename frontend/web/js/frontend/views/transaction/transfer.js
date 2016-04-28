(function() {

    var TransferView = Backbone.View.extend({

        el: '#transaction-transfer',
        transferFormDate: '#transferform-date',
        transferFormFromAmount: '#transferform-fromamount',
        transferFormToAmount: '#transferform-toamount',
        events: {
            'click .additionally-date-link': 'changeDate',
            'blur #transferform-fromamount': 'copyValue'
        },

        initialize: function() {
        },

        changeDate: function(event) {
            var currentEl = $(event.currentTarget);
            var dateValue = currentEl.data('value');

            if (dateValue) {
                $(this.transferFormDate).val(dateValue);
            }
        },

        copyValue: function(event) {
            var currentEl = $(event.currentTarget);
            var value = currentEl.val();

            $(this.transferFormToAmount).val(value);
        }
    });

    BudgetFE.view = TransferView;
})();
