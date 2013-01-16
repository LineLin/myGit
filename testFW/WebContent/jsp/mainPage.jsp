<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%@page import="com.testFW.bo.UserBO"%>
<%@page import="com.testFW.util.ConstantsUtil"%>
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String fun = (String) request.getAttribute("fun");
	if (fun == null)
		fun = "";
	UserBO user = (UserBO) request.getAttribute("loginUser");
	UserBO visitedUser = (UserBO) request.getAttribute("visitedUser");
	boolean hasLogin = false;
	if (visitedUser == null) {
		visitedUser = new UserBO();
	}
	if (user == null) {
		user = new UserBO();
	} else {
		hasLogin = true;
	}
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="/css/mainpage.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/jquery-1.8.2.js"></script>
<!-- aToolTip css -->
<link type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/atooltip/atooltip.css"
	rel="stylesheet" media="screen" />
<script language="javascript" type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/fancybox/jquery.fancybox.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=ConstantsUtil.FW_DOMAIN%>/css/plugin/fancybox/jquery.fancybox.css"
	media="screen" />
<!-- aToolTip js -->
<script type="text/javascript"
	src="<%=ConstantsUtil.FW_DOMAIN%>/js/plugin/atooltip/jquery.atooltip.js"></script>

<script language="javascript" type="text/javascript">
	$(function() {
		$(".navi_news").hover(function() {
			$(".navi_news").addClass("on");
			$(".navi_reply").removeClass("on");
			$(".topbar_news").show();
			$(".topbar_reply").hide();
		});
		$(".navi_reply").hover(function() {
			$(".navi_news").removeClass("on");
			$(".navi_reply").addClass("on");
			$(".topbar_news").hide();
			$(".topbar_reply").show();
		});
		$('.small_search').click(function() {
			if (this.value == this.defaultValue) {
				this.value = '';
			}
		});
		$('.fancybox-iframe').fancybox({
			'padding' : 0,
			'margin' : 0,
			'scrolling' : 'no',
			'type' : 'ajax'
		});
		$('.small_search').blur(function() {
			if (this.value == '') {
				this.value = this.defaultValue;
			}
		});
		$('a.fixedTip').aToolTip();
		$('input.fixedTip').aToolTip();
	});
	function userQuit() {
		$.ajax({
			type : "POST",
			url : "/action/user/userquit",
			dataType : "text",
			success : function(msg) {
				location.reload();
			}
		});
	}
</script>
<title>主页</title>
</head>
<body>
	<div class="wrap">
		<div class="header">
			<div class="search_box">
				<form method="post" id="sForm"
					action="<%=ConstantsUtil.FW_DOMAIN%>/action/system/search">
					<input name="s" id="s" value="站内搜索" class="small_search"
						type="text" />
				</form>
			</div>
			<h1>
				<a href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
					title="testFW Logo"><img
					src="<%=ConstantsUtil.FW_DOMAIN%>/img/easyfw.png" alt="TestFW Logo" />
				</a>
			</h1>
			<p>
				不因感情,而影响行动,<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					不因得失,而惧怕前行. 
			</p>
		</div>
		<div class="container">
			<div class="sidebar">
				<ul class="side_nav">
					<li <%if ("mainpage".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage"
						title="查看个人主页信息" id="mainpage">主页</a></li>
					<li <%if ("diary".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/diary"
						title="查看日志" id="diary">日志</a></li>
					<li <%if ("picture".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/picture"
						title="查看图册信息" id="picture">图册</a></li>
					<li <%if ("aboutus".equals(fun)) {%> class="active" <%}%>><a
						class="fixedTip"
						href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/aboutus"
						title="关于我以及本站" id="aboutus">about</a></li>
				</ul>
			</div>
			<div class="main_wrap">
				<div class="main">
					<div class="group" id="paging">
						<%
							if (!hasLogin) {
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/login.html">登录</a>
						<%
							} else {
						%>
						<a
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/system/mainpage/<%=user.getId()%>"
							title="点击进入主页"><%=user.getName()%></a> <a href="#"
							onclick="userQuit();" title="点击退出">退出</a>
						<%
							}
						%>
						<a class="fancybox-iframe"
							href="<%=ConstantsUtil.FW_DOMAIN%>/jsp/iframe/message.html">留言</a>
					</div>
					<div class="topbar_left">
						<h1>卡莱尔</h1>
						<h2>测试人员</h2>
						<div id="picture-profile">
							<img src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/profile.jpg" />
						</div>
					</div>
					<div class="topbar_right">
						<div class="topbar_info">
							<ul>
								<li>加入日期：<a href="#">2012/12/20</a>
								</li>
								<li>日志：<a href="#"><em>12</em>&nbsp;篇</a>
								</li>
								<li>图册：<a href="#"><em>9</em>&nbsp;集</a>
								</li>
								<li>专修：<a href="#">java,C++</a>
								</li>
								<li>联系方式：<a href="#">不公开</a>
								</li>
							</ul>
						</div>
						<div class="topbar_msg">
							<div class="topbar_navi">
								<a href="#" title="回复" class="navi_reply"></a> <a href="#"
									title="动态" class="navi_news on"></a>
							</div>
							<div class="topbar_content">
								<div class="topbar_news">
									<ul>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>16分钟前</em>发表了日志<a href="#">《关于12306网站设计的一点感想》</a><span>[12评/45阅]</span>
											</div></li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>3小时前</em>上传了1张图片到图册<a href="#">《冬日美景》</a><span>[35评/93阅]</span>
											</div></li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>3小时前</em>上传了3张图片到图册<a href="#">《冬日美景》</a><span>[35评/93阅]</span>
											</div></li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>12小时前</em>发表了日志<a href="#">《天空从来都不是蓝色的》</a><span>[67评/122阅]</span>
											</div></li>
										<li>
											<div class="news_cont">
												<b>Kalor</b>在<em>14小时前</em>发表了日志<a href="#">《岁末，碎末》</a><span>[67评/122阅]</span>
											</div></li>
									</ul>
								</div>
								<div class="topbar_reply">
									<ul>
										<li><img
											src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser.jpg"
											alt="" />
											<div class="reply_r">
												<a href="" class="name">水晶</a>
												<p class="time">
													<em>12/</em>21
												</p>
												<p class="cont">:&nbsp;首页重新设计了？快点吧...</p>
											</div>
										</li>
										<li><img
											src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser.jpg"
											alt="" />
											<div class="reply_r">
												<a href="" class="name">水晶</a>
												<p class="time">
													<em>12/</em>21
												</p>
												<p class="cont">:&nbsp;very cool,but not fell good....</p>
											</div>
										</li>
										<li><img
											src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_boy.jpg"
											alt="" />
											<div class="reply_r">
												<a href="" class="name">Kalor</a>
												<p class="time">
													<em>12/</em>21
												</p>
												<p class="cont">:&nbsp;信息量大了一点，然后布局合理了一些？还有别的么？</p>
											</div>
										</li>
										<li><img
											src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser_girl.jpg"
											alt="" />
											<div class="reply_r">
												<a href="" class="name">蝴蝶</a>
												<p class="time">
													<em>12/</em>21
												</p>
												<p class="cont">:&nbsp;新首页比原来好在那里？反正我是没看出来..</p>
											</div>
										</li>
										<li><img
											src="<%=ConstantsUtil.FW_DOMAIN%>/img/head/mini/defaultUser.jpg"
											alt="" />
											<div class="reply_r">
												<a href="" class="name">水晶</a>
												<p class="time">
													<em>12/</em>21
												</p>
												<p class="cont">:&nbsp;快点吧...</p>
											</div>
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
					<div id="content-gallery">
						<div class="gallery-item" id="post-116">
							<h2>
								<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
									<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
							</h2>
						</div>
						<div class="gallery-item" id="post-134">
							<a title="测试图册缩略图" href="#"> <img width="219" height="219"
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
							</a>
							<h2>测试图册缩略图</h2>
						</div>
						<div class="gallery-item" id="post-116">
							<h2>
								<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
									<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
							</h2>
						</div>
						<div class="gallery-item" id="post-134">
							<a title="测试图册缩略图" href="#"> <img width="219" height="219"
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
							</a>
							<h2>测试图册缩略图</h2>
						</div>
						<div class="gallery-item" id="post-116">
							<h2>
								<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
									<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
							</h2>
						</div>
						<div class="gallery-item" id="post-134">
							<a title="测试图册缩略图" href="#"> <img width="219" height="219"
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
							</a>
							<h2>测试图册缩略图</h2>
						</div>
						<div class="gallery-item" id="post-116">
							<h2>
								<a title="测试瀑布流日志标题" href="#">测试瀑布流日志标题
									<p>详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容详细内容...</p> </a>
							</h2>
						</div>
						<div class="gallery-item" id="post-134">
							<a title="测试图册缩略图" href="#"> <img width="219" height="219"
								class="" title="测试缩略图标题~~~~test pic-sc title"
								src="http://www.press75.com/themes/blocco/files/2011/09/exit-219x219.jpg">
									<div class="overTitle">ce阿打算打算打算打算打算打算的asdaasdasdasd爱上大声大声道</div>
							</a>
							<h2>测试图册缩略图</h2>
						</div>
					</div>
					<!-- content-gallery -->

					<div class="section_wrap more_padding">
						<h3>
							<strong>1989</strong> Keep learning &amp; Remain Modest.
						</h3>
						<small>&copy; Copyright 2012 TestFW. All rights reserved.
							Designed by <a target="_blank"
							href="<%=ConstantsUtil.FW_DOMAIN%>/action/user/1">Kalor</a> </small><br><br>
					</div>
				</div>
			</div>
		</div>
</body>
</html>