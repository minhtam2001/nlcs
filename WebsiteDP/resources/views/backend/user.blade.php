@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Thành Viên</h1>
			</div>
		</div><!--/.row-->	
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Danh sách Thành Viên</div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<div class="table-responsive">
								<a href="{{route('create')  }}" class="btn btn-primary">Thêm Thành Viên</a>
								<table class="table table-bordered" style="margin-top:20px;">				
									<thead>
										<tr class="bg-primary">
											<th width=30%>Tên Thành Viên</th>
											<th width="10%">Email</th>
											<th>Mật Khẩu</th>
											<th width="10%">Số Điện Thoại</th>
											<th>Tùy Chọn</th>
										</tr>
									</thead>
									<tbody>
											@foreach ( $users as $user )
										<tr>
										
											<td>{{$user ->name  }}</td>
											<td>{{$user ->email  }}</td>
											<td>{{$user ->password  }}</td>
											<td>{{$user ->phone  }}</td>
											<td>{{$user ->role  }}</td>
										</tr>
											@endforeach
										
										
									</tbody>
								</table>
								<div id="pagination" class="pagination m-2"></div>							
							</div>
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
@endsection
@section('script')
 <script>
        $(document).ready(function(){
        $('#user').addClass('active');
    })
   </script>
@endsection
	