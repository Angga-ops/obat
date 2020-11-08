<?php
if ($_SESSION['level']!='admin' && $_SESSION['level']!='kasir'){ echo "<script>window.location='users?menu=404';</script>";}

$cek_data = mysqli_query($con, "SELECT * FROM tbl_kredit
  INNER JOIN tbl_obat_masuk ON tbl_obat_masuk.id_masuk=tbl_kredit.id_masuk
  ORDER BY tbl_kedit.id_kredit DESC");
?>
<table id="data_tables" class="table table-bordered table-striped table-hover" width="100%">
  <thead>
    <tr>
      <th width="1%">No.</th>
      <th width="15%">Nama obat</th>
      <th width="15%">Jenis Obat</th>
      <th width="15%">Bentuk Obat</th>
      <th width="15%">Tanggal Expired</th>
      <th width="15%">Tanggal Masuk</th>
      <th width="15%">Jumlah Masuk</th>
      <th width="15%">Harga</th>
      <th width="15%">Total Harga</th>
      <th width="15%">Aksi</th>

    </tr>
  </thead>
  <tbody>
    <?php
    $no=1;
    while ($baris = mysqli_fetch_array($cek_data)) {
      ?>
      <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $baris['nama_obat']; ?></td>
        <td><?php echo $baris['jenis_obat']; ?></td>
        <td><?php echo $baris['bentuk_obat']; ?></td>
        <td><?php echo $baris['tanggal_exp']; ?></td>
        <td><?php echo $baris['tanggal_masuk']; ?></td>
        <td><?php echo $baris['jumlah_masuk'];?></td>
        <td><?php echo $baris['harga_beli'];?></td>
        <td><?php echo $baris['harga_beli'] * $baris['jumlah_masuk'];?></td>
        <td class="text-center">
        <a href="users?menu=pembayara_suppliern&aksi=kredit&id=<?php echo $baris['id_kredit'];?>" class="btn btn-warning">Kredit</a>
          <?php if ($bayar==0){ ?>
            <a href="users?menu=pembayaran&aksi=tambah&id=<?php echo $baris['id_transaksi']; ?>" class="btn btn-primary" title="Bayar">Bayar</a>
          <?php }else{
            $id_bayar = mysqli_fetch_array($q_bayar)['id_bayar'];
            ?>
            <i class="fa fa-check text-success"></i>
            &nbsp;
            <a href="users/laporan/pembayaran.php?id=<?php echo $id_bayar; ?>" class="btn btn-primary btn-xs" title="Cetak" target="_blank"><i class="fa fa-print"></i> </a>
          <?php } ?>
        </td>
      </tr>
    <?php
    } ?>
  </tbody>
</table>
