// Generated by LiveScript 1.2.0
var shoe, through, handlers;
window.IRBOT = {};
window.IRBOT.main = (shoe = require('shoe'), through = require('through'), handlers = {
  serverDc: function(){
    return console.log("Server DC'd");
  }
}, function(){
  return shoe('/irbot').pipe(through(function(data){
    var key$;
    data = JSON.parse(data);
    return typeof handlers[key$ = data.event] === 'function' ? handlers[key$](data) : void 8;
  }));
});