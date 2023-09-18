<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--  
    Document Title
    =============================================
    -->
    <title>동네북 | 우리동네 동네북</title>
    <!--  
    Favicons
    =============================================
    -->
    <link rel="apple-touch-icon" sizes="57x57" href="assets/images/favicons/apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="assets/images/favicons/apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="assets/images/favicons/apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="assets/images/favicons/apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="assets/images/favicons/apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="assets/images/favicons/apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="assets/images/favicons/apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="assets/images/favicons/apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="assets/images/favicons/apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="assets/images/favicons/android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="assets/images/favicons/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="assets/images/favicons/favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="assets/images/favicons/favicon-16x16.png">
    <link rel="manifest" href="assets/images/favicons/manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="assets/images/favicons/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <!--  
    Stylesheets
    =============================================
    
    -->
    <!-- Default stylesheets-->
    <link href="assets/lib/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Template specific stylesheets-->
    <link href="https://fonts.googleapis.com/css?family=Roboto+Condensed:400,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Volkhov:400i" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">
    <link href="assets/lib/animate.css/animate.css" rel="stylesheet">
    <link href="assets/lib/components-font-awesome/css/font-awesome.min.css" rel="stylesheet">
    <link href="assets/lib/et-line-font/et-line-font.css" rel="stylesheet">
    <link href="assets/lib/flexslider/flexslider.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="assets/lib/owl.carousel/dist/assets/owl.theme.default.min.css" rel="stylesheet">
    <link href="assets/lib/magnific-popup/dist/magnific-popup.css" rel="stylesheet">
    <link href="assets/lib/simple-text-rotator/simpletextrotator.css" rel="stylesheet">
    <!-- Main stylesheet and color file-->
    <link href="assets/css/style.css" rel="stylesheet">
    <link id="color-scheme" href="assets/css/colors/default.css" rel="stylesheet">
    <link href="../css/bookdetail.css" rel="stylesheet">
    <script type="text/javascript">


    </script>
  </head>
  <body data-spy="scroll" data-target=".onpage-navigation" data-offset="60">
  <%@ include file="menu.jsp"%>
    <main>
      <div class="main">
        <section class="module">
          <div class="container">
            <div class="row"> 
              <div class="col-sm-6 mb-sm-40"><a class="gallery" href="/img/bookimg/${bookdetail.bkimg }"><img src="/img/bookimg/${bookdetail.bkimg }" alt="책이미지"/></a>
              </div>
              <div class="col-sm-6">
                <div class="row">
                  <div class="col-sm-12">
                    <h1 class="product-title font-alt">${bookdetail.bkname }</h1>
                    <img class="zheart" id="zheart" src="../img/icon/heartOff.png"/>
                  </div>
                  <div class="col-sm-12">
                    <h5 class="product-title font-alt">${bookdetail.bkwrite }</h5>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12"><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star-off"></i></span><a class="open-tab section-scroll" href="#reviews">-2개의 리뷰</a>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-6">
                    <div class="price font-alt"><span class="amount"><fmt:formatNumber value="${bookdetail.bkprice }" pattern="#,###"/>원</span></div>
                  </div>
                </div>
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="description">
                      <p>${bookdetail.bkscontent }</p>
                    </div>
                  </div>
                </div>
                
               <div class="row mb-20"> 
                   <ul class="nav nav-tabs font-alt" role="tablist">
                   <li class="active"><a href="#buy" data-toggle="tab">구매</a></li>
                   <li><a href="#trade" data-toggle="tab">대여</a></li>
                  </ul>
                  
                <div class="tab-content">
                
                <div class="tab-pane active" id="buy">
                 <form action="./cart" method="post" id="form">
                    <input type="hidden" name="bkimg" value="${bookdetail.bkimg }">
                    <input type="hidden" name="price" value="${bookdetail.bkprice }">
                    <input type="hidden" name="bkno" value="${bookdetail.bkno }">
                    <textarea name="bkscontent" style=display:none>${bookdetail.bkscontent }</textarea> 
                    
                 <c:if test="${sessionScope.mid ne null }">
                   <div class="col-sm-4 mb-sm-20">
                     <input class="form-control input-lg" type="number" name="amount"  max="${detail.bstock }" min="1" required="required"/>
                    </div>
                   <div class="col-sm-8"><button class="btn btn-lg btn-block btn-round btn-b" type="submit">장바구니 담기</button></div>
                  </c:if> 
                  <c:if test="${sessionScope.mid eq null }">
                   <div class="col-sm-8"><a class="btn btn-lg btn-block btn-round btn-b">회원만 이용가능합니다.</a></div>
                  </c:if> 
                 </form>
                </div>
                
                 <div class="tab-pane" id="trade">
                  <div class="col-sm-6 mb-sm-20">
                    대여일<input class="form-control input-lg" type="date" name="" value="1" max="40" min="1" required="required"/>
                  </div>
                  <div class="col-sm-6 mb-sm-20">
                    반납일<input class="form-control input-lg" type="date" name="" value="1" max="40" min="1" required="required"/>
                  </div>
                    <div class="col-sm-12"><br><a class="btn btn-lg btn-block btn-round btn-b" href="#">대여하기</a></div>
                  </div>
                  
                </div> 
                </div> 
                <div class="row mb-20">
                  <div class="col-sm-12">
                    <div class="product_meta" >태그 : <a href="./booklist?searchN=write&searchV=${bookdetail.bkwrite }" >#${bookdetail.bkwrite }</a>
                    </div>
                  </div>
                </div>
              </div>
            </div>
           <!--  </form> -->
            
            <div class="row mt-70">
              <div class="col-sm-12">
                <ul class="nav nav-tabs font-alt" role="tablist">
                  <li class="active"><a href="#description" data-toggle="tab">상품정보</a></li>
                  <li><a href="#reviews" data-toggle="tab">리뷰 (2)</a></li>
                </ul>
                <div class="tab-content">
                  <div class="tab-pane active" id="description">
                    <p>${bookdetail.bkcontent }</p>
                  </div>
                
                  <div class="tab-pane" id="reviews">
                    <div class="comments reviews">
                      <div class="comment clearfix">
                        <div class="comment-avatar"><img src="" alt="avatar"/></div>
                        <div class="comment-content clearfix">
                          <div class="comment-author font-alt"><a href="#">망곰</a></div>
                          <div class="comment-body">
                            <p>음 이소설은 아주 판타스틱하고 영감적이에요 </p>
                          </div>
                          <div class="comment-meta font-alt">Today, 14:55 -<span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star"></i></span><span><i class="fa fa-star star-off"></i></span>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="comment-form mt-30">
                      <h4 class="comment-form-title font-alt">Add review</h4>
                      <form method="post">
                        <div class="row">
                          <div class="col-sm-4">
                            <div class="form-group">
                              <label class="sr-only" for="name">Name</label>
                              <input class="form-control" id="name" type="text" name="name" placeholder="Name"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                              <label class="sr-only" for="email">Name</label>
                              <input class="form-control" id="email" type="text" name="email" placeholder="E-mail"/>
                            </div>
                          </div>
                          <div class="col-sm-4">
                            <div class="form-group">
                              <select class="form-control">
                                <option selected="true" disabled="">Rating</option>
                                <option value="1">1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5</option>
                              </select>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <div class="form-group">
                              <textarea class="form-control" id="" name="" rows="4" placeholder="Review"></textarea>
                            </div>
                          </div>
                          <div class="col-sm-12">
                            <button class="btn btn-round btn-d" type="submit">Submit Review</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        <hr class="divider-w">
        <section class="module">
          <div class="container">
            <div class="row">
              <div class="col-sm-6 col-sm-offset-3">
                <h2 class="module-title font-alt">베스트셀러</h2>
              </div>
            </div>
            <div class="row">
              <div class="owl-carousel text-center" data-items="5" data-pagination="false" data-navigation="false">
              <c:forEach items="${booktop }" var="row">
                <div class="owl-item">
                  <div class="col-sm-12">
                    <div class="ex-product"><a href="./bookdetail?bkno=${row.bkno}"><img src="/img/bookimg/${row.bkimg}" alt="Leather belt"/></a>
                      <h4 class="shop-item-title font-alt"><a href="./bookdetail?bkno=${row.bkno}">${row.bkname}</a></h4><fmt:formatNumber value="${row.bkprice}" pattern="#,###"/>원
                    </div>
                  </div>
                </div>
               </c:forEach>
              </div>
            </div>
          </div>
        </section>
        
        <!-- 풋영역 -->
        <div class="module-small bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">About Titan</h5>
                  <p>The languages only differ in their grammar, their pronunciation and their most common words.</p>
                  <p>Phone: +1 234 567 89 10</p>Fax: +1 234 567 89 10
                  <p>Email:<a href="#">somecompany@example.com</a></p>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Recent Comments</h5>
                  <ul class="icon-list">
                    <li>Maria on <a href="#">Designer Desk Essentials</a></li>
                    <li>John on <a href="#">Realistic Business Card Mockup</a></li>
                    <li>Andy on <a href="#">Eco bag Mockup</a></li>
                    <li>Jack on <a href="#">Bottle Mockup</a></li>
                    <li>Mark on <a href="#">Our trip to the Alps</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Blog Categories</h5>
                  <ul class="icon-list">
                    <li><a href="#">Photography - 7</a></li>
                    <li><a href="#">Web Design - 3</a></li>
                    <li><a href="#">Illustration - 12</a></li>
                    <li><a href="#">Marketing - 1</a></li>
                    <li><a href="#">Wordpress - 16</a></li>
                  </ul>
                </div>
              </div>
              <div class="col-sm-3">
                <div class="widget">
                  <h5 class="widget-title font-alt">Popular Posts</h5>
                  <ul class="widget-posts">
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-1.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Designer Desk Essentials</a></div>
                        <div class="widget-posts-meta">23 january</div>
                      </div>
                    </li>
                    <li class="clearfix">
                      <div class="widget-posts-image"><a href="#"><img src="assets/images/rp-2.jpg" alt="Post Thumbnail"/></a></div>
                      <div class="widget-posts-body">
                        <div class="widget-posts-title"><a href="#">Realistic Business Card Mockup</a></div>
                        <div class="widget-posts-meta">15 February</div>
                      </div>
                    </li>
                  </ul>
                </div>
              </div>
            </div>
          </div>
        </div>
        <hr class="divider-d">
        <footer class="footer bg-dark">
          <div class="container">
            <div class="row">
              <div class="col-sm-6">
                <p class="copyright font-alt">&copy; 2017&nbsp;<a href="index.html">TitaN</a>, All Rights Reserved</p>
              </div>
              <div class="col-sm-6">
                <div class="footer-social-links"><a href="#"><i class="fa fa-facebook"></i></a><a href="#"><i class="fa fa-twitter"></i></a><a href="#"><i class="fa fa-dribbble"></i></a><a href="#"><i class="fa fa-skype"></i></a>
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
      <div class="scroll-up"><a href="#totop"><i class="fa  fa-chevron-up"></i></a></div>
    </main>
    <!--  
    JavaScripts
    =============================================
    -->
       <script type="text/javascript">
    	
       var zHeart = document.getElementById("zheart");
       var bkno = "${bookdetail.bkno}"; // 현재 페이지의 bkno 값
       var bkno2 = ${bookdetail.bkno}; 
       

       // 페이지 로딩 시 찜 상태에 따라 하트 이미지 초기 설정
       document.addEventListener("DOMContentLoaded", function () {
           var zzimBookNumbers = ${zzimBooklist}; // 모델에서 전달한 찜한 책의 bkno 배열

           if (zzimBookNumbers.includes(bkno2)) {
               zHeart.src = "../img/icon/heartOn.png";
           } else {
               zHeart.src = "../img/icon/heartOff.png";
           }
       });


       // 하트 이미지 클릭 이벤트
       zHeart.addEventListener("click", function () {
         if(${sessionScope.mid == null}){
            alert("로그인 해주세요")
           }else{
           if (zHeart.src.includes("heartOff.png")) {
               // 클릭 시 찜하기 (INSERT) AJAX 요청 실행
               sendAjaxRequest(bkno, "INSERT");
               zHeart.src = "../img/icon/heartOn.png"; // 이미지 변경
           } else {
               // 클릭 시 찜 취소 (DELETE) AJAX 요청 실행
               sendAjaxRequest(bkno, "DELETE");
               zHeart.src = "../img/icon/heartOff.png"; // 이미지 변경
           }
           }
       });
    	

    	function sendAjaxRequest(bkno, action) {
    	    const xhr = new XMLHttpRequest();
    	    const url = `/bookdetail`; 
    	    
    	    xhr.open("POST", url, true);
    	    xhr.setRequestHeader("Content-Type", "application/json");
    	    
    	    const data = JSON.stringify({ bkno, action });

    	    xhr.onreadystatechange = function () {
    	        if (xhr.readyState === 4 && xhr.status === 200) {
    	            const response = JSON.parse(xhr.responseText);
    	            if (response.success) {
    	                console.log(`찜하기 ${action} 성공`);
    	            } else {
    	                console.error(`찜하기 ${action} 실패`);
    	            }
    	        }
    	    };
    	    xhr.send(data);
    	}
    </script>
    
    
    
    <script src="assets/lib/jquery/dist/jquery.js"></script>
    <script src="assets/lib/bootstrap/dist/js/bootstrap.min.js"></script>
    <script src="assets/lib/wow/dist/wow.js"></script>
    <script src="assets/lib/jquery.mb.ytplayer/dist/jquery.mb.YTPlayer.js"></script>
    <script src="assets/lib/isotope/dist/isotope.pkgd.js"></script>
    <script src="assets/lib/imagesloaded/imagesloaded.pkgd.js"></script>
    <script src="assets/lib/flexslider/jquery.flexslider.js"></script>
    <script src="assets/lib/owl.carousel/dist/owl.carousel.min.js"></script>
    <script src="assets/lib/smoothscroll.js"></script>
    <script src="assets/lib/magnific-popup/dist/jquery.magnific-popup.js"></script>
    <script src="assets/lib/simple-text-rotator/jquery.simple-text-rotator.min.js"></script>
    <script src="assets/js/plugins.js"></script>
    <script src="assets/js/main.js"></script>
  </body>
</html>