<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./head.jsp"%>
<!DOCTYPE HTML>
<html>
<style>
pre {
whitewhite-space: pre-wrap; /* css-3 */
whitewhite-space: -moz-pre-wrap; /* Mozilla, since 1999 */
whitewhite-space: -pre-wrap; /* Opera 4-6 */
whitewhite-space: -o-pre-wrap; /* Opera 7 */
word-wrap: break-word; /* Internet Explorer 5.5+ */
whitewhite-space : normal ; /* Internet Explorer 5.5+ */
} 
</style>
<body style="font-size: 16px">
第${item.id }型: ${item.name }
<br/>
<textarea rows="30" cols="100" style="margin-left: 30px">${item.note }</textarea>
</body>
</html>