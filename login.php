<?php 
session_start();
include ('config/conn.php');
if(isset($_POST['cek_login'])){
    $username = $_POST['username'];
    $password = $_POST['password'];

    if(empty($username) && empty($password)){
        $error = 'Harap isi username dan password';
    }else{
        $user = mysqli_query($con,"SELECT * FROM users WHERE username='$username'") or die(mysqli_error($con));
        if(mysqli_num_rows($user)!=0){
            $data = mysqli_fetch_array($user);
                if(password_verify($password,$data['password'])){
                    $_SESSION['iduser'] = $data['id_users'];
                    $_SESSION['username'] = $data['username'];
                    $_SESSION['fullname'] = $data['nama'];
                    $_SESSION['level'] = $data['level'];
                    header("Location:index.php");
                }else{
                    $error = 'Password anda salah';
                }
        }else{
            $error= 'Username tidak terdaftar';
        }
    }
    $_SESSION['error'] = $error;
}
?>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Inventaris Sekolah</title>

    <!-- Custom fonts for this template-->
    <link href="assets/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="assets/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-5 d-none d-lg-block text-center">
                                <img src="assets/img/login.png" width="420" height="400">
                            </div>
                            <div class="col-lg-7">
                                <div class="p-5">
                                    <?php if(isset($_SESSION['success'])):?>
                                    <div class="flash-data-berhasil" data-berhasil="<?= $_SESSION['success']; ?>"></div>
                                    <?php endif; unset($_SESSION['success']);?>
                                    <?php if(isset($_SESSION['error'])):?>
                                    <div class="flash-data-gagal" data-gagal="<?= $_SESSION['error']; ?>"></div>
                                    <?php endif; unset($_SESSION['error']);?>
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
                                        <br><center><p>Repost by RamestyWeb</p></center>
                                        
                                    </div>
                                    <form class="user" method="post" action="">
                                        <div class="form-group">
                                            <input type="text" name="username" class="form-control form-control-user"
                                                placeholder="Masukkan username">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="password"
                                                class="form-control form-control-user" placeholder="Masukkan password">
                                        </div>
                                        <hr>
                                        <button type="submit" class="btn btn-primary btn-user btn-block"
                                            name="cek_login">Login</button>
                                    </form>
                                    <hr>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="assets/vendor/jquery/jquery.min.js"></script>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="assets/vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="assets/vendor/sweet-alert/sweetalert2.all.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="assets/js/sb-admin-2.min.js"></script>
    <script src="assets/js/demo/sweet-alert.js"></script>

</body>

</html>