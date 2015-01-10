window.onload = function() {
  var addEventListener = function(el, eventType, handler) {
    if (el.addEventListener) { // DOM Level 2 browsers
      el.addEventListener(eventType, handler, false);
    } else if (el.attachEvent) { // IE <= 8
      el.attachEvent('on' + eventType, handler);
    } else { // ancient browsers
      el['on' + eventType] = handler;
    }
  }

  var hasClassName = function(element, name) {
    return new RegExp("(?:^|\\s+)" + name + "(?:\\s+|$)").test(element.className);
  }

  var addClassName = function(element, name) {
    if (hasClassName(element, name)) return;
    element.className = element.className ? [element.className, name].join(' ') : name;
  };

  var removeClassName = function(element, name) {
    if (!hasClassName(element, name)) return;
    var c = element.className;
    element.className = c.replace(new RegExp("(?:^|\\s+)" + name + "(?:\\s+|$)", "g"), "");
  };

  var toggleClassName = function(element, name) {
    if (hasClassName(element, name)) {
      removeClassName(element, name);
    } else {
      addClassName(element, name);
    }
  };

  var nav = document.getElementsByClassName('menu')[0];

  var link = nav.firstChild;
  addEventListener(link, 'click', function() {
    var toc = document.getElementsByClassName('toc')[0];
    var page_nav = document.getElementsByClassName('page-nav');

    toggleClassName(toc, 'overlay');

    console.log(page_nav)
    console.log(page_nav.length)
    console.log(page_nav.size)
    for(var i = 0; i < page_nav.length; i++) {
      toggleClassName(page_nav[i], 'hidden');
    }
  });
}
