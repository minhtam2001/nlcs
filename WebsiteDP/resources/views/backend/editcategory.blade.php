@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Danh mục sản phẩm</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-xs-12 col-md-5 col-lg-5">
				<form action="{{route('category.update',['category'=>$categories->category_id])  }}" method="post">
					@csrf
					@method('PATCH')
					<div class="panel panel-primary">
						<div class="panel-heading">
							Sửa danh mục
						</div>
						<div class="panel-body">
							<div class="form-group">
								<label>Tên danh mục:</label>
    							<input type="text" name="name" class="form-control" value="{{$categories->category_name  }}" placeholder="Tên danh mục...">
								<button type="submit" class="btn btn-primary btn-block btn-flat">Sửa</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
@endsection
@section('script')
@endsection