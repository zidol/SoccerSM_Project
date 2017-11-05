<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="ch13.board.BoardDataBean" %>
<%@ page import="ch13.board.BoardDBBean" %>
<%@ include file="../etc/color.jspf" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
<link href="../etc/style_writeForm.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="../etc/script.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.0.min.js"></script>
<script type="text/javascript">
var oEditors = [];
$(function(){
      nhn.husky.EZCreator.createInIFrame({
          oAppRef: oEditors,
          elPlaceHolder: "ir1",
          //SmartEditor2Skin.html 파일이 존재하는 경로
          sSkinURI: "../SE2/SmartEditor2Skin.html",  
          htParams : {
              // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseToolbar : true,             
              // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
              bUseVerticalResizer : true,     
              // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
              bUseModeChanger : true,         
              fOnBeforeUnload : function(){
                   
              }
          }, 
          fOnAppLoad : function(){
              //기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
              oEditors.getById["ir1"].exec("PASTE_HTML", [""]);
          },
          fCreator: "createSEditor2"
      });
      
      //저장버튼 클릭시 form 전송
      $("#save").click(function(){
          oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
          $("#frm").submit();
      });    
});



</script>
</head>
<body >
<%
int num = Integer.parseInt(request.getParameter("num"));
String pageNum = request.getParameter("pageNum");
try {
	BoardDBBean dbPro = BoardDBBean.getInstance();
	BoardDataBean article = dbPro.updateGetArticle(num);

%>
<p>글수정</p>
<form method="post" name="writeForm" action="updatePro.jsp?pageNum=<%=pageNum %>" onsubmit="return writeSave()">
<table>
	<tr>
		<td width="80" bgcolor="<%=value_c%>" align="center">이름</td>
		<td align="left" width="650">
			<input type="text" name="writer" size="10" maxlength="10"
			value="<%=article.getWriter()%>" style="ime-mode:active;">
			<input type="hidden" name= "num" value="<%=article.getNum() %>">
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center">제목</td>
		<td align="left">
			<input type="text" size="40" maxlength="50" name="subject"
			value="<%="[수정] " + article.getSubject() %>" style="ime-mode:active;">
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">Email</td>
		<td align="left" >
			<input type="text" size="40" maxlength="30" name="email"
			value="<%=article.getEmail() %>" style="ime-mode:active;">
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c %>" align="center" >내용</td>
		<td align="left">
		<textarea name="content" id="ir1" rows="13" cols="40"
		 style="width:650px; height:350px;" ><%="[수정] " + article.getContent() %></textarea>
		</td>
	</tr>
	<tr>
		<td width="70" bgcolor="<%=value_c%>" align="center">비밀번호</td>
		<td align="left" >
		<input type="password" size="8" maxlength="12"
		name="passwd" style="ime-mode:inactive;">
		</td>
	</tr>
	<tr>
		<td colspan="2" bgcolor="<%=value_c%>" align="center">
		<input type="submit" value="글수정" id="save">
		<input type="reset" value="다시작성">
		<input type="button" value="목록보기"
		onclick="document.location.href='list.jsp?pageNum=<%=pageNum%>'"> 
		</td>
	</tr>
</table>
</form>

<%
}catch (Exception e) {}
%>


</body>
</html>