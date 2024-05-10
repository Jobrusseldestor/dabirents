<?php
  session_start();
  $con = mysqli_connect("localhost", "root", "", "dabirents");
  if ($con->connect_error) {
    die("Connection failed: " . $con->connect_error);
  }
  
  define('SERVER_PATH', $_SERVER['DOCUMENT_ROOT'] . '/');
  const SITE_PATH = 'http://localhost/dabirents' . '/';
  
  
  const BOOK_IMAGE_SERVER_PATH = SERVER_PATH . '/Img/dress/';
  const BOOK_IMAGE_SITE_PATH = SITE_PATH . '/Img/dress/';