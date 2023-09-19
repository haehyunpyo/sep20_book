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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script type="text/javascript">
    
    /*--------------------------승현-----------------------------------*/
  //날짜 제한
        $(function () {
      	  
      	 	let todayO = new Date();
  		 	let todayA = dateCal(todayO);
    	  		console.log("todayA : " + todayA)
      	  
  		 	if(${rentaldata.rdel} == 0){
  		 		
  			    // 대여일 입력 필드에 현재 날짜 이후로만 입력하도록 설정
  			   document.getElementById('rsdate').setAttribute('min', todayA);
  			    
  			 // 대여일 입력 이벤트 처리
               $("#rsdate").change(function () {
              	 
                   let rsdate = $(this).val(); // 대여일
                   let rddateInput = $("#rddate");
                   
                   if (rsdate) {
                       let maxRddate = new Date(rsdate);
                       maxRddate.setDate(maxRddate.getDate() +7); // 대여일로부터 7일 이후
        
                       // 반납일 입력 필드에 대여일로부터 7일 이후까지만 입력하도록 설정
                       let maxRddateStr = dateCal(maxRddate);
                       rddateInput.attr('max', maxRddateStr);
                   } else {
                       // 대여일을 선택하지 않았을 경우 반납일 제한 없음
                       rddateInput.removeAttr('max');
                   }
                  document.getElementById('rddate').setAttribute('min', rsdate);
               });

  			    
  			 // if끝
  	 		} else {
  	 			
  	 			// 기존대여일
                  let rsdateStr = '${rentaldata.rsdate}';
                  let rsdateO = new Date(rsdateStr);
                  rsdateA = dateCal(rsdateO); //2023-09-26
                  console.log("rsdateA : " + rsdateA);
  	 			
                  // 기존반납일
                  let rddateStr = '${rentaldata.rddate}'; // 예: "2023-09-18"
                  let rddateO = new Date(rddateStr);
                  rddateA = dateCal(rddateO);
                  console.log("rddateA : " + rddateA);


                  // 오늘날짜
                  console.log("todayO : " + todayO);
                  console.log("todayA : " + todayA);
  				
                  // 오늘날짜 + 7
                  let today7A = datePlus(todayO, 7);
                  let today7O = new Date(today7A);
                  console.log("today7A : " + today7A); 
                  console.log("today7O : " + today7O); 
                  
                  // else _ if시작  ***********************************
                   if(today7O < rsdateO){
                  	 
                  	// 대여일 입력 필드에 현재 날짜 이후로만 입력하도록 설정
                       document.getElementById('rsdate').setAttribute('min', todayA);
                  	 
                  	 //let disToDateA = dateMinus(rddateO, 8);
                       let gap = (rsdateO - today7O) / (24 * 60 * 60 * 1000); 
                       console.log("gap : " + gap);
                       
                       let startDate = datePlus(todayO, gap);
                       console.log("startDate : " + startDate)
                       startDateO = new Date(startDate);

                      let disableArr = addDisable(startDateO, gap); // 매개변수는 Date()객체
                      console.log("disableArr : " + disableArr);
                      
                      let minDate = datePlus(todayO, gap-1);
                      console.log("minDate : " + minDate);
                      
                      let disableArr2 = addDisable(rsdateO, 7);
                      console.log("disableArr2 : " + disableArr2);

                      
                         // 대여일 입력 이벤트 처리
                         $("#rsdate").change(function () {
                             let rsdate = $(this).val(); // 대여일
                             let rddateInput = $("#rddate");
                             console.log("rsdate : " + rsdate);
                             
                             if (disableArr.includes(rsdate)) {
                                 alert('대여불가');
                                 this.value = ''; // 날짜를 비워줍니다.
                             } else if(disableArr2.includes(rsdate)){
                            	 alert("대여불가");
                            	 this.value = ''; // 날짜를 비워줍니다.
                             }
                             
                             
                             if (rsdate) {
                                 let maxRddate = new Date(rsdate);
                                 maxRddate.setDate(maxRddate.getDate() +7); // 대여일로부터 7일 이후
                  
                                 // 반납일 입력 필드에 대여일로부터 7일 이후까지만 입력하도록 설정
                                 let maxRddateStr = dateCal(maxRddate);
                                 rddateInput.attr('max', maxRddateStr);
                                 
                             } else {
                                 // 대여일을 선택하지 않았을 경우 반납일 제한 없음
                                 rddateInput.removeAttr('max');
                             }
                            document.getElementById('rddate').setAttribute('min', rsdate);
                         });
                         
                   // else _ else if시작     
                  }  else if(rsdateO < today7O) {
                  	
                      // 대여일 입력 필드에 현재 날짜 이후로만 입력하도록 설정
                      document.getElementById('rsdate').setAttribute('min', rddateA);

  			    
                  // 대여일 입력 이벤트 처리
                  $("#rsdate").change(function () {
                      let rsdate = $(this).val(); // 대여일
                      let rddateInput = $("#rddate");
                      
                      if (rsdate) {
                          let maxRddate = new Date(rsdate);
                          maxRddate.setDate(maxRddate.getDate() +7); // 대여일로부터 7일 이후

                          // 반납일 입력 필드에 대여일로부터 7일 이후까지만 입력하도록 설정
                          let maxRddateStr = formatDate(maxRddate);
                          rddateInput.attr('max', maxRddateStr);
                      } else {
                          // 대여일을 선택하지 않았을 경우 반납일 제한 없음
                          rddateInput.removeAttr('max');
                      }
                     document.getElementById('rddate').setAttribute('min', rsdate);
                  });


  			   
                  }// else _ else끝
                  
  	 		} // esle끝

  		 	
    	});
  		// ===========추가함수시작====================

  		 // 날짜형식으로 변환해주는 함수		
  			function dateCal(date){	// 매개변수는 Date객체
  	 			
  			    let mm = String(date.getMonth() + 1).padStart(2, '0'); // 1월은 0으로 시작하므로 +1
  			    let dd = String(date.getDate()).padStart(2, '0');
  			    let yyyy = date.getFullYear();
  			    let Fdate = yyyy + '-' + mm + '-' + dd;
  			    
  				//console.log("Fdate최종형태 : " + Fdate);

  			    return Fdate;	// 
  			}
  			
  			// 날짜계산함수(plus)
  			function datePlus(date, plus){   // 매개변수는 (Date객체, 일자)

  				let mm = date.getMonth() + 1; // 현재 월
  				let dd = date.getDate() + plus;  // 현재 일에 7일을 더함
  				let yyyy = date.getFullYear(); // 현재 연도
  			    
  			    if (mm > 12) {
  				    yyyy += 1;
  				    mm = 1;
  				}

  				// 일(Day)이 월에 따라 30 또는 31일을 넘어가는 경우 월(Month)을 변경하고 일(Day)을 1로 설정
  				if ((mm === 4 || mm === 6 || mm === 9 || mm === 11) && dd > 30) {
  				    mm += 1;
  				    dd = 1;
  				} else if (mm === 2) {
  				    // 2월은 윤년 여부에 따라 28일 또는 29일까지 있으므로 윤년 여부를 고려하여 처리
  				    if ((yyyy % 4 === 0 && yyyy % 100 !== 0) || (yyyy % 400 === 0)) {
  				        if (dd > 29) {
  				            mm += 1;
  				            dd = 1;
  				        }
  				    } else {
  				        if (dd > 28) {
  				            mm += 1;
  				            dd = 1;
  				        }
  				    }
  				} else if (dd > 31) {
  				    mm += 1;
  				    dd = 1;
  				}
  				
  				// 날짜를 문자열로 변환
  				let plusDate = yyyy + '-' + String(mm).padStart(2, '0') + '-' + String(dd).padStart(2, '0');
  				//console.log("plusDate최종형태 : " + plusDate)

  			    return plusDate;
  			}
  			
  			
  			// 날짜계산함수(minus)
  			function dateMinus(date, minus) {
  			    let yyyy = date.getFullYear();
  			    let mm = date.getMonth() + 1;
  			    let dd = date.getDate() - minus;
  			
  			    while (dd < 1) {
  			        mm -= 1;
  			
  			        if (mm < 1) {
  			            yyyy -= 1;
  			            mm = 12;
  			        }
  			
  			        if (mm === 4 || mm === 6 || mm === 9 || mm === 11) {
  			            dd += 30;
  			        } else if (mm === 2) {
  			            if ((yyyy % 4 === 0 && yyyy % 100 !== 0) || (yyyy % 400 === 0)) {
  			                dd += 29;
  			            } else {
  			                dd += 28;
  			            }
  			        } else {
  			            dd += 31;
  			        }
  			    }
  			
  			    let minusDate = yyyy + '-' + String(mm).padStart(2, '0') + '-' + String(dd).padStart(2, '0');
  			    return minusDate;
  			}
  			
  			
              // disabled 할 날짜 계산 함수
              function addDisable(startDate, gap){	 // today+gap ~ rddate-8까지 (rsdate가)disabled
           	    let disableArr = [];
               	for (let i=0; i < 7; i++){
              		let disableDate = new Date();	// Obj
              		disableDate.setDate(startDate.getDate() + i);
                	//console.log(dateCal(disableDate));	// String
              		disableArr.push(dateCal(disableDate));
              		//console.log(typeof disableArr);
              	}
              		//console.log("disableArr : " + disableArr);  
              		return disableArr;
              }  
  			
  			
  			// ===========추가함수끝====================
  	 		
  	
      
      
      
  	 //책 대여
        $(function(){
           $("#rental").click(function(){
              let rddate = $("#rddate").val();
              let rsdate = $("#rsdate").val();
              let bkno = ${bookdetail.bkno };
          	let rdel = ${rentaldata.rdel };
        
          	//alert(rsddate, rddate);

            if (rsdate === "" && rddate === "") {
              alert("날짜를 입력하세요.");
          } else if (rsdate === "") {
              alert("대여일을 입력하세요.");
          } else if (rddate === "") {
              alert("반납일을 입력하세요.");
          } else {
              $.ajax({
                 url : "./rental",
                 type : "POST",
                 data : {"rsdate" : rsdate, "rddate" : rddate,   "bkno" : bkno},
                 dataType : "json",
                 success : function(data) {
                    //alert(data.result);
                    if(data.result == 1){
                 			 alert("대여가 완료 되었습니다"); 
                  		  
                    } else {
                       alert("로그인 후 이용 가능합니다.");
                    }
                 },
                 error : function(request, status, error) {
                    alert("대여실패 : " + error);
                 }
              });
          }

           });
        });
       //반납하기
       $(function(){
      	 $("#returnBook").click(function(){
      		 let rddate = ${rentaldata.rddate };
      		 let rsddate = ${rentaldata.rsdate };
             let bkno = ${bookdetail.bkno };
           	 let rdel = ${rentaldata.rdel };
           	 let mid = "${sessionScope.mid}";
           	 
           	 alert(mid);
           	 $.ajax({
                   url : "./returnBook",
                   type : "POST",
                   data : {"bkno" : bkno, "rdel" : rdel, "mid" : mid },
                   dataType : "json",
                   success: function(data) {
                  	 if(data.returnBook == 1){
                  		  alert("반납성공");
                  	 } else {
                  		 alert("반납실패");
                  	 }
                  	   
                  	},
                   error : function(request, status, error) {
                  	 alert("에러입니다" + error);
                  	  console.log("에러 발생: " + request);
                   }
                });
      	 }); 
      });
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
											<input type="hidden" name="bkimg"
												value="${bookdetail.bkimg }"> <input type="hidden"
												name="price" value="${bookdetail.bkprice }"> <input
												type="hidden" name="bkno" value="${bookdetail.bkno }">
											<textarea name="bkscontent" style="display: none">${bookdetail.bkscontent }</textarea>

											<c:if test="${sessionScope.mid ne null }">
												<div class="col-sm-4 mb-sm-20">
													<input class="form-control input-lg" type="number"
														name="amount" max="${detail.bstock }" min="1"
														required="required" />
												</div>
												<div class="col-sm-8">
													<button class="btn btn-lg btn-block btn-round btn-b"
														type="submit">장바구니 담기</button>
												</div>
											</c:if>
											<c:if test="${sessionScope.mid eq null }">
												<div class="col-sm-8">
													<a class="btn btn-lg btn-block btn-round btn-b">회원만
														이용가능합니다.</a>
												</div>
											</c:if>
										</form>
									</div>

									<!-- --------------------------대여&반납----------------------------------- -->

									<div class="tab-pane" id="trade">
										<c:if test="${rentaldata.rdel eq 0 }">
											<div class="col-sm-6 mb-sm-20">
												대여일<input class="form-control input-lg" type="date"
													id="rsdate" name="rsdate" required="required" />
											</div>
											<div class="col-sm-6 mb-sm-20">
												반납일<input class="form-control input-lg" type="date"
													id="rddate" name="rddate" required="required" />
											</div>
											<div class="col-sm-12">
												<br> <a class="btn btn-lg btn-block btn-round btn-b"
													href="#" id="rental">대여하기</a>
											</div>
										</c:if>

										<c:if test="${rentaldata.rdel eq 1 }">

											<div>${rentaldata.rsdate } ~ ${rentaldata.rddate } 대여중 </div>

											<div class="col-sm-6 mb-sm-20">
												대여일<input class="form-control input-lg" type="date"
													id="rsdate" name="rsdate" required="required" />
											</div>
											<div class="col-sm-6 mb-sm-20">
												반납일<input class="form-control input-lg" type="date"
													id="rddate" name="rddate" required="required" />
											</div>
											<div class="col-sm-12">
												<br> <a class="btn btn-lg btn-block btn-round btn-b"
													href="#" id="rental">대여하기</a>
											</div>
											<c:if test="${rentaldata.rdel == 1 && sessionScope.mid == rentaldata.mid}">
												<div class="col-sm-12">
													<br> <a class="btn btn-lg btn-block btn-round btn-b"
														href="#" id="returnBook">반납하기</a>
												</div>
											</c:if>

										</c:if>
									</div>

								</div>
							</div>
							<!-- ------------------------------------------------------------------- -->

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