<?php

include 'config.php';

session_start();

$user_id = $_SESSION['user_id'];

if (!isset($user_id)) {
   header('location:login.php');
}

if (isset($_POST['send'])) {

   $msg = mysqli_real_escape_string($conn, $_POST['message']);

   $select_message = mysqli_query($conn, "SELECT * FROM `tbl_custommer` WHERE cus_id = '$user_id' AND cus_message = '$msg'") or die('query failed');

   if ($msg == '') {
      $message[] = 'Bạn chưa có bất kỳ phản hồi nào';
   } else {
      if (mysqli_num_rows($select_message) > 0) {
         $message[] = 'Tin nhắn đã được gửi!';
      } else {
         mysqli_query($conn, "UPDATE tbl_custommer SET
      cus_message = '$msg'
      WHERE cus_id = '$user_id'") or die('query failed');
         $message[] = 'Tin nhắn được gửi thành công!';
      }
   }
}

?>

<!DOCTYPE html>
<html lang="en">

<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="icon" href="img/icon.png">

   <title>contact</title>

   <!-- font awesome cdn link  -->
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

   <!-- custom css file link  -->
   <link rel="stylesheet" href="css/style.css">

</head>

<body>

   <?php include 'header.php'; ?>

   <div class="heading">
      <h3>Liên hệ với chúng tôi</h3>
      <p> <a href="index.php">Trang Chủ</a> / Liên Hệ </p>
   </div>

   <section class="contact">

      <form action="" method="post">
         <h3>Liên hệ</h3>
         <textarea name="message" class="box" placeholder="Nhập lời nhắn" id="" cols="30" rows="10"></textarea>
         <input type="submit" value="Gửi tin nhắn" name="send" class="btn">
      </form>

   </section>

   <?php include 'footer.php'; ?>

   <!-- custom js file link  -->
   <script src="js/script.js"></script>

</body>

</html>