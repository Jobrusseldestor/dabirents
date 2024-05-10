<?php
require('topNav.php');

// Initialize variables
$category_id = '';
$DSN = '';
$name = '';
$security = '';
$rent = '';
$qty = '';
$img = '';
$description = '';
$short_desc = '';
$error = '';
$msg = '';

// Check if ID is set in GET request
if (isset($_GET['id']) && $_GET['id']!= '') {
  $id = getSafeValue($con, $_GET['id']);
  $sql = mysqli_query($con, "SELECT * FROM dress WHERE id='$id'");
  $check = mysqli_num_rows($sql);
  if ($check > 0) {
    $row = mysqli_fetch_assoc($sql);
    $category_id = $row['category_id'];
    $DSN = $row['DSN'];
    $name = $row['name'];
    $img = $row['img'];
    $security = $row['security'];
    $rent = $row['rent'];
    $qty = $row['qty'];
    $short_desc = $row['short_desc'];
    $description = $row['description'];
  } else {
    echo "<script>window.location.href='books.php';</script>";
    exit;
  }
}

// Check if form is submitted
if (isset($_POST['submit'])) {
  $category_id = getSafeValue($con, $_POST['category_id']);
  $DSN = getSafeValue($con, $_POST['DSN']);
  $name = getSafeValue($con, $_POST['name']);
  $security = getSafeValue($con, $_POST['security']);
  $rent = getSafeValue($con, $_POST['rent']);
  $qty = getSafeValue($con, $_POST['qty']);
  $short_desc = getSafeValue($con, $_POST['short_desc']);
  $description = getSafeValue($con, $_POST['description']);

  // Check if image is uploaded
  if (!empty($_FILES['img']['name'])) {
    $img = $_FILES['img']['name'];
    move_uploaded_file($_FILES['img']['tmp_name'], BOOK_IMAGE_SERVER_PATH. $img);
  }

  // Check if dress already exists
  $sql = mysqli_query($con, "SELECT * FROM dress WHERE name='$name'");
  $check = mysqli_num_rows($sql);
  if ($check > 0) {
    if (isset($_GET['id']) && $_GET['id']!= '') {
      $getData = mysqli_fetch_assoc($sql);
      if ($id == $getData['id']) {
        // Do nothing
      } else {
        $msg = "Book already exist";
      }
    } else {
      $msg = "Book already exist";
    }
  }

  // Update or insert dress
  if ($msg == '') {
    if (isset($_GET['id']) && $_GET['id']!= '') {
      $sql = "UPDATE dress SET category_id='$category_id', DSN='$DSN', name='$name', security='$security', rent='$rent', qty='$qty', short_desc='$short_desc', description='$description', img='$img' WHERE id='$id'";
    } else {
      $sql = "INSERT INTO dress (category_id, DSN, name, security, rent, qty, short_desc, description, status, img) VALUES ('$category_id', '$DSN', '$name', '$security', '$rent', '$qty', '$short_desc', '$description', '1', '$img')";
    }
    if (mysqli_query($con, $sql)) {
      echo "<script>window.location.href='books.php';</script>";
      exit;
    } else {
      $error = "Error";
    }
  }
}
?>
<main>
    <div class="container pt-4">
        <h4 class="fs-2 text-center ">Manage Dress</h4>
        <hr>
        <br>
    </div>

    <form method="post" enctype="multipart/form-data">
        <div class="row g-3">
            <div class="col-sm-8">

                <!-- ISBN -->
                <div class="form-outline mb-4 ms-5">
                    <input type="text" name="DSN" value="<?php echo $DSN ?>" id="Dress name" class="form-control"
                        required />
                    <label class="form-label" for="Dress name">Enter Dress DSN</label>
                </div>
            </div>
            <div class="col-sm">

                <!-- Categories selector-->
                <div>
                    <select class="form-select" name="category_id">
                        <option class="">Select Category</option>
                        <?php
            $categorySql = mysqli_query($con, "select id, category from categories order by category asc");
            while ($row = mysqli_fetch_assoc($categorySql)) {
              if ($row['id'] == $category_id) {
                echo "<option selected value=" . $row['id'] . ">" . $row['category'] . "</option>";
              } else {
                echo "<option value=" . $row['id'] . ">" . $row['category'] . "</option>";
              }
            }
            ?>
                    </select>
                </div>
            </div>
        </div>

        <!-- Book Name -->
        <div class="form-outline mb-4 mx-5">
            <input type="text" name="name" value="<?php echo $name ?>" id="Dress name" class="form-control" required />
            <label class="form-label" for="Dress name">Enter dress name</label>
        </div>


        <!-- security -->
        <div class="form-outline mb-4 mx-5">
            <input type="number" name="security" value="<?php echo $security ?>" id="Dress name" class="form-control"
                required />
            <label class="form-label" for="Dress name">Enter dress security charges</label>
        </div>

        <!-- rent -->
        <div class="form-outline mb-4 mx-5">
            <input type="number" name="rent" value="<?php echo $rent ?>" id="Dress name" class="form-control" required />
            <label class="form-label" for="Dress name">Enter dres rent Cost</label>
        </div>

        <!-- qty -->
        <div class="form-outline mb-4 mx-5">
            <input type="number" name="qty" value="<?php echo $qty ?>" id="Dress name" class="form-control" required />
            <label class="form-label" for="Dress name">Enter dress quantity</label>
        </div>
        <!-- img -->
        <div class="form-outline mb-4 mx-5">
            <label class="form-label ms-2 p-1" for="Dress name">Enter dress image</label>
            <input type="file" name="img" id="Dress name" class="form-control" />
        </div>

        <!-- short_desc -->
        <div class="form-outline mb-4 mx-5">
            <textarea name="short_desc" id="Dress name" class="form-control"
                required><?php echo $short_desc ?></textarea>
            <label class="form-label" for="Dress name">Enter dress short description</label>
        </div>

        <!-- description -->
        <div class="form-outline mb-4 mx-5">
            <textarea name="description" id="Dress name" class="form-control"
                required><?php echo $description ?></textarea>
            <label class="form-label" for="Dress name">Enter dress description</label>
        </div>
        <div class="mb-1 d-flex justify-content-center field_error">
            <?php echo $msg ?>
        </div>
        <div class="mb-1 d-flex justify-content-center">
            <?php echo $error ?>
        </div>
        <!-- Submit button -->
        <div class="text-center">
            <button type="submit" name="submit" class="btn btn-primary mx-5">Submit</button>
        </div>
    </form>
</main>
<!-- MDB -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript" src="js/admin.js"></script>
</body>

</html>