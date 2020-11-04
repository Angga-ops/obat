<?php
if ($_SESSION['level']!='admin' && $_SESSION['level']!='apotik'){ echo "<script>window.location='users?menu=404';</script>";}

$cek_data = mysqli_query($con, "SELECT * FROM tbl_transaksi
  INNER JOIN tbl_pasien ON tbl_pasien.id_pasien=tbl_transaksi.id_pasien
  INNER JOIN tbl_resep ON tbl_resep.id_resep=tbl_transaksi.id_resep
  INNER JOIN tbl_stok ON tbl_stok.id_stok=tbl_transaksi.id_stok
  ORDER BY tbl_transaksi.id_transaksi DESC");
?>
<a href="users?menu=transaksi&aksi=tambah" class="btn btn-primary">Tambah Data</a>
<hr>
<table id="data_tables" class="table table-bordered table-striped table-hover" width="100%">
  <thead>
    <tr>
      <th width="1%">No.</th>
      <th width="20%">Tanggal Transaksi</th>
      <th width="20%">Nama Pasien</th>
      <th width="15%">Nama Obat</th>
      <th width="15%">Jumlah Obat</th>
      <th width="15%">Harga</th>
      <th width="19%">Total</th>
      <th width="10%">Aksi</th>
    </tr>
  </thead>
  <tbody>
    <?php
    $no=1;
    while ($baris = mysqli_fetch_array($cek_data)) {
      $query = mysqli_query($con, "SELECT jumlah_keluar FROM tbl_obat_keluar WHERE id_stok='".$baris['id_stok']."'");
      $jml_obat = mysqli_fetch_array($query);
      ?>
      <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo $baris['tanggal_transaksi']; ?></td>
        <td><?php echo $baris['nama_pasien']; ?></td>
        <td><?php echo $baris['nama_obat']; ?></td>
        <td><?php echo $jml_obat['jumlah_keluar']; ?></td>
        <td><?php echo $baris['harga_satuan']; ?></td>
        <td><?php echo $jml_obat['jumlah_keluar'] * $baris['harga_satuan']; ?></td>
        <td class="text-center">
          <!-- <a href="users?menu=transaksi&aksi=edit&id=<?php echo $baris['id_transaksi']; ?>" class="btn btn-success btn-xs" title="Edit"><i class="fa fa-pencil"></i></a> -->
          <a href="users?menu=transaksi&aksi=hapus&id=<?php echo $baris['id_transaksi']; ?>" class="btn btn-danger btn-xs" title="Hapus" onclick="return confirm('Anda Yakin?');"><i class="fa fa-trash"></i></a>
        </td>
      </tr>
    <?php
    } ?>
  </tbody>
</table>
