@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Đơn Hàng</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Danh sách Đơn Hàng</div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<div class="table-responsive">
								<table class="table table-bordered" style="margin-top:20px;">				
									<thead>
										<tr class="bg-primary">
											<th width="5%">Mã Đơn Hàng</th>
											<th width="5%">Mã Khách Hàng</th>
											<th width="30%">Địa Chỉ</th>
											<th width="20%">Số Điện Thoại</th>
											<th width="20%">Ngày Đặt Hàng</th>
											<th width="20">Tổng Tiền</th>
											<th>Trạng Thái</th>
										</tr>
									</thead>
									<tbody>
										@foreach ($orders as $order )
											<tr>
											<td>{{$order->order_id  }}</td>
											<td>{{$order->users_id  }}</td>
											<td>{{$order->address  }}</td>
											<td>{{$order->phone  }}</td>
											<td>{{$order->created_at  }}</td>
											<td>{{number_format($order->order_total)  }}</td>
											<td >
												@if ($order->order_status==1)
													<button class="btn btn-success">Đã Duyệt</button>
												@else
													<a href="{{route('status',['id'=>$order->order_id])    }}" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i>Duyệt Đơn</a>
												@endif
												
										@endforeach
									</tbody>
								</table>							
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
@endsection
@section('script')
   <script>
        $(document).ready(function(){
        $('#order').addClass('active');
    })
   </script>
@endsection
	