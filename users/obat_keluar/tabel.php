<?php
if ($_SESSION['level']!='admin' && $_SESSION['level']!='apotik' && $_SESSION['level']!='gudang'){ echo "<script>window.location='users?menu=404';</script>";}

$cek_data = mysqli_query($con, "SELECT * FROM tbl_obat_keluar JOIN tbl_stok ON tbl_stok.id_stok=tbl_obat_keluar.id_stok ORDER BY id_keluar DESC");

?>
<table id="data_tables" class="table table-bordered table-striped table-hover" width="100%">
  <thead>
    <tr>
      <th width="1%">No.</th>
      <th width="20%">Tanggal Keluar</th>
      <th width="55%">Nama Obat</th>
      <th width="20%">Jumlah Keluar</th>

    </tr>
  </thead>
  <tbody>
    <?php
    $no=1;
    while ($baris = mysqli_fetch_array($cek_data)) {
      $query = mysqli_query($con, "SELECT * FROM tbl_stok JOIN tbl_obat_masuk ON tbl_obat_masuk.id_masuk=tbl_stok.id_masuk WHERE tbl_stok.id_stok='".$baris['id_stok']."'");
      $ambil = mysqli_fetch_array($query);
    ?>
      <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo date('d-m-Y',strtotime($baris['tanggal_keluar'])); ?></td>
        <td><?php echo $ambil['nama_obat']; ?></td>
        <td><?php echo $baris['jumlah_keluar']; ?></td>
      </tr>
    <?php
    } ?>
  </tbody>
</table>
