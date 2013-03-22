
var net = require('net');
var listenPort = 7003;

var server = net.createServer(function(socket){
	console.log('connect: ' +
    socket.remoteAddress + ':' + socket.remotePort);
    socket.setEncoding('binary');
    	
    	//接收到数据
    socket.on('data',function(data){

        console.log('recv:' + data);
		socket.write('hello\r\n');
		console.log('back..');
  		//socket.pipe(socket);
    });

    //数据错误事件
    socket.on('error',function(exception){
        console.log('socket error:' + exception);
        socket.end();
    });
    //客户端关闭事件
    socket.on('close',function(data){
        console.log('close: ' +
            socket.remoteAddress + ' ' + socket.remotePort);

    });
}).listen(listenPort);

//服务器监听事件
server.on('listening',function(){
    console.log("server listening:" + server.address().port);
});

//服务器错误事件
server.on("error",function(exception){
    console.log("server error:" + exception);
}); 