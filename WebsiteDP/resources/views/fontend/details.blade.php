@extends('master.master')
@section('style')
<link rel="stylesheet" href="css/details.css">
@endsection
@section('content')
<div id="wrap-inner">
	<div id="product-info">
		<div class="clearfix"></div>
		<nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  				<ol class="breadcrumb">
   					<li class="breadcrumb-item"><a href="{{route('home')}}">Trang Chủ</a></li>
   					<li class="breadcrumb-item active" aria-current="page">Chi Tiết Sản Phẩm</li>
  				</ol>
		</nav>
		<h3>{{$products->product_name  }}</h3>
		<div class="row">
			<div id="product-img" class="col-xs-12 col-sm-12 col-md-3 text-center">
				<img src="img/product/{{ $products->product_image  }}" width="400px">
			</div>
			<div id="product-details" class="col-xs-12 col-sm-12 col-md-9">
				<p><b>Giá: <span class="price">{{number_format($products->product_price)  }}</span></b></p>
				@foreach ( $details as $detail )
				<p><b>{{$detail->category_name.': '.$detail->product_desc }}</b></p>
				@endforeach
				<p class="add-cart text-center"><a href="{{route('cart.add',['id'=>$products->product_id])  }}">Đặt hàng online</a></p>
			</div>
		</div>							
	</div>
		<div id="product-detail">
			<h3>Chi tiết sản phẩm</h3>
			<p class="text-justify">{{$products->product_desc  }}</p>
		</div>
		<div id="comment">
			<h3>Bình luận</h3>
			<div class="col-md-9 comment">
				<form>
					<div class="form-group">
						<label for="email">Email:</label>
						<input required type="email" class="form-control" id="email" name="email">
					</div>
					<div class="form-group">
						<label for="name">Tên:</label>
						<input required type="text" class="form-control" id="name" name="name">
					</div>
					<div class="form-group">
						<label for="cm">Bình luận:</label>
						<textarea required rows="10" id="cm" class="form-control" name="content"></textarea>
					</div>
					<div class="form-group text-right">
						<button type="submit" class="btn btn-default">Gửi</button>
					</div>
				</form>
			</div>
		</div>
		<div id="comment-list">
			<ul>
				<li class="com-title">
					Nguyễn Trung Hậu
					<br>
					<span>2022-30-30 10:00:00</span>	
				</li>
				<li class="com-details">
					Sản phẩm rất tốt và rất có ít cho sức khỏe, tui đã sử dụng được hơn 1 tháng nay.
								</li>
							</ul>
							<ul>
								<li class="com-title">
									Lâm Thanh Khang
									<br>
									<span>2022-19-01 10:20:00</span>	
								</li>
								<li class="com-details">
									Tôi rất hài lòng với sản phẩm, hàng giao nhanh đóng gói cẩn thận.
								</li>
							</ul>
							<ul>
								<li class="com-title">
									Nguyễn Khánh Linh
									<br>
									<span>2022-19-01 17:00:00</span>	
								</li>
								<li class="com-details">
									Sản phẩm rất tốt giao hàng đúng hạn.
								</li>
							</ul>
						</div>
					</div>					
					<!-- end main -->
				</div>
			</div>
		</div>
	</section>
	<!-- endmain -->


@endsection
				