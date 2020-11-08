<?php
if ($_SESSION['level']!='admin' && $_SESSION['level']!='kasir'){ echo "<script>window.location='users?menu=404';</script>";}

$cek_data = mysqli_query($con, "SELECT * FROM tbl_kredit
INNER JOIN tbl_obat_masuk ON tbl_obat_masuk.id_masuk = tbl_kredit.id_masuk ORDER BY tbl_kredit.id_kredit DESC");
?>
<table id="data_tables" class="table table-bordered table-striped table-hover" width="100%">
  <thead>
    <tr>
      <th width="">No.</th>
      <th width="">Nama obat</th>
      <th width="">Jenis Obat</th>
      <th width="">Tanggal Expired</th>
      <th width="">Tanggal Masuk</th>
      <th width="">Tanggal Bayar</th>
      <th width="">Jumlah Masuk</th>
      <th width="">Harga</th>
      <th width="">Total Harga</th>
      <th width="">Sisa Bayar</th>
      <th width="">Aksi</th>

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
        <td><?php echo $baris['tanggal_exp']; ?></td>
        <td><?php echo $baris['tanggal_masuk']; ?></td>
        <td><?php echo $baris['tanggal_bayar']; ?></td>
        <td><?php echo $baris['jumlah_masuk'];?></td>
        <td>Rp.<?php echo number_format ($baris['harga_beli']);?></td>
        <td>Rp.<?php echo number_format ($baris['harga_beli'] * $baris['jumlah_masuk']);?></td>
        <td>Rp.<?php echo number_format ($baris['harga_beli'] * $baris['jumlah_masuk'] - $baris['byr_awal']);?></td>
        <td class="text-center">
         
        <a href="users?menu=pembayaran_supplier&aksi=kredit&id=<?php echo $baris['id_kredit'];?>" class="btn btn-warning">Kredit</a>
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
