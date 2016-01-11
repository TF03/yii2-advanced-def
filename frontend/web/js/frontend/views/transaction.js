(function() {

    var TransactionView = Backbone.View.extend({

        el: '#content',
        events: {
            //'click #generate': 'getReportDetails',
        },

        initialize: function() {
            console.log('test');
        }
    });

    BudgetFE.view = TransactionView;
})();
