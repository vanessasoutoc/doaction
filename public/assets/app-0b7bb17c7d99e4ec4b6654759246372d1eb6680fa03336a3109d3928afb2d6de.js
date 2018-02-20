var ready = function () {
    return $(window).trigger('resize');
};
document.addEventListener('turbolinks:load', ready);
