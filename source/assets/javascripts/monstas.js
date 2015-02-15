if(location.hostname == 'rubymonstas.org') {
  var host = 'http://ruby-for-beginners.rubymonstas.org';
  var path = location.pathname.replace('ruby-for-beginners/', '');
  location.href = host + path;
}

window.onload = function() {
  var ajax = function(method, path) {
    var xhr = new XMLHttpRequest();
    xhr.open(method.toUpperCase(), path, false);
    xhr.send(null);
    return xhr.responseText;
  };

  var addEventListener = function(el, eventType, handler) {
    if (el.addEventListener) { // DOM Level 2 browsers
      el.addEventListener(eventType, handler, false);
    } else if (el.attachEvent) { // IE <= 8
      el.attachEvent('on' + eventType, handler);
    } else { // ancient browsers
      el['on' + eventType] = handler;
    }
  };

  var cancelDefaultAction = function(e) {
    var event = event ? event : window.event;
    if (event.preventDefault) { event.preventDefault(); }
    event.returnValue = false;
    return false;
  };

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

  var clickMenu = function() {
    var toc = document.getElementsByClassName('toc')[0];
    var page_nav = document.getElementsByClassName('page-nav');

    toggleClassName(toc, 'overlay');

    for(var i = 0; i < page_nav.length; i++) {
      toggleClassName(page_nav[i], 'hidden');
    }
  };

  var nav = document.getElementsByClassName('menu')[0];
  var link = nav.firstChild;
  addEventListener(link, 'click', clickMenu);

  var showSolution = function(link) {
    addClassName(link, 'hidden');

    var solution = ajax('get', link.href);
    var id = link.href.split('/').pop().replace('.rb', '');
    var hide = '<a id="hide-' + id + '" href="#" class="solution">Hide solution</a>';
    /* var pre = '<pre id="code-' + id + '" class="hightlight ruby">' + solution + '</pre>'; */
    solution = solution.replace('<pre', '<pre id="code-' + id + '"')
    link.insertAdjacentHTML('afterend', hide + solution);

    hide = document.getElementById('hide-' + id);
    pre = document.getElementById('code-' + id);

    addEventListener(hide, 'click', function(event) {
      pre.parentElement.removeChild(pre);
      removeClassName(link, 'hidden');
      addClassName(hide, 'hidden');
      return cancelDefaultAction(event);
    });

  };

  var links = document.getElementsByClassName('solution');
  for(var i = 0; i < links.length; i++) {
    var link = links[i];
    addEventListener(link, 'click', function(event) {
      try {
        if(location.href.match('localhost')) {
          var result = true;
        } else {
          var result = confirm('Are you sure you want to reveal this solution?');
        }
        if(result) {
          showSolution(event.srcElement);
        }
      } catch(e) {
        console.log(e)
      }
      return cancelDefaultAction(event);
    });
  }

}
