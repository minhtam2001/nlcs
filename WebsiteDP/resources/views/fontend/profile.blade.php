@extends('master.master')
@section('style')
<link rel="stylesheet" href="css/complete.css">
@endsection
@section('content')
					<div id="wrap-inner">
						<div id="khach-hang">
							<h3>Thông tin khách hàng</h3>
							<p>
								<span class="info">Khách hàng: </span>
								{{$user->name }}
							</p>
							<p>
								<span class="info">Email: </span>
								{{$user->email  }}
							</p>
							<p>
								<span class="info">Điện thoại: </span>
								{{$user->phone}}
							</p>
						</div>						
						<div id="hoa-don">
							<h3>Hóa đơn mua hàng</h3>							
							<table class="table-bordered table-responsive table">
								<tr class="bold">
									<td width="10%">Mã Đơn Hàng</td>
									<td width="25%">Địa Chỉ</td>
									<td width="20%">Ngày Đặt Hàng</td>
									<td width="20%">Thành tiền</td>
									<td width='15%'>Xem Chi Tiết</td>
								</tr>
								@foreach ($orders as $order)
								<tr>
									<td>{{$order->order_id  }}</td>
									<td>{{$order->address  }}</td>
									<td>{{$order->created_at  }}</td>
									<td class="price">{{number_format($order->order_total ) }}</td>
									<td><a href="{{route('orderdetail',['id'=>$order->order_id])  }}"  class="btn btn-sm btn-primary" >Chi Tiết</a></td>
								</tr>
								@endforeach
							</table>
						</div>
						<div id="xac-nhan">
							<br>
							<p align="justify">
								<b>Quý khách đã đặt hàng thành công!</b><br />
								• Sản phẩm của Quý khách sẽ được chuyển đến Địa chỉ có trong phần Thông tin Khách hàng của chúng Tôi sau thời gian 2 đến 3 ngày, tính từ thời điểm này.<br />
								• Nhân viên giao hàng sẽ liên hệ với Quý khách qua Số Điện thoại trước khi giao hàng 24 tiếng.<br />
								<b><br />Cám ơn Quý khách đã sử dụng Sản phẩm của Công ty chúng Tôi!</b>
							</p>
							
						</div>
						<p class="text-right return"><a href="{{route('home')  }}">Quay lại trang chủ</a></p>
					</div>	
@endsection
@section('script')
@endsection				
			