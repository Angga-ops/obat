<div class="panel panel-warning">
  <div class="panel-heading">
    <b><i class="fa fa-credit-card"></i> Pembayaran Supplier</b>
  </div>
  <div class="panel-body">
    <?php
    if ($_SESSION['level']!='admin' && $_SESSION['level']!='kasir'){ echo "<script>window.location='users?menu=404';</script>";}

    if ($_GET['aksi']=='tambah'){
      include "tambah.php";
    }else{
      include "tabel.php";
    } ?>
  </div>
</div>
