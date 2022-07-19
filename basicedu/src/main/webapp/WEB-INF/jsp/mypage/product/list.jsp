<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"  errorPage="/cmmn/error.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" href="/resources/css/common.css">

<h3>| 상품관리</h3>

<form action="./list" name="form" id="form" class="sh">
	<input type="text" title="검색어" name="keyword" value="${param.keyword}" />
	<button type="submit" class="btn is-grey">검색</button>
</form>

<table class="table">
	<colgroup>
		<col width="20%">
		<col width="30%">
		<col width="15%">
		<col width="15%">
		<col width="20%">
	</colgroup>
	<thead>
		<tr>
			<th>상품 이미지</th>
			<th>상품명</th>
			<th>상품 수량</th>
			<th>금액</th>
			<th>등록일</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="result" items="${resultList}" varStatus="status">
			<tr>
				<td>
					<c:if test="${not empty result.imgFileName}">
						<a href="./view?productNo=${result.productNo}"><img alt="상품 이미지" src="/upload/product/thumb/${result.imgFileName}"></a>
					</c:if>
				</td>
				<td><a href="./view?productNo=${result.productNo}">${result.productName}</a></td>
				<td>${result.quantity}</td>
				<td><fmt:formatNumber value="${result.price}" pattern="#,###" /></td>
				<td><fmt:formatDate value="${result.registerDate}" pattern="yyyy-MM-dd HH:mm"/></td>
			</tr>
		</c:forEach>
		<c:if test="${fn:length(resultList) eq 0}">
			<tr>
				<td colspan="5" class="txt-center">등록한 상품이 없습니다.</td>
			</tr>
		</c:if>
	</tbody>
</table>

<c:if test="${fn:length(resultList) != 0 }">
	<div class="pagination_wrap">
		<div class="pagination">
			<c:set var="pageIndex" value="${pagination.pageIndex}" />
			<c:set var="totalPageCount" value="${pagination.totalPageCount}" />
			<c:url var="link" value="./list?keyword=${param.keyword}" />

			<c:if test="${pageIndex eq 1}">
				<a>이전</a>
			</c:if>
			<c:if test="${pageIndex ne 1}">
				<a href="${link}&pageIndex=${pageIndex-1}">이전</a>
			</c:if>
			<c:forEach var="num" begin="${pagination.firstPageNo}" end="${pagination.lastPageNo}">
				<c:choose>
					<c:when test="${pageIndex eq num}">
						<a class="active">${num}</a>
					</c:when>
					<c:otherwise>
						<a href="${link}&pageIndex=${num}">${num}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageIndex eq totalPageCount}">
				<a>다음</a>
			</c:if>
			<c:if test="${pageIndex ne totalPageCount}">
				<a href="${link}&pageIndex=${pageIndex+1}">다음</a>
			</c:if>
		</div>
	</div>
</c:if>

<div class="btnSet">
	<a href="./write" class="btn is-blue"><span>등록</span></a>
</div>
