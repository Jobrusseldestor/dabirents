<?php require('topNav.php'); ?>
<?php
if (isset($_POST['status_id'])) {
    $order_Id = $_POST['orderId'];
    $status_id = $_POST['status_id'];
    if ($status_id === 6 || $status_id === 4) {
        $qtyRes = mysqli_query($con, "SELECT dress.qty,dress.id FROM orders
                                            JOIN order_detail ON orders.id=order_detail.order_id
                                            JOIN dress ON order_detail.book_id=dress.id
                                            where order_detail.order_id='$order_Id'");
        $qtyRow = mysqli_fetch_assoc($qtyRes);
        $newQty = $qtyRow['qty'] + 1;
        $bookId = $qtyRow['id'];
        mysqli_query($con, "UPDATE dress SET qty = '$newQty' WHERE id='$bookId';");
    }

    mysqli_query($con, "update orders set order_status='$status_id' where id='$order_Id'");
}

?>
<!--Main layout-->
<main>
    <div class="container pt-4">
        <h4 class="fs-2 text-center ">Orders</h4>
        <hr>
    </div>
    <div class="card-body">
        <table class="table">
            <thead>
                <tr>
                    <th> OrderID</th>
                    <th>Order Date</th>
                    <th>Return Date</th>
                    <th>Book Name</th>
                    <th>Book Price</th>
                    <th>Rent Duration</th>
                    <th>Address</th>
                    <th>Order Status</th>
                </tr>
            </thead>
            <tbody>
                <?php
                $sql = "SELECT orders.*, name, status_name 
                FROM orders 
                JOIN order_detail ON orders.id = order_detail.order_id 
                JOIN dress ON order_detail.dress_id = dress.id 
                JOIN order_status ON orders.order_status = order_status.id 
                WHERE status_name LIKE '%Cancelled%' 
                ORDER BY date DESC";
                $res = mysqli_query($con, $sql);
                while ($row = mysqli_fetch_assoc($res)) { ?>
                <tr>
                    <td> <?php echo $row['id'] ?> </td>
                    <td> <?php echo $row['date'] ?> </td>
                    <td>
    <?php
    $currentDate = new DateTime();
    $duration = $row['duration'];
    $returnDate = $currentDate->modify("+$duration days");
    echo $returnDate->format("Y-m-d"); // or any format you prefer
    ?>
</td>
                    <td> <?php echo $row['name'] ?> </td>
                    <td> <?php echo $row['total'] ?> </td>
                    <td> <?php echo $row['duration'] ?> </td>
                    <td> <?php echo $row['address'] ?>, <?php echo $row['address2'] ?> </td>
                    <td> <?php echo $row['status_name'] ?> </td>
                </tr>
                <?php } ?>
            </tbody>
        </table>
    </div>
</main>
<!-- MDB -->
<script type="text/javascript" src="js/mdb.min.js"></script>
<!-- Custom scripts -->
<script type="text/javascript" src="js/admin.js"></script>
</body>

</html>