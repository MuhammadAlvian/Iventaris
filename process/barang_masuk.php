<?php
session_start();
include ('../config/conn.php');
include ('../config/function.php');
//proses tambah
if(isset($_POST['tambah'])){
    $barang_id = $_POST['barang_id'];
    $jumlah = $_POST['jumlah'];
    $keterangan = $_POST['keterangan'];
    $tanggal = $_POST['tanggal'];

    
    $insert = mysqli_query($con,"INSERT INTO barang_masuk (barang_id, jumlah, keterangan, tanggal) VALUES ('$barang_id','$jumlah','$keterangan','$tanggal')") or die (mysqli_error($con));
    if($insert){
        $success = 'Berhasil menambahkan data barang masuk';
    }else{
        $error = 'Gagal menambahkan data barang masuk';
    }
    $_SESSION['success'] = $success;
    $_SESSION['error'] = $error;
    header('Location:../?barang_masuk');
}

?>