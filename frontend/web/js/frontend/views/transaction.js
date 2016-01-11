(function() {

    var TransactionView = Backbone.View.extend({

        el: '#transaction-new',
        amountLabel: '#amountLabel',
        events: {
            'change .account_id': 'changeValuta',
        },

        initialize: function() {
            //console.log('test');
        },

        changeValuta: function(event) {
            var currentEl = $(event.currentTarget);
            var parentBlock = currentEl.parent();
            var idAccount = currentEl.attr('id').split('_')[2];

            if (idAccount) {
                this.updateLabel(idAccount, parentBlock);
            }
        },

        updateLabel: function (idAccount, parentBlock) {
            var valueForLabel = parentBlock.find('#current_' + idAccount).val();
            var amountLabel = $(this.amountLabel);
            var valueAmountLabel = amountLabel.text().split('(')[0];
            $(this.amountLabel).html(valueAmountLabel + '(' + valueForLabel + ')');
        }
    });

    BudgetFE.view = TransactionView;
})();
