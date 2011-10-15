var go = function() { return $('#capital').css('display') === 'none' && $('#application').css('margin-right') === '0px'; };

function hide() {
  if (go()) {
    setTimeout(arguments.callee, 50)
    return;
  } 
  $('#capital').css('display', 'none');
  $('#application').css('margin-right', '0px');
}

hide();
setTimeout(hide, 1000)
