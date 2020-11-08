<?php if ($_SESSION['level']!='admin' && $_SESSION['level']!='dokter'){ echo "<script>window.location='users?menu=404';</script>";} ?>
<?php
$cek_pasien = mysqli_query($con, "SELECT * FROM tbl_pasien");
$cek_dokter = mysqli_query($con, "SELECT * FROM tbl_user WHERE level='dokter'");
$cek_obat = mysqli_query($con, "SELECT * FROM tbl_obat_masuk WHERE jenis_obat='Keras'");
?>
<!-- <div class="col-md-2"></div> -->
<div class="col-md-12">
  <br>
  <form class="form-horizontal" action="" method="post" data-parsley-validate="true">
    <div class="form-group">
      <div class="col-md-6">
        <label>Nama Pasien</label>
        <select class="form-control" name="id_pasien" required>
          <option value="">- PILIH -</option>
          <?php while ($baris = mysqli_fetch_array($cek_pasien)) { ?>
            <option value="<?php echo $baris['id_pasien']; ?>"><?php echo $baris['nama_pasien']; ?></option>
          <?php } ?>
        </select>
      </div>
      <div class="col-md-6">
        <label>Nama Dokter</label>
        <select class="form-control" name="id_dokter" required>
          <option value="">- PILIH -</option>
          <?php while ($baris = mysqli_fetch_array($cek_dokter)) { ?>
            <option value="<?php echo $baris['id_user']; ?>"><?php echo $baris['nama_lengkap']; ?></option>
          <?php } ?>
        </select>
      </div>
    </div>
    <div class="form-group">
      <div class="col-md-6">
        <label>Nama Obat</label>
        <select class="form-control" name="id_masuk" required>
          <option value="">- PILIH -</option>
          <?php while ($baris = mysqli_fetch_array($cek_obat)) { ?>
            <option value="<?php echo $baris['id_masuk']; ?>"><?php echo $baris['nama_obat']; ?></option>
          <?php } ?>
        </select>
      </div>
      <div class="col-md-6">
        <label>Tanggal Resep</label>
        <input type="text" name="tanggal_resep" id="tgl_1" class="form-control" value="" placeholder="Tanggal Resep" title="Tanggal Resep" required>
      </div>
    </div>
    <div class="form-group">
      <div class="col-md-6">
        <label>Keterangan</label>
        <textarea name="keterangan" id="keterangan" class="form-control" placeholder="Keterangan" title="Keterangan" required></textarea>
      </div>
    </div>
    <div class="form-group">
      <hr>
      <div class="col-md-6">
        <a href="users?menu=resep_obat" class="btn btn-default"><i class="fa fa-angle-double-left"></i> </a>
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
  $id_pasien      = htmlentities(strip_tags($_POST['id_pasien']));
  $id_dokter      = htmlentities(strip_tags($_POST['id_dokter']));
  $tanggal_resep  = date('Y-m-d',strtotime(htmlentities(strip_tags($_POST['tanggal_resep']))));
  $id_masuk       = htmlentities(strip_tags($_POST['id_masuk']));
  $keterangan     = htmlentities(strip_tags($_POST['keterangan']));

  $simpan = mysqli_query($con, "INSERT INTO tbl_resep
                          (id_pasien, id_dokter, tanggal_resep, id_masuk,
                           keterangan)
                          VALUES
                          ('$id_pasien', '$id_dokter', '$tanggal_resep', '$id_masuk',
                           '$keterangan')
                        ");
  if ($simpan) {
    echo "<script>alert('Data berhasil disimpan!'); window.location='users?menu=resep_obat';</script>";
    exit;
  }else {
    echo "<script>alert('Gagal! Silahkan coba lagi'); window.location='users?menu=resep_obat&aksi=tambah';</script>";
    exit;
  }
endif;
?>
