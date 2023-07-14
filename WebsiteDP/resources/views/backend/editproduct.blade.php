@extends('master.adminmaster')
@section('style')
@endsection
@section('content')	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Sản phẩm</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Sửa sản phẩm</div>
					<div class="panel-body">
						<form action="{{route('product.update',['product'=>$product->product_id])  }}" method="POST"  enctype="multipart/form-data" >
							@csrf
							@method('PATCH')
							<div class="row" style="margin-bottom:40px">
								<div class="col-xs-8">
									<div class="form-group" >
										<label>Tên sản phẩm</label>
										<input required type="text" name="name" class="form-control" value="{{$product->product_name  }}">
									</div>
									<div class="form-group" >
										<label>Miêu Tả</label>
										<input required type="text" name="desc" class="form-control" value="{{$product->product_desc  }}">
									</div>
									<div class="form-group" >
										<label>Ảnh sản phẩm</label>
										<input id="img" type="file" name="img" class="form-control hidden" onchange="changeImg(this)">
					                    <img id="avatar" class="thumbnail" width="300px" src="../frontend/img/product/{{$product->product_image  }}">
									</div>
									<div class="form-group" >
										<label>Giá</label>
										<input required type="number" name="price" class="form-control" value="{{$product->product_price  }}">
									</div>
									<div class="form-group" >
										<label>Số Lượng</label>
										<input required type="text" name="qty" class="form-control" value="{{$product->qty  }}">
									</div>
									<div class="form-group" >
										<label>Danh mục</label>
										<select required name="cate" class="form-control">
											@foreach ($categories as $category )
											@if ($category->category_id==$product->category_id)
												<option value="{{$category ->category_id  }}" selected="">{{$category ->category_name  }}</option>
												@else
												<option value="{{$category ->category_id  }}">{{$category ->category_name  }}</option>
											@endif
												

											@endforeach
					                    </select>
									</div>
									<input type="submit" name="submit" value="Sửa" class="btn btn-primary">
									<a href="#" class="btn btn-danger">Hủy bỏ</a>
								</div>
							</div>
						</form>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	@endsection
	@section('script')
	<script>
		function changeImg(input){
		    //Nếu như tồn thuộc tính file, đồng nghĩa người dùng đã chọn file mới
		    if(input.files && input.files[0]){
		        var reader = new FileReader();
		        //Sự kiện file đã được load vào website
		        reader.onload = function(e){
		            //Thay đổi đường dẫn ảnh
		            $('#avatar').attr('src',e.target.result);
		        }
		        reader.readAsDataURL(input.files[0]);
		    }
		}
		$(document).ready(function() {
		    $('#avatar').click(function(){
		        $('#img').click();
		    });
		});
	</script>	
	@endsection
</body>

</html>
