<!DOCTYPE html>
<html>
<head>
   <base href="{{asset('frontend')  }}/">
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="css/login.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    
	<title>login</title>
</head>
<body>
<h2>Đăng Nhập/Đăng Ký</h2>
    <div class="container" id="container">
        <div class="form-container sign-up-container">
            <form action="{{route('register') }}" method="post">
                <h1>Đăng Ký</h1>
                @csrf
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>Sử Dụng Email Của Bạn Để Đăng Ký</span>
                <input name="name" type="text" placeholder="Name" />
                <input name="mail"type="email" placeholder="Email" />
                <input name="pass"type="password" placeholder="Password" />
                <input name="phone"type="phone" placeholder="Phone" />
                <button>Đăng Ký</button>
            </form>
        </div>
        <div class="form-container sign-in-container">
            <form action="{{route('sign.in')  }}" method="post">
                @csrf
                <h1>Đăng Nhập</h1>
                @include('fontend.elert')
                <div class="social-container">
                    <a href="#" class="social"><i class="fab fa-facebook-f"></i></a>
                    <a href="#" class="social"><i class="fab fa-google-plus-g"></i></a>
                    <a href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <span>Sử Dụng Tài Khoản Của Bạn!</span>
                <input name="user" type="text" placeholder="Email" />
                <input name="pass"type="password" placeholder="Password" />
                <a href="#">Forgot your password?</a>
                <button>Đăng Nhập</button>
            </form>
        </div>
        <div class="overlay-container">
            <div class="overlay">
                <div class="overlay-panel overlay-left">
                    <h1>Welcome Back!</h1>
                    <p>To keep connected with us please login with your personal info</p>
                    <button class="ghost" id="signIn">Đăng Nhập</button>
                </div>
                <div class="overlay-panel overlay-right">
                    <h1>Hello, Friend!</h1>
                    <p>Enter your personal details and start journey with us</p>
                    <button class="ghost" id="signUp">Đăng Ký</button>
                </div>
            </div>
        </div>
    </div>
</body>
  <script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add('right-panel-active');
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove('right-panel-active');
        });
    </script>
</html>