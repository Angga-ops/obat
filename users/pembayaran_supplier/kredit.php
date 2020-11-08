<?php if ($_SESSION['level']!='admin' && $_SESSION['level']!='kasir'){ echo "<script>window.location='users?menu=404';</script>";} ?>
<?php
$kredit = mysqli_num_rows(mysqli_query($con, "SELECT * FROM tbl_kredit WHERE id_kredit='$_GET[id]'"));
?>
<!-- <div class="col-md-2"></div> -->
<div class="col-md-12">
  <br>
  <form class="form-horizontal" action="" method="post" data-parsley-validate="true">
    <div class="form-group">
      <div class="col-md-6">
        <label>Tanggal bayar</label>
        <input type="date" name="tgl_bayar" class="form-control" value="" placeholder="Tanggal Bayar"  required>
      </div>
    </div>
    <div class="form-group">
      <div class="col-md-6">
        <label>Bayar awal</label>
        <input type="number" name="byr_awal" class="form-control" value="" placeholder="Bayar"  required>
      </div>
    </div>
    <div class="form-group">
      <hr>
      <div class="col-md-6">
        <a href="users?menu=kredit" class="btn btn-default"><i class="fa fa-angle-double-left"></i></a>
      </div>
      <div class="col-md-6">
        <button type="submit" name="btnsimpan" class="btn btn-info" style="float:right">Simpan</button>
      </div>
    </div>
  </form>
</div>
<!-- <div class="col-md-2"></div> -->

<?php
if (isset($_POST['btnsimpan'])):
  $tgl_bayar  = date('Y-m-d',strtotime(htmlentities(strip_tags($_POST['tanggal_bayar']))));
  $byr_awal   = htmlentities(strip_tags($_POST['byr_awal']));

  $simpan = mysqli_query($con, "UPDATE tbl_kredit SET
                        tanggal_bayar='$tgl_bayar', byr_awal= '$byr_awal' WHERE id_kredit='$_GET[id]' 
                        ");
  if ($simpan) {
    echo "<script>alert('Data berhasil disimpan!'); window.location='users?menu=tabel';</script>";
    exit;
  }else {
    echo "<script>alert('Gagal! Silahkan coba lagi'); window.location='users?menu=kredit&aksi=tabel';</script>";
    exit;
  }
endif;
?>
