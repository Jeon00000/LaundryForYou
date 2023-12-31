<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="user.UserBean, review.ReviewDAO, reservation.PaymentDAO"%>
<jsp:include page="../include/header.jsp"></jsp:include>
<link rel="stylesheet" href="../css/myPage.css">
   
   <%
   UserBean ubean = new UserBean();
   String uid = (String) session.getAttribute("uid");
   String img = (String) session.getAttribute("img");
   Integer vip = (Integer) session.getAttribute("vip");
   
   ReviewDAO rdao = new ReviewDAO();
   int reviewCount = rdao.getReviewCount(uid);
   
   PaymentDAO pdao = new  PaymentDAO();
   int totalReservationPrice = pdao.getTotalReservationPrice(uid);
   
   
   int maxColorPhotos = reviewCount % 5; // 컬러 스탬프는 총 스탬프 개수에서 쿠폰으로 전환하고 남은 스탬프 개수 구함.
   int blackAndWhitePhotos = 5 - maxColorPhotos; // 5개에서 컬러 스탬프 개수 뺀 것이 흑백 스탬프.
   
/*    int stampCount = 0;
   if (reviewCount >= 1) {
	   stampCount++;
   } */
   %>
   <div class="userInfo-my">
      <div class="userInfoBox-my">
         <div class="userImg-my">
            <div class="userImgTop-my">
               <img alt="userImg" src="../img/<%=img %>" class="userImgScale-my">
               <h3 class="userName-my"> <span><%= uid %></span> 님</h3>
            </div>
            <div class="userBtn-my">
               <a href="updatePw.jsp" class="updatePw-my">비밀번호 수정</a>
               <a onclick="userCheck()" class="updateUser-my">회원정보 수정</a>
               <a href="../review/MyReview.jsp">후기 관리</a>
               <a href="../reservation/MyReservation.jsp">예약 관리</a>
            </div>
         </div>
         <div class="stamp-my">
            <a class="Title-my" href="stamp.jsp">
               <h2>스탬프</h2> <i class="ri-arrow-right-s-line"></i>
            </a>
            <p><span class="Count-my"><%=reviewCount % 5 %></span>개</p>
            <img alt="stamp" src="../img/stamp.png" class="stampImg-my">
         </div>
         <div class="coupon-my">
            <a class="Title-my">
               <h2>무료배송 쿠폰</h2>
            </a>
            <p><span class="Count-my"><%= reviewCount / 5 %></span>개</p>  <!-- 총 스탬프 개수를 5로 나누어 쿠폰 개수 구함 -->
            <img alt="coupon" src="../img/coupon.png" class="couponImg-my">
         </div>
         <%
         	
         %>
         <%
            if (totalReservationPrice >= 500000) {
         %>
           <div class="vip-my info-pop-up">
            <a class="Title-my">
               <span id="info-box">회원등급</span>
            </a>
            <img alt="vip" src="../img/vip.png" class="vipImg-my">
            <p>
            	<span class="point-my">VIP</span>회원
            	<img src="../img/mini-question.png">
            </p>
         </div>
         
         <div class="info-container">
		  <div class="message-container">
		    <div class="message-box">
		      <p><b>VIP 회원 혜택</b> &nbsp;<a href="../reservation/reservation.jsp" class="font14">지금 예약하러 가기 ></a></p>
		      <p><i class="ri-arrow-right-s-fill"></i>예약마다 무제한으로 10% 할인</p>
		      <p><i class="ri-arrow-right-s-fill"></i>세탁 시 안심 헹굼 무료</p>
		      <p>VIP 회원을 유지하려면 ?<br>
		      예약 누적 금액이 <b>50만 원 이상</b>이면 VIP 회원입니다. <br>
		      VIP 회원이 되어서 매 예약마다 혜택을 받아보세요.</p>
		    </div>
		  </div>
		</div>
         <%
            } else {
         %>
       
         <div class="vip-my info-pop-up">
            <a class="Title-my">
               <span id="info-box">회원등급</span>
            </a>
            <img alt="normal" src="../img/normal.png" class="vipImg-my">
            <p>
            	<span class="point-my">일반</span>회원
            	<img src="../img/mini-question.png">
            </p>
         </div>
         
         <div class="info-container">
		  <div class="message-container">
		    <div class="message-box">
		      <p><b>일반 회원 혜택</b> &nbsp;<a href="../reservation/reservation.jsp" class="font14">지금 예약하러 가기 ></a></p>
		      <p><i class="ri-arrow-right-s-fill"></i>매년 생일마다 할인쿠폰 제공</p>
		      <p><i class="ri-arrow-right-s-fill"></i>스탬프를 모으면 무료배송 쿠폰 제공</p>
		      <p>VIP 회원이 되려면 ?<br>
		      예약 누적 금액이 <b>50만 원 이상</b>이면 VIP 회원으로 승급됩니다. <br>
		      VIP 회원이 되어서 매 예약마다 혜택을 받아보세요.</p>
		    </div>
		  </div>
		</div>
         <%
            }
         %>
      </div>
   </div>
   <div class="container-my">
      <div class="couponBox-my">
         <h2 class="stampTitle-my">STAMP</h2>
         <div class="bubble-my">
         </div>
         	
         <div class="bubbleMono-my">
         <%
               for(int i = 0; i < maxColorPhotos; i++) {
            %>
               <img alt="bubble_mono" src="../img/bubble.png" class="bubbleImg-my">
            <%
               }
         	%>
            <%
           	   for (int i = 0; i < blackAndWhitePhotos; i++) {
            %>
               <img alt="bubble_mono" src="../img/bubble_mono.png" class="bubbleImg-my">
            <%
               }
            %>
           
            
         </div>
      </div>
      
      <div class="banner-my">
         <img alt="banner" src="../img/banner.png" class="bannerImg-my">
      </div>
      
      <div class="customer-level">
      	<p>회원 등급</p>
      	
      	<div class="level-flex-row">
	      	<div class="level-flex-row ml100 h100">
	      		<div class="level-flex-col item-center">
	      		<img src="../img/normal.png">
	      		<p class="size18">일반회원</p>
	      		</div>
	      		<div class="level-flex-col">
	      			<p><b>혜택 하나!</b> 매년 생일마다 <span class="color-blue">할인쿠폰</span> 챙겨드릴게요.</p>
	      			<p><b>혜택 둘!</b> 스탬프를 모아 <span class="color-blue">무료배송 쿠폰</span>으로 바꿔보세요.</p>
	      		</div>
	      	</div>
	      	<div class="level-flex-row ml100 h100">
	      		<div class="level-flex-col item-center">
	      		<img src="../img/vip.png">
	      		<p class="size18">VIP회원</p>
	      		</div>
	      		<div class="level-flex-col">
	      			<p><b>혜택 하나!</b> 예약마다 무제한으로 <span class="color-blue">10% 할인 혜택</span>받아보세요.</p>
	      			<p><b>혜택 둘!</b> 세탁 과정에 <span class="color-blue">안심 헹굼</span>을 무료로 해드려요.</p>
	      		</div>
	      	</div>
	    </div>  	
      	<div class="level-flex-row mt80 ml100">
      		<img src="../img/question-mark.png">
      		<p class="ml10">회원 등급을 올리려면?</p>
      		<div class="ml20">
      			<p>예약 누적 금액이 <b>50만 원 이상</b>이면 일반회원에서 VIP 회원으로 승급됩니다. VIP 회원이 되어서 매 예약마다 혜택을 받아보세요.</p>
      		</div>
      	</div>
      </div>
      
   </div>

   <script src="../js/myPage.js"></script>
   
<jsp:include page="../include/footer.jsp"></jsp:include>