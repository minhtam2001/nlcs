<!DOCTYPE html>
<html>
<head>
	<base href="{{asset('frontend')  }}/">
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">	
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
	<title></title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="css/home.css">
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
     @yield('style')

	<script type="text/javascript">
		$(function() {
			var pull        = $('#pull');
			menu        = $('nav ul');
			menuHeight  = menu.height();

			$(pull).on('click', function(e) {
				e.preventDefault();
				menu.slideToggle();
			});
		});

		$(window).resize(function(){
			var w = $(window).width();
			if(w > 320 && menu.is(':hidden')) {
				menu.removeAttr('style');
			}
		});
	</script>
</head>
<body>    
	<!-- header -->
	<header id="header">
		<div class="container">
			<div class="row">
				<div id="logo" class="col-md-3 col-sm-12 col-xs-12">
					<h1>
						<a href="javascript:void(0)"><img src="img/product/logo1.jpg" width="260px"></a>						
						<nav><a id="pull" class="btn btn-danger" href="#">
							<i class="fa fa-bars"></i>
						</a></nav>			
					</h1>
				</div>
				<div id="search" class="col-md-6 col-sm-12 col-xs-12">
					<form action="{{route('search')  }}" method="get">
					<input type="text" name="key" value="" placeholder="Nhập từ khóa ...">
					<input type="submit" name="submit" value="Tìm Kiếm">
					</form>
				</div>
				<div id="user-info" class="col-md-3">
					@if (Auth::check())
						<div id="user" class="dropdown btn btn-sm btn-info">
							<div class="dropdown-toggle" role="button" id="dropdownUser" data-bs-toggle="dropdown" aria-expanded="false">
								{{Auth::user()->name }}
							</div>

							<ul class="dropdown-menu" aria-labelledby="dropdownUser">
								<li><a class="dropdown-item" href="{{route('profile')  }}">Thông Tin</a></li>
								<li><a class="dropdown-item" href="{{route('logout') }}">Đăng Xuất</a></li>
							</ul>
						</div>
							@else

							<a id="login" class="btn btn-sm " href="{{route('login')}}">
							<i class="fa-solid fa-user"></i>ĐĂNG NHẬP
							</a>
					@endif
						<div id="cart" onclick="location.href='{{route('cart')  }}'" >
							<i class="fas fa-shopping-cart"></i>				    
						</div>
				
				</div>
				
			</div>			
		</div>
	</header><!-- /header -->
	<!-- endheader -->

	<!-- main -->
	<section id="body">
		<div class="container">
			<div class="row">
				<div id="sidebar" class="col-md-3">
				<nav id="menu">
					<ul>
						<li class="menu-item">danh mục sản phẩm</li>
						@foreach ($categories as $category )
							<li class="menu-item"><a href="{{route('category',['id'=>$category->category_id]) }}">{{ $category->category_name  }}</a></li>
						@endforeach						
					</ul>
					<!-- <a href="#" id="pull">Danh mục</a> -->
				</nav>

					<div id="banner-l" class="text-center">
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner1.jpg" alt="" class="img-thumbnail"></a>
						</div>
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner2.jpg" alt="" class="img-thumbnail"></a>
						</div>
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner10.jpg" alt="" class="img-thumbnail"></a>
						</div>
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner9.jpg" alt="" class="img-thumbnail"></a>
						</div>
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner7.jpg" alt="" class="img-thumbnail"></a>
						</div>
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner6.jpg" alt="" class="img-thumbnail"></a>
						</div>
						<div class="banner-l-item">
							<a href="javascript:void(0)"><img src="img/product/banner8.jpg" alt="" class="img-thumbnail"></a>
						</div>
					</div>
				</div>

				<div id="main" class="col-md-9">
					<!-- main -->
					<!-- phan slide la cac hieu ung chuyen dong su dung jquey -->
					<div id="slider">
						<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
							<img src="img/product/banner1.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
							<img src="img/product/banner2.jpg" class="d-block w-100" alt="...">
							</div>
							<div class="carousel-item">
							<img src="img/product/banner3.jpg" class="d-block w-100" alt="...">
							</div>
						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
						</div>
					</div>

					<div id="banner-t" class="text-center">
						<div class="row">
							<div class="banner-t-item col-md-6 col-sm-12 col-xs-12">
								<a href="javascript:void(0)"><img src="img/product/banner4.jpg" alt="" class="img-thumbnail"></a>
							</div>
							<div class="banner-t-item col-md-6 col-sm-12 col-xs-12">
								<a href="javascript:void(0)"><img src="img/product/banner5.jpg" alt="" class="img-thumbnail"></a>
							</div>
						</div>					
					</div>
					@yield('content')
				</div>
			
			</div>
		</div>
	</section>
                   

	<!-- footer -->
	<footer id="footer">			
		<div id="footer-t">
			<div class="container-fluid">
				<div class="row">				
					<div id="logo-f" class="col-md-3 col-sm-12 col-xs-12 text-center">						
						<a href="javascript:void(0)"><img src="img/product/logo1.jpg" width="260px"></a>		
					</div>
					<div id="about" class="col-md-3 col-sm-12 col-xs-12">
						<h3>About us</h3>
						<p class="text-justify">Tại Pharmaci Siri65, mỗi dược sỹ luôn tận tâm phục vụ và được đào tạo để hoàn thành xuất sắc những sứ mệnh được giao.</p>
					</div>
					<div id="hotline" class="col-md-3 col-sm-12 col-xs-12">
						<h3>Hotline</h3>
						<p>Phone Sale: (+84) 0392 096 959</p>
						<p>Email: sub1910136@student.ctu.edu.vn</p>
					</div>
					<div id="contact" class="col-md-3 col-sm-12 col-xs-12">
						<h3>Contact Us</h3>
						<p>Address 1: số 168 - Phường Xuân Khánh - Quận Ninh Kiều - Cần Thơ</p>
						<p>Address 2: Số 84 - Phương Hưng Lợi - Quận Ninh Kiều - Cần Thơ</p>
					</div>
				</div>				
			</div>
			<div id="footer-b">				
				<div class="container">
					<div class="row">
						<div id="footer-b-l" class="col-md-6 col-sm-12 col-xs-12 text-center">
							<p>GPDKKD: 0311770883 do sở KH & ĐT TP.HCM cấp lần đầu ngày 05/05/2012</p>
						</div>
						<div id="footer-b-r" class="col-md-6 col-sm-12 col-xs-12 text-center">
							<p>Công Ty Cổ Phần Dược Phẩm Pharmacity</p>
						</div>
					</div>
				</div>
				<div id="scroll">
					<a href="javascript:void(0)"><img src=""></a>
				</div>	
			</div>
		</div>
	</footer>
	<!-- endfooter -->
	@yield('script')

</body>
</html>