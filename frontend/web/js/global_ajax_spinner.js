$(function () {

    window.need_show_spinner_on_ajax = true;

    $.ajaxSetup({
        beforeSend: function (xhr) {
            if (window.need_show_spinner_on_ajax) {
                $('.spinner').show();
            }
        },
        error: function (xhr) {
            $('.spinner').hide();
        },
        complete: function (xhr) {
            $('.spinner').hide();
        },
        success: function (xhr) {
            $('.spinner').hide();
        }
    });

    $(document).on('pjax:send', function () {
        if (window.need_show_spinner_on_ajax) {
            $('.spinner').show();
        }
    });
    $(document).on('pjax:complete', function () {
        $('.spinner').hide();
    });
    $(document).on('pjax:error', function () {
        $('.spinner').hide();
    });
    $(document).on('pjax:end', function () {
        $('.spinner').hide();
    });
});
