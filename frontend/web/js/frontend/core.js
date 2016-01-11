"use strict";

(function () {
    var core = Backbone.View.extend({
        el: 'body',
        initialize: function () {
            //this.initializeChosen();
        }

        /*initializeChosen: function () {
         this.$el.find('.chosen').chosen();
         }*/

    });

    $(document).ready(function () {
        BudgetFE.core = new core();
        if (BudgetFE.view) {
            BudgetFE.view = new BudgetFE.view();
        }
        for (var widgetName in BudgetFE.widgets) {
            BudgetFE.widgets[widgetName] = new BudgetFE.widgets[widgetName]();
        }
    });
})();
