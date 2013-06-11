<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<%@ page import="cht.ccsdk.proxy.*" %>
<%@ page import="cht.ccsdk.bean.*" %>
<%@ page import="com.appleprince.service.car.*" %>
<%@ page import="org.apache.wink.client.*" %>
<%@ page import="cht.paas.util.CloudLogger" %>
<%@ page import="cht.paas.util.LogLevel" %>
<%@ page import="javax.ws.rs.core.*" %>
<%@ page import="java.net.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%


String isvAccount="367f7deaa1ce47b185a0c91cb6d8f714";  // isv帳號
String isvKey="n+ABj+1w6e1Ht2A2ziBh0Q==";
CarService carService = new CarService(isvAccount, isvKey);


URL url= new URL("http://9.blog.xuite.net/_temp/5/9/c/8/3df86951b2788ec220e5bd185bb70d151370589254810706.jpg");  // 欲進行辨識的圖片URL
//進行影像車牌號碼辨識
ServiceResponse serviceResponse = carService.recognizeImage(url);
if(!"ok".equals(serviceResponse.getStatus())) {
 // service failed
out.println(serviceResponse.getStatus());
out.println(serviceResponse.getCode());
out.println(serviceResponse.getMessage());
}
//取得辨識結果
TaggedImage image = serviceResponse.getImages()[0];
out.println(image.getUrl());
out.println(image.getWidth());
out.println(image.getHeight());
for(TaggedImage.Tag tag : image.getTags()) {
 out.println(tag.getX());
 out.println(tag.getY());
 out.println(tag.getWidth());
 out.println(tag.getHeight());
 out.println(tag.getAttributes().get("plate").getValue());
}


%>
</body>
</html>
