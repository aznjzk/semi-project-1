<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "vo.*" %>
<%@ page import = "dao.*" %>
<%@ page import = "java.util.*" %>
<%
	// 인코딩 처리
	response.setCharacterEncoding("UTF-8");
	
	// ANSI CODE	
	final String RESET = "\u001B[0m"; 
	final String LIM = "\u001B[41m";
	final String KIM = "\u001B[42m";
	final String SONG = "\u001B[43m";
	final String YANG = "\u001B[44m";

	CategoryDao ctgrDao = new CategoryDao(); // CategoryDao 객체 생성
	ArrayList<Category> categoryList = ctgrDao.categoryList(); // categoryList 메서드 호출하여, 옵션에 표시할 categoryCntList 객체 가져오기
	
	/* categoryName의 디폴트 값을 "전체"로 설정 */
	// null로 넘어와도 → 전체 카테고리의 게시글을 출력하고
	// "전체"로 넘어와도 → 전체 카테고리의 게시글을 출력해야 하기 때문
	String categoryName = "전체";
	if(request.getParameter("categoryName") != null){
		categoryName = request.getParameter("categoryName");	
	}
	
	ProductDao productDao = new ProductDao();
	ArrayList<Product> productListCate = productDao.productListCateByPage(categoryName, 0, 10);

	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>productList | Template</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
</head>
<body>
<!------------ 상단 네비 바 ------------>
<!-- 상단 네비 바(메인메뉴) -->
<div>
	<jsp:include page="/inc/mainMenu.jsp"></jsp:include>
</div>


	
<!-- Featured Section Begin -->
<section class="featured spad">
<div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <h2>Featured Product</h2>
                    </div>
                    <div class="featured__controls">
                        <ul>
                            <li class="active" data-filter="*">전체</li>
                            <%
								for(Category category : categoryList) {
							%>
                            <li data-filter=".<%=category.getCategoryName()%>"><%=category.getCategoryName()%></li>
                            <% 
								}
							%>
                        </ul>
                    </div>
                </div>
            </div>
	
	    <div class="row featured__filter">
		<%
			for(Product product : productListCate) {
				int productNo = product.getProductNo();
				ProductImgDao productImgDao = new ProductImgDao();
				ArrayList<ProductImg> productImgs = new ArrayList<>();
				productImgs = productImgDao.getProductImages(productNo);
				if(productImgs.size() != 0){
		%>
			<div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
				<div class="featured__item">
					<div class="featured__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/productImgUpload/<%=productImgs.get(0).getProductSaveFilename()%>">
						<ul class="featured__item__pic__hover">
							<li><a href="#"><i class="fa fa-heart"></i></a></li>
							<li><a href="#"><i class="fa fa-retweet"></i></a></li>
							<li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
						</ul>
					</div>
					<div class="featured__item__text">
			    		<h6><a href="<%=request.getContextPath()%>/product/productListOne.jsp?productNo=<%=product.getProductNo()%>">
							<%=product.getProductName()%>
						</a></h6>
						<h5><%=product.getProductPrice()%>원</h5>
							<%=product.getProductStatus()%>
					</div>
				</div>
			</div>
		<%
				}
			}
		%>
		</div>
			<a href="<%=request.getContextPath()%>/product/productList.jsp?categoryName=전체">
				더보기
			</a>
	</div>
</section>
<!-- Featured Section End -->
	
	<!-- 새로운 상품 추가하는 버튼 -->
	<%
		//loginId가 관리자2(최고위직)일 경우에만 상품 추가 가능
		if(session.getAttribute("loginId") != null){
			if(session.getAttribute("loginId").equals("admin")){ 
	%>
			<a href="<%=request.getContextPath()%>/product/addProduct.jsp">상품 추가</a>
	<%
			}
		}
	%>
	
	
	
<!------------ 페이징 예정 ------------>

<!------------ 하단 저작권 바 ------------>
<div>
	<jsp:include page="/inc/copyRight.jsp"></jsp:include>
</div>

<!-- Js Plugins -->
   <script src="<%=request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/jquery.nice-select.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/jquery-ui.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/jquery.slicknav.js"></script>
   <script src="<%=request.getContextPath()%>/js/mixitup.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/owl.carousel.min.js"></script>
   <script src="<%=request.getContextPath()%>/js/main.js"></script>
</body>
</html>