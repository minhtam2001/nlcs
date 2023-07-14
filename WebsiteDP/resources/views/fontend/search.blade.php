@extends('master.master')
@section('style')
<link rel="stylesheet" href="css/search.css">
@endsection
@section('content')
					<div id="wrap-inner">
						<div class="products">
                            <nav style="--bs-breadcrumb-divider: url(&#34;data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='8' height='8'%3E%3Cpath d='M2.5 0L1 1.5 3.5 4 1 6.5 2.5 8l4-4-4-4z' fill='currentColor'/%3E%3C/svg%3E&#34;);" aria-label="breadcrumb">
  								<ol class="breadcrumb">
   									<li class="breadcrumb-item"><a href="{{route('home')}}">Trang Chủ</a></li>
   									<li class="breadcrumb-item active" aria-current="page">Tìm Kiếm Sản Phẩm</li>
  								</ol>
							</nav>
							<h3>Tìm kiếm với từ khóa: <span>{{$search  }}</span></h3>
							<div class="product-list row">
                                 @foreach ($products as $product )
                                    <div class="product-item col-md-3 col-sm-6 col-xs-12">
									<a href="#"><img src="img/product/{{$product->product_image  }}" class="img-thumbnail"></a>
									<p><a href="#">{{$product->product_name  }}</a></p>
									<p class="price">{{number_format($product->product_price)}}</p>	  
									<div class="marsk">
										<a href="{{route('detail',['id'=>$product->product_id])}}">Xem chi tiết</a>
									</div>                                    
								</div>
                                    @endforeach
								
							</div>                	                	
						</div>
					</div>
@endsection