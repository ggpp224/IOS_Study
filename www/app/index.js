
var host="http://10.10.6.45/";
$('#btn').click(function(e){
	alert('click');
});
Ambow.getJSON(host+"list.php",function(rs){
	alert(rs.list.length);
      var htm="";
      var recs = rs.list,len=recs.length;
      for(var i=0;i<len;i++){
      var rec=recs[i];
        htm += "<li>"+rec.name+"</li>"
      }
      $("#list").html(htm);
    
});
