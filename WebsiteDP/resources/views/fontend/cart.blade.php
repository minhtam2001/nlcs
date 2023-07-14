@extends('master.master')
@section('style')
<link rel="stylesheet" href="css/cart.css">
@endsection
@section('content')
	<div id="wrap-inner">
		<div id="list-cart">
			<h3>Giỏ hàng</h3>
			<form>
				<table class="table table-bordered .table-responsive text-center">
					<tr class="active">
						<td width="11.111%">Ảnh mô tả</td>
						<td width="22.222%">Tên sản phẩm</td>
						<td width="22.222%">Số lượng</td>
						<td width="16.6665%">Đơn giá</td>
						<td width="16.6665%">Thành tiền</td>
						<td width="11.112%">Xóa</td>
					</tr>
					@foreach ( $carts as $cart)
						<tr>
						<td><img class="img-responsive" src="img/product/{{ $cart->options->imges  }}" width="150px"></td>
						<td>{{$cart->name  }}</td>
						<td>
							<div class="form-group">
								<input class="form-control" type="number" value="{{$cart->qty}}" onchange="updateCart(this.value,'{{$cart->rowId  }}')">
							</div>
						</td>
						<td><span class="price">{{number_format($cart->price)  }}.đ</span></td>
						<td><span class="price">{{number_format($cart->price*$cart->qty)  }}.đ</span></td>
						<td><a href="{{route('cart.delete',['rowId'=>$cart->rowId])  }}">Xóa</a></td>
					</tr>
					@endforeach
					
				</table>
				<div class="row" id="total-price">
					<div class="col-md-6 col-sm-12 col-xs-12">										
							Tổng thanh toán: <span class="total-price">{{$total }} đ</span>																		
					</div>
					<div class="col-md-6 col-sm-12 col-xs-12">
						<a href="{{route('home')  }}" class="my-btn btn">Mua tiếp</a>
						<a href="{{route('cart.destroy')  }}" class="my-btn btn">Xóa giỏ hàng</a>
					</div>
				</div>
			</form>             	                	
		</div>
		@if (isset($carts) && $carts->count()>0)
			<div id="xac-nhan">
			<h3>Xác nhận mua hàng</h3>
			<form action="{{route('checkout') }}" method="POST">
				@csrf
				<div class="form-group" id="wrap-inner">
					<div id="khach-hang">
						<p>
							<label for="phone">Số điện thoại:</label>
							<input required type="text" class="form-control" id="phone" name="phone" value=" 0876545678">
						</p>
					</div>
				
				</div>

				<div class="form-group">
					<label for="add">Địa chỉ:</label>
					<input required type="text" class="form-control" id="add" name="add" value="Trà Vinh">
				</div>
				<div class="form-group text-right">
					<button type="submit" class="btn btn-default">Thực hiện đơn hàng</button>
				</div>
				
			</form>
		</div>
		@endif
		
	</div>
@endsection
@section('script')
<script>
	function updateCart (qty,id){
		$.ajax({
			type:'get',
			url: '{{ route('cart.update') }}',
			data: {qty:qty,rowId:id},
			success: function(){
				location.reload();
			}
		})
	}
</script>
@endsection
