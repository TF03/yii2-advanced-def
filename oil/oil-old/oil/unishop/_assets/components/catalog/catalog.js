$(document).on('click', '[data-catalog-view-item]', function (e) {

    var cookieValue = $(this).attr('data-catalog-view-item');

    e.preventDefault();
    document.cookie = 'catalog_view=' + cookieValue + ';path=/';
    window.location.reload();
});