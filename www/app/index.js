
var host="http://10.10.6.45/";
$('#btn').click(function(e){
    WebGap.exec("GPTestJs","test",{canshu:"333"},function(rs){
                alert("我是web对话框");
                WebGap.exec("GPTestJs","alert",{title:"提示",msg:rs.a});
    });
                
    
});
// WebGap.exec("GPTestJs","alert",{title:"444",msg:"ddddd"});
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
