@extends('master.adminmaster')
@section('style')
@endsection
@section('content')
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Thành Viên</h1>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12 col-md-12 col-lg-12">
				
				<div class="panel panel-primary">
					<div class="panel-heading">Thêm Thành Viên</div>
					<div class="panel-body">
						<form action="{{route('create.user')  }}" method="post">
							@csrf
							<div class="row" style="margin-bottom:40px">
								<div class="col-xs-8">
									<div class="form-group" >
										<label>Tên Thành Viên</label>
										<input required type="text" name="name" class="form-control">
									</div>
									<div class="form-group" >
										<label>Email</label>
										<input required type="text" name="email" class="form-control">
									</div>
									<div class="form-group" >
										<label>Mật Khẩu</label>
										<input required type="text" name="pass" class="form-control">
									</div>
									<div class="form-group" >
										<label>Số Điện Thoại</label>
										<input required type="text" name="phone" class="form-control">
									</div>
									<input type="submit" name="submit" value="Thêm" class="btn btn-primary">
									<a href="{{route('user')  }}" class="btn btn-danger">Hủy bỏ</a>
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