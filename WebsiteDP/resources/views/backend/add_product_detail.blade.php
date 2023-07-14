@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
<div class="col-sm-9 col-sm-off set-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Thêm Thông Số</h1>
			</div>
		</div><!--/.row-->	
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Thông Số Sản Phẩm </div>
					<div class="panel-body">
						<div class="bootstrap-table">
							<div class="table-responsive">
								<form action="{{route('detail.store',['id'=>$id])  }}" method="POST">
									@csrf
                                    <div class="mb-3">
                                        <label for="exampleInputEmail1" class="form-label">Tên Thông Số</label>
                                        <input type="text" name="name" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                    </div>
                                    <div class="mb-3">
                                        <label for="exampleInputPassword1" class="form-label">Thông Số</label>
                                        <input type="text" name="desc" class="form-control" id="exampleInputPassword1">
                                    </div>
                                    <button type="submit" class="btn btn-primary">Lưu</button>
                                    </form>
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