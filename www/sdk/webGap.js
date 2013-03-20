var WebGap={
    /**
     *className (String) 要调用的oc类名
     *methodName (String) 要调用的类下的方法
     *params (json对象) 调用方法的参数
     *fn (Function) 回调函数 ，回调函数有一个返回的参数，为json对象
     */
    exec:function(className,methodName,params,fn){
        var fn = fn||function(){};
        var str=fn.toString();
        var reg = /function \((.*?)\)/;
        str.search(reg);
        var fnParamsName=RegExp.$1||"resp";
        params.fn=str;
        params.fnParamsName=fnParamsName;
        var obj = {
            class:className,
            method:methodName+":",
            params:params
        }
    
        var paramsStr = JSON.stringify(obj);
        location.href='gap:'+paramsStr;
    }
}