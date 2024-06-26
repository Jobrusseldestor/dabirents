<?php require('header.php') ?>
<?php
$search = mysqli_real_escape_string($con, $_GET['search']);
function getBook($con) {

  $search = mysqli_real_escape_string($con, $_GET['search']);

  $sql = "SELECT dress.*, categories.category 
          FROM dress 
          LEFT JOIN categories ON dress.category_id = categories.id  
          WHERE dress.name LIKE '%$search%' OR categories.category LIKE '%$search%'";
          
  $res = mysqli_query($con, $sql);

  $data = array();  

  while($row = mysqli_fetch_assoc($res)) {
    $data[] = $row; 
  }

  return $data;

}

?>
<script>
document.title = "Book Categories | Book Rental";
</script>
<main class="px-4 row py-3 container-fluid">
    <div class="d-flex justify-content-center flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 border-bottom">
        <h1 class="h2">Searched Dress</h1>
    </div>
    <?php
  $getBook = getBook($con);
  if (count($getBook) > 0) {
  ?>
    <div class="row gy-3 text-center ">
        <?php
      foreach ($getBook as $list) {
      ?>
        <div class="col-6 col-sm-4 col-md-3 col-lg-2">
            <div class="card border-dark  shadow-sm product">
                <img id="card-img" alt="Book Image" src="<?php echo BOOK_IMAGE_SITE_PATH . $list['img'] ?>"
                    class="card-img-top rounded" height="250rem" />
                <div class="overlay">
                    <a href="dressss.php?id=<?php echo $list['id'] ?>" class="btn-lg text-decoration-none rent-btn">
                        Info</a>
                </div>
            </div>
            <div id="bookCardName">
                <a href="dressss.php?id=<?php echo $list['id'] ?>"
                    class="card-text text-uppercase text-break fw-bold text-decoration-none">
                    <?php echo $list['name'] ?>
                </a>
            </div>
        </div>
        <?php } ?>
    </div>
    <?php } else {
    echo "No Book Found";
  } ?>
</main>
<?php require('footer.php') ?>