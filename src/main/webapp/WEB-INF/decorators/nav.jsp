<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<ul class="nav nav-list">
	<c:forEach items="${LOGIN_USER.authMenu}" var="ppm" varStatus="menuVs">
		<li id="menu_${ppm.pm.id}" class="menu-level-${menuVs.count}">
			<a href="#" class="dropdown-toggle">
				<i class="${ppm.pm.icon}"></i>
				<span class="menu-text">${ppm.pm.name}</span>
		
				<b class="arrow icon-angle-down"></b>
			</a>
		
			<ul class="submenu">
				<c:forEach items="${ppm.children}" var="pm">
					<li id="menu_${pm.pm.id}" class="menu-level-${menuVs.count}">
						<a href="javascript:" class="dropdown-toggle">
							<i class="icon-double-angle-right"></i>
							${pm.pm.name}
							<b class="arrow icon-angle-down"></b>
						</a>
						
						<ul class="submenu">
							<c:forEach items="${pm.children}" var="m">
							<li id="menu_${m.id}" class="menu-level-${menuVs.count}">
								<a href="javascript:gotoHref('<%=request.getContextPath()%>${m.href}', '${ppm.pm.id}', '${pm.pm.id}', '${m.id}')" >
									<i class="${m.icon}"></i>${m.name}
								</a>
							</li>
							</c:forEach>
						</ul>
					</li>
				</c:forEach>
			</ul>
		</li>
	</c:forEach>
</ul>
<input type="hidden" id="setmidUrl" value="<%=request.getContextPath()%>/setCurrentMenuId"/>
<script type="text/javascript">
	$(function() {
		//alert("sdfsdf");
		var ppmId = <%=session.getAttribute("ppmId")%>;
		var pmId = <%=session.getAttribute("pmId")%>;
		var mid = <%=session.getAttribute("mid")%>;
		//alert(ppmId+"=="+pmId+"=="+mid);
		if(ppmId==null || pmId==null || mid==null) {
			//alert("+=-=-");
			$(".menu-level-1").addClass("active");
		} else {
			$(("#menu_"+ppmId)).addClass("active open");
			$(("#menu_"+pmId)).addClass("active open");
			//$(("#menu_"+pmId)).addClass("open");
			$(("#menu_"+mid)).addClass("active");
		}
	});
	function gotoHref(href, ppm, pm, m) {
		//alert(href);
		$.post($("#setmidUrl").val(), {ppmId:ppm, pmId:pm, mid:m}, function(res) {
			if(res=='1') {window.location.href = href;}
		}, "json");
	}
</script>