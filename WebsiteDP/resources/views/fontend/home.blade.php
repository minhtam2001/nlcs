@extends('master.master')
@section('content')
<div id="wrap-inner">
						<div class="products">
							<h3>sản phẩm nổi bật</h3>
							<div class="product-list row">
							@foreach ($products as $product  )
								<div class="product-item col-md-3 col-sm-6 col-xs-12">
									<a href="#"><img src="img\product\{{ $product->product_image  }}" class="img-thumbnail"></a>
									<p><a href="#">{{ $product->product_name  }}</a></p>
									<p class="price">{{number_format($product->product_price)  }}</p>	  
									<div class="marsk">
										<a href="{{route('detail',['id'=>$product->product_id])  }}">Xem chi tiết</a>
									</div>                                    
								</div>
							@endforeach
							<div id="pagination" class="pagination m-2">{{$products->links()}}</div>   
							</div>  
						</div>
					</div>
@endsection