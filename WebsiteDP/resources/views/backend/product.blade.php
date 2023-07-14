@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
	<div class="col-sm-9 col-sm-off set-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Sản phẩm</h1>
			</div>
		</div><!--/.row-->	
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Danh sách sản phẩm</div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<div class="table-responsive">
								<a href="{{route('product.create')  }}" class="btn btn-primary">Thêm sản phẩm</a>
								<table class="table table-bordered" style="margin-top:20px;">				
									<thead>
										<tr class="bg-primary">
											<th with="5%">ID</th>
											<th width="20%">Tên Sản phẩm</th>
											<th width="10%">Ảnh sản phẩm</th>
											<th width="30%">Thông Tin Sản Phẩm</th>
											<th with="5%">Giá sản phẩm</th>
											<th with="5%">Số Lượng</th>
											<th with="25%">Tùy chọn</th>
										</tr>
									</thead>
									<tbody>
											@foreach ( $products as $product )
										<tr>
										
											<td>{{$product ->product_id  }}</td>
											<td>{{$product ->product_name  }}</td>
											<td>
												<img width="150px" src="../frontend/img/product/{{ $product->product_image  }}" class="thumbnail">
											</td>
											<td>{{$product ->product_desc  }}</td>
											<td>{{$product ->product_price  }}</td>
											
											<td>{{$product ->qty  }}</td>
											<td>
												<a href="{{route('product.edit',['product' => $product->product_id])  }}" class="btn btn-warning"><i class="fa fa-pencil" aria-hidden="true"></i> Sửa</a>
												<a href="{{route('destroy',['product'=>$product->product_id])  }}" onclick="return confirm('Bạn có chắc chắn muốn xóa?')" class="btn btn-danger"><i class="fa fa-trash" aria-hidden="true"></i> Xóa</a>
												<a href="{{route('detail.index',['id'=>$product->product_id])  }}" class="btn btn-success"><i class="fa fa-pencil" aria-hidden="true"></i>Chi Tiết</a>
											</td>
										</tr>
											@endforeach
										
										
									</tbody>
								</table>
								<div id="pagination" class="pagination m-2">{{$products->links()}}</div>							
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