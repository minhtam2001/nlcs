@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
<div class="col-sm-9 col-sm-off set-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Thông Số</h1>
			</div>
		</div><!--/.row-->	
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Thông Số Sản Phẩm </div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<div class="table-responsive">
								<a href="{{route('detail.add',['id'=>$details[0]->product_id])  }}" class="btn btn-primary">Thêm Thông Số</a>
								<table class="table table-bordered" style="margin-top:20px;">				
									<thead>
										<tr class="bg-primary">
											<th>STT</th>
											<th width="35%">Tên Thông Số</th>
											<th width="30%">Thông Số</th>
											<th>Tùy chọn</th>
										</tr>
									</thead>
									<tbody>
											@foreach ($details as $key => $detail)
                                        <tr>
											<td>{{$key + 1 }}</td>
											<td>{{$detail->category_name  }}</td>
                                            <td>{{$detail->product_desc  }}</td>
											<td>
												<a href="{{route('detail.edit',['id'=>$detail->product_detail_id])  }}" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i> Sửa</a>
												<a href="{{route('detail.delete',['id'=>$detail->product_detail_id])  }}" onclick="return confirm('Bạn có chắc chắn muốn xóa?')" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> Xóa</a>
												
											</td>
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
        $('#product').addClass('active');
    })
</script>
@endsection