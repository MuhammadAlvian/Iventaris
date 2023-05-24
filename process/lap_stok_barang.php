<?php
// session_start();
include ('../config/conn.php');
include ('../config/function.php');
?>
<html>

<head>
    <style>
    h2 {
        padding: 0px;
        margin: 0px;
        font-size: 14pt;
    }

    h4 {
        font-size: 12pt;
    }

    text {
        padding: 0px;
    }

    table {
        border-collapse: collapse;
        border: 1px solid #000;
        font-size: 11pt;
    }

    th,
    td {
        border: 1px solid #000;
        padding: 5px;
    }

    table.tab {
        table-layout: auto;
        width: 100%;
    }
    </style>
    <title>Cetak Laporan Barang Masuk</title>
</head>

<body>
    <?php
    $query = mysqli_query($con,"SELECT x.*,x1.nama_merek,x2.nama_kategori FROM barang x JOIN merek x1 ON x1.idmerek=x.merek_id JOIN kategori x2 ON x2.idkategori=x.kategori_id ORDER BY x.idbarang DESC")or die(mysqli_error($con));
    
    ?>
    <div style="page-break-after:always;text-align:center;margin-top:5%;">
        <div style="line-height:5px;">
            <h2>LAPORAN STOK BARANG</h2>
        </div>
        <hr style="border-color:black;">
        <table class="tab">
            <tr>
                <th width="20">NO</th>
                <th>NAMA BARANG</th>
                <th>MEREK</th>
                <th>KATEGORI</th>
                <th>KETERANGAN</th>
                <th>STOK</th>
            </tr>
            <?php $n=1; while($row = mysqli_fetch_array($query)): ?>
            <tr>
                <td align="center"><?= $n++.'.'; ?></td>
                <td><?= $row['nama_barang']; ?></td>
                <td><?= $row['nama_merek']; ?></td>
                <td><?= $row['nama_kategori']; ?></td>
                <td><?= $row['keterangan']; ?></td>
                <td><?= $row['stok']; ?></td>
            </tr>
            <?php endwhile; ?>
        </table>
    </div>
</body>

</html>

<script>
window.print();
</script>