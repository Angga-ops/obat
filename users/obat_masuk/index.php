
<div class="panel panel-info">
  <div class="panel-heading">
    <b><i class="fa fa-download"></i> <?php echo ucwords($_GET['aksi']); ?> Obat Masuk</b>
  </div>
  <div class="panel-body">
    <?php
    if ($_SESSION['level']=='admin'){
      if ($_GET['aksi']=='tambah'){
        include "tambah.php";
      }elseif ($_GET['aksi']=='edit'){
        include "edit.php";
      }elseif ($_GET['aksi']=='hapus'){
        include "hapus.php";
      }elseif ($_GET['aksi']=='detail'){
        include "detail.php";
      }else{
        include "tabel.php";
      }
    }
    elseif ($_SESSION['level']=='apotik') {
      if ($_GET['aksi']=='tambah'){
        include "tambah.php";
      }elseif ($_GET['aksi']=='edit'){
        include "edit.php";
      }elseif ($_GET['aksi']=='hapus'){
        include "hapus.php";
      }elseif ($_GET['aksi']=='detail'){
        include "detail.php";
      }else{
        include "tabel.php";
      }
    }
    elseif ($_SESSION['level']=='gudang') {
      include "tabel.php";
    } 
    else {
       echo "<script>window.location='users?menu=404';</script>";
    }
     ?>
  </div>
</div>
