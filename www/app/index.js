function callPlugin(className,methodName,params,fn){
    alert(fn);
    params.fn=fn.toString();
    var obj = {
        class:className,
        method:methodName+"::",
        params:params
    }
    
    var paramsStr = JSON.stringify(obj);
    //location.href='cmd:{"class":"'+className+'","method":"'+methodName+'::","params":{"fn":"function(){alert(222)}","name":"ddd"}}';
    alert('cmd:'+paramsStr);
     location.href='cmd:'+paramsStr;
}


var host="http://10.10.6.45/";
$('#btn').click(function(e){
	alert('click');
                callPlugin("GPJsPlugin","test",{},function(){alert("33")});
    //location.href='cmd:{"class":"GPJsPlugin","method":"test::","params":{"fn":"function(){alert(222)}","name":"ddd"}}';
});
Ambow.getJSON(host+"list.php",function(rs){
      var htm="";
      var recs = rs.list,len=recs.length;
      for(var i=0;i<len;i++){
      var rec=recs[i];
        htm += "<li>"+rec.name+"</li>"
      }
      $("#list").html(htm);
    
}).error(function(error){
         alert("error");               
});
