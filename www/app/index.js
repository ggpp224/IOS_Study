function callPlugin(className,methodName,params,fn){
   // alert(11);
    var str=fn.toString();
    var reg = /function \((.*?)\)/;
    str.search(reg);
    var fnParamsName=RegExp.$1||"";
    params.fn=str;
    params.fnParamsName=fnParamsName;
    var obj = {
        class:className,
        method:methodName+":",
        params:params
    }
    
    var paramsStr = JSON.stringify(obj);
    //location.href='cmd:{"class":"'+className+'","method":"'+methodName+'::","params":{"fn":"function(){alert(222)}","name":"ddd"}}';
     location.href='gap:'+paramsStr;
} 


var host="http://10.10.6.45/";
$('#btn').click(function(e){
                callPlugin("GPTestJs","test",{},function(rs){alert(rs.a)});
 //location.href='cmd:{"class":"GPJsPlugin","method":"test::","params":{"fn":"function(){alert("222")}"}}';
});
Ambow.getJSON(host+"list.php",function(rs){
      var htm="";
      var recs = rs.list,len=recs.length;
      for(var i=0;i<len;i++){
      var rec=recs[i];
        htm += "<li>"+rec.name+"</li>";
      }
      $("#list").html(htm);
    
}).error(function(error){
         alert("error");               
});
