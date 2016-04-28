(function() {

    var TransactionView = Backbone.View.extend({

        el: '#transaction-new',
        amountLabel: '#amountLabel',
        transactionDate: '#transaction-date',
        events: {
            'click .additionally-date-link': 'changeDate'
            //'change .account_id': 'changeValuta'
        },

        initialize: function() {
        },

        changeDate: function(event) {
            var currentEl = $(event.currentTarget);
            var dateValue = currentEl.data('value');

            if (dateValue) {
                $(this.transactionDate).val(dateValue);
            }
        }

        /*changeValuta: function(event) {
            var currentEl = $(event.currentTarget);
            var parentBlock = currentEl.parent();
            var idAccount = currentEl.attr('id').split('_')[2];

            if (idAccount) {
                this.updateLabel(idAccount, parentBlock);
            }
        },

        updateLabel: function (idAccount, parentBlock) {
            var valueForLabel = parentBlock.find('#current_' + idAccount).val();
            var amountLabel = el.find(this.amountLabel);
            var valueAmountLabel = amountLabel.text().split('(')[0];
            amountLabel.html(valueAmountLabel + '(' + valueForLabel + ')*');
        }*/
    });

    BudgetFE.view = TransactionView;
})();
