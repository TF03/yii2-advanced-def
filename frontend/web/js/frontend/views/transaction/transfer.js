(function() {

    var TransferView = Backbone.View.extend({

        el: '#transaction-transfer',
        amountLabel: '#amountLabel',
        events: {
            'change #select2-transferform-fromaccountid-container': 'changeFromAccount'
        },

        initialize: function() {
        },

        changeFromAccount: function(event) {
            var currentEl = $(event.currentTarget);
            console.log(currentEl.label());
            console.log(1111);
            /*var parentBlock = currentEl.parent();
            var idAccount = currentEl.attr('id').split('_')[2];

            if (idAccount) {
                this.updateLabel(idAccount, parentBlock);
            }*/
        },

        updateLabel: function (idAccount, parentBlock) {
            var valueForLabel = parentBlock.find('#current_' + idAccount).val();
            var amountLabel = el.find(this.amountLabel);
            var valueAmountLabel = amountLabel.text().split('(')[0];
            amountLabel.html(valueAmountLabel + '(' + valueForLabel + ')*');
        }
    });

    BudgetFE.view = TransferView;
})();
