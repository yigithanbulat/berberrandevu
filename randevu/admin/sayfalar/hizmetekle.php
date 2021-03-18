<?php session_start(); ob_start(); ?>
<?php include 'baglantilar/database.php'; ?>
<?php
if( isset($_SESSION['yonetici']) && !empty($_SESSION['yonetici']) ){
  $records = $conn->prepare('SELECT * FROM yoneticiler WHERE id = :id');
  $records->bindParam(':id', $_SESSION['yonetici']);
  $records->execute();
  $results = $records->fetch(PDO::FETCH_ASSOC);
  $user = NULL;
  if( count($results) > 0){ $user = $results; }
}
else { header("Location: giris.php"); die(); }
?>

<?php 
$vericek = $conn -> prepare("SELECT * FROM yoneticiler where id = :id");
$vericek->bindParam(':id', $_SESSION['yonetici']);
$vericek-> execute();
$veriyigoster = $vericek -> fetch(PDO::FETCH_ASSOC);
?>

<?php
if(isset($_POST['Gonder']))
{
  $urunbaslik = $_POST['urunbaslik'];
  $urunicerik = $_POST['urunicerik'];
  $urunfiyat = $_POST['urunfiyat'];
  $ekleyen = $veriyigoster['adiniz'];
  $temp = explode(".", $_FILES["urunresim"]["name"]);
  $newfilename = round(microtime(true)) . '.' . end($temp);
  move_uploaded_file($_FILES["urunresim"]["tmp_name"], "assets/resim/" . $newfilename);
  $urunresim = $newfilename;
  $stmt = $conn->prepare('INSERT INTO hizmetler(urunbaslik, urunicerik, urunfiyat, urunresim, ekleyen) VALUES (:urunbaslik, :urunicerik, :urunfiyat, :urunresim, :ekleyen)');
  $stmt->bindParam(':urunbaslik',$urunbaslik);
  $stmt->bindParam(':urunicerik',$urunicerik);
  $stmt->bindParam(':urunfiyat',$urunfiyat);
  $stmt->bindParam(':urunresim',$urunresim);
  $stmt->bindParam(':ekleyen',$ekleyen);
  $stmt->execute();
  if($stmt){
    $mesaj = '<div class="alert alert-dismissible alert-success">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <strong>Hizmet Eklendi !</strong>
    </div>';
  }else{
    $mesaj = '<div class="alert alert-dismissible alert-danger">
    <button type="button" class="close" data-dismiss="alert">×</button>
    <strong>Hizmet Ekleme Başarısız !</strong>
    </div>';
  }
}

?>


<div class="container-fluid">

  <ol class="breadcrumb">
    <li class="breadcrumb-item"><a href="?sayfa=anasayfa">Ana Sayfa</a></li>
    <li class="breadcrumb-item active">Hizmet Ekle</li>
  </ol>
  <form action="" method="post" enctype="multipart/form-data">
    <div class="row">
      <div class="col-xl-12 col-sm-12 mb-3">
        <div class="message"></div>
        <?php if(!empty($mesaj)): ?>
          <p><?= $mesaj ?></p>
        <?php endif; ?>
      </div>
      <div class="col-xl-4 col-sm-12 mb-3">
        <div class="card shadow img-upload">
          <img src='http://ydy.deu.edu.tr/wp-content/uploads/2018/03/resim_yok.jpg' id='img-upload'/>
        </div>
      </div>
      <div class="col-xl-8 col-sm-12 mb-3">
        <div class="input-group mb-3">
          <div class="input-group-prepend"><span class="input-group-text" id="inputGroupFileAddon01">Hizmet Resmi</span></div>
          <div class="custom-file">
            <input type="file" class="custom-file-input" name="urunresim" id="imgInp" aria-describedby="inputGroupFileAddon01">
            <label class="custom-file-label" for="inputGroupFile01">Seç</label>
          </div>
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend"><span class="input-group-text">Hizmet Başlığı</span></div>
          <input type="text" name="urunbaslik" class="form-control" value="Hizmet Başlığı">
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend"><span class="input-group-text">Hizmet İçeriği</span></div>
          <input type="text" name="urunicerik" class="form-control" value="Hizmet İçeriği">
        </div>
        <div class="input-group mb-3">
          <div class="input-group-prepend"><span class="input-group-text">Hizmet Fiyatı</span></div>
          <input type="text" name="urunfiyat" class="form-control" value="Hizmet Fiyatı">
          <div class="input-group-append"><span class="input-group-text">TL</span></div>
        </div>
      </div>
      <div class="col-xl-12 col-sm-12 mb-3">
        <hr>
        <a href="?sayfa=urunler" class="btn btn-danger pull-left">Geri Dön</a>
        <button type="submit" name="Gonder" class="btn btn-success float-right">Oluştur</button>
      </div>
    </div>
  </form>
</div>
