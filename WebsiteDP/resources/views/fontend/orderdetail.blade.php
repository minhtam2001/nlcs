@extends('master.master')
@section('style')
<link rel="stylesheet" href="css/complete.css">
@endsection
@section('content')
<div id="hoa-don">
							<h3>Hóa đơn mua hàng</h3>							
							<table class="table-bordered table-responsive table">
								<tr class="bold">
									<td width="30%">Tên sản phẩm</td>
									<td width="25%">Hình Ảnh</td>
									<td width="20%">Số lượng</td>
									<td width="15%">Giá</td>
								</tr>
                                @foreach ( $details as $detail )
                                    <tr>
									<td>{{ $detail->product_name }}</td>
                                    <td><img src="img\product\{{ $detail->product_image  }}" class="img-thumbnail" width="100px"></td>
                                    <td>{{$detail->product_qty  }}</td>
									<td class="price">{{number_format($detail->product_price)  }}</td>
									

								</tr>
                                @endforeach
								<tr>
									<td colspan="3">Tổng tiền:</td>
									<td class="price">{{number_format($total)  }} VND</td>
								</tr>
							</table>
							<p class="text-right return"><a href="{{route('profile')  }}">Quay lại</a></p>
						</div>
@endsection
@section('script')
@endsection