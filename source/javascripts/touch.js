Zepto(function ($) {
  if (!('ontouchstart' in window || 'onmsgesturechange' in window)) {
    return;
  }

  $('a').on('touchstart', function () {
    $(this).addClass('touch');
  });

  $('a').on('touchend', function () {
    $(this).removeClass('touch');
  });
});
