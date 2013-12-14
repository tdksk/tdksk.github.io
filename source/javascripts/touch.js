Zepto(function ($) {
  if (!('ontouchstart' in window || 'onmsgesturechange' in window)) {
    return;
  }

  $('a').on('tap', function () {
    $(this).addClass('tap');
  });
});
