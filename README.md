IOS_Study
=========

ios学习过程中积累的代码

重点对webview调用objective-c代码作了封装。

例如，下面是连续两次调用objective-c代码

<pre>
WebGap.exec("GPTestJs","test",{canshu:"333"},function(rs){
                alert("我是web对话框");
                WebGap.exec("GPTestJs","alert",{title:"提示",msg:rs.a});
    });
</pre>

