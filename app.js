
/**
 * Module dependencies.
 */

var express = require('express');
var http = require('http');
var path = require('path');
var WebSocketServer = require('ws').Server;
//var port = process.env.PORT || 5000;
var port = 8080;


// the ExpressJS App
var app = express(); // for frameworks

var httpServer = http.createServer(app);

//app.set('views', __dirname + '/views');

app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(__dirname + '/'));

httpServer.listen(port);

//console.log('http server listening on %d', port);

app.configure('development', function(){
  app.use(express.errorHandler());
});


app.post('/', function(req, res) {
  
  //console.log("received form submission");
  //console.log(req.body);
});


var io = require('socket.io').listen(httpServer);
var users = [];
var newUser = false;

var display_socket_0;
var display_socket_1;
var display_socket_2;
var controller;

io.set('log level', 1);

io.sockets.on('connection', 
  // We are given a websocket object in our function
  function (socket) {
  
    //console.log("We have a new mobile client: " + socket.id);
    users[users.length] = socket.id;
    //console.log("connected: "+socket.id);
    //Set a Java client as a display_socket
    
    if(users.length < 4){
      socket.set('id','display_socket_'+ (users.length-1), function(){
        //console.log("Dispaly canvas " + (users.length-1) + " is connected");
        display_socket_0 = users[0];
        display_socket_1 = users[1];
        display_socket_2 = users[2];
        io.sockets.socket(display_socket_0).emit('news', { uid: socket.id, index: users.length-1, uType: 'display'});
        io.sockets.socket(display_socket_1).emit('news', { uid: socket.id, index: users.length-1, uType: 'display'});
        io.sockets.socket(display_socket_2).emit('news', { uid: socket.id, index: users.length-1, uType: 'display'});
  

      });
    }else if(users.length == 4){
       socket.set('id','controller', function(){
        //console.log("Controller is connected : "+socket.id);
        controller = users[3];
        io.sockets.socket(controller).emit('news', { uid: socket.id, index: users.length-1, uType: 'controller'});
        io.sockets.socket(display_socket_0).emit('playAudio', {music: 'bgm'});
        

      });
    }else if(users.length >= 5){
      socket.set('id', 'user', function(){
          //console.log("user : "+ (users.length-4));
          socket.emit('news', { uid: socket.id, index: users.length-1, uType: 'user'});         
    
      }); 
    }

    socket.get('id', function(error, value){
          var typeID = value; 
          //console.log(typeID);

          if(typeID == 'controller'){

            socket.on('button', function (data) {

               //console.log('button in app.js: ',data);
               io.sockets.socket(display_socket_0).emit('button', { uType: 'controller', button: data.button});
               io.sockets.socket(display_socket_1).emit('button', { uType: 'controller', button: data.button});
               io.sockets.socket(display_socket_2).emit('button', { uType: 'controller', button: data.button});
  
            });
          }

          socket.on('message', function (data) {

            //console.log('message',data);

          });
   
          socket.on('button', function (data) {

            //console.log('button',data);
            io.sockets.socket(display_socket_0).emit('button', data);
            io.sockets.socket(display_socket_1).emit('button', data);
            io.sockets.socket(display_socket_2).emit('button', data);
  
          });

          socket.on('target', function (data) {

            //console.log('target', data);
            io.sockets.socket(display_socket_0).emit('targettoall', data);
            io.sockets.socket(display_socket_1).emit('targettoall', data);
            io.sockets.socket(display_socket_2).emit('targettoall', data);
  
          });

          socket.on('targetH', function (data) {

            //console.log('targetH', data);
            io.sockets.socket(display_socket_0).emit('targetHtoall', data);
            io.sockets.socket(display_socket_1).emit('targetHtoall', data);
            io.sockets.socket(display_socket_2).emit('targetHtoall', data);
  
          });


          socket.on('character', function (data) {

            //console.log('character',data);
            io.sockets.socket(display_socket_0).emit('character', data);
            io.sockets.socket(display_socket_1).emit('character', data);
            io.sockets.socket(display_socket_2).emit('character', data);
  
          });

          socket.on('kill', function (data){

            io.sockets.socket(data).emit('message',"You've got killed");

          });

          socket.on("setKill", function (data){
            io.sockets.socket(display_socket_0).emit('setKill', data);
            io.sockets.socket(display_socket_1).emit('setKill', data);
            io.sockets.socket(display_socket_2).emit('setKill', data);

            io.sockets.socket(controller).emit('playAudio', { id: socket.id, music: 'scream'});
        
          });

          socket.on('disconnect', function (data) {

            var index = -1;
            for(var i=0; i<users.length; i++) {
              if(users[i].id == socket.id)
                index = i;
            }
            if(index != -1) {
              users.splice(index,1);
            }

          });
      });
  });
