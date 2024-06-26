<?php
session_start();
?>

<?php

// initializing variables
$name = "";
$username = "";
$usn = "";
$email    = "";
$errors = array();
$reg_date = date("Y/m/d");

// connect to the database
$db = mysqli_connect('localhost', 'root', '', 'onlineshop');


// REGISTER USER
if (isset($_POST['reg_user'])) {
  $username = mysqli_real_escape_string($db, $_POST['admin_name']);
  $email = mysqli_real_escape_string($db, $_POST['admin_email']);
  $password_1 = mysqli_real_escape_string($db, $_POST['password_1']);
  $password_2 = mysqli_real_escape_string($db, $_POST['password_2']);

  if (empty($username)) { array_push($errors, "Username is required"); }
  if (empty($email)) { array_push($errors, "Email is required"); }
  if (empty($password_1)) { array_push($errors, "Password is required"); }
  if ($password_1 != $password_2) {
  array_push($errors, "The passwords do not match");
  }

  $user_check_query = "SELECT * FROM admin_info WHERE admin_name='$username' OR admin_email='$email' LIMIT 1";
  $result = mysqli_query($db, $user_check_query);
  $user = mysqli_fetch_assoc($result);

  if ($user) {
    if ($user['admin_name'] === $username) {
      array_push($errors, "Username already exists");
    }

    if ($user['admin_email'] === $email) {
      array_push($errors, "email already exists");
    }
  }

  if (count($errors) == 0) {
    $password = $password_1;

    $query = "INSERT INTO admin_info (admin_name, admin_email, admin_password)
          VALUES('$username', '$email', '$password')";
    mysqli_query($db, $query);
    $_SESSION['admin_name'] = $username;
    $_SESSION['admin_email'] = $email;

    $_SESSION['success'] = "You are now logged in";
    header('location: ./admin/');
  }
}






if (isset($_POST['login_admin'])) {
  $admin_username = mysqli_real_escape_string($db, $_POST['admin_username']);
  $password = mysqli_real_escape_string($db, $_POST['password']);

  if (empty($admin_username)) {
    array_push($errors, "Username is required");
  }
  if (empty($password)) {
    array_push($errors, "Password is required");
  }

  if (count($errors) == 0) {
    $query = "SELECT * FROM admin_info WHERE admin_email='$admin_username' AND admin_password='$password'";
    $results = mysqli_query($db, $query);
    if (mysqli_num_rows($results) == 1) {
       $_SESSION['admin_email'] = $email;
      $_SESSION['admin_name'] = $admin_username;
      $_SESSION['success'] = "You are now logged in";
      header('location: ./admin/');
    }else {
      array_push($errors, "Wrong username/password combination");
    }
  }
}


?>

