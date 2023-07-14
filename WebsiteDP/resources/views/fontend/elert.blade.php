
 
@if ($errors->any())
    <div class="text-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

@if(Session::has('error'))
    <div class=" text-danger">
        {{Session::get('error')  }}
    </div>
@endif
@if(Session::has('success'))
    <div class="text-danger">
        {{Session::get('success')  }}
    </div>
@endif
@if(Session::has('fail'))
    <div class="text-danger">
        {{Session::get('fail')  }}
    </div>
@endif