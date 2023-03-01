<?php
   header('Access-Control-Allow-Origin: *');
   header("Access-Control-Allow-Credentials: true");
   header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
   header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
   header("Content-Type: application/json; charset=utf-8");

   include "library/config.php";
   include "library/function_date.php";
   include "library/function_validation.php";
  
   $post = json_decode(file_get_contents('php://input'), true);
  
   $post = array('username'=>'daffa', 'password'=>'135a4e22cda0e0a68499e6d6e2a861aa', 'aksi'=>'edit', 'target'=>3, 'member'=>2);

if(member_valid($post['username'], $post['password'])){
  if($post['aksi'] == "profil"){
    $query = mysqli_query($mysqli, "SELECT * FROM follow WHERE id_member='$post[member]' AND member_target='$post[target]'");
    $cek_follow = mysqli_num_rows($query);

    if($query) $result = json_encode(array('success'=>true, 'result'=>$cek_follow));
    else $result = json_encode(array('success'=>false));
    echo $result;
  }

  elseif($post['aksi']=="edit"){
    $cek_follow = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM follow WHERE id_member='$post[member]' AND member_target='$post[target]'"));
    
    if($cek_follow == 0){
      $query = mysqli_query($mysqli, "INSERT INTO follow SET 
        id_member = '$post[member]',
        member_target = '$post[target]'
      ");

      if($query) mysqli_query($mysqli, "INSERT INTO notification SET 
        id_member = '$post[member]',
        message = 'mulai mengikuti Anda',
        member_target = '$post[target]',
        new = 1
      ");

      $follow = 1;
    }else{
      $query = mysqli_query($mysqli, "DELETE FROM follow WHERE id_member='$post[member]' AND member_target='$post[target]'");
      $follow = 0;
    }

    $jml_follow = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM follow WHERE member_target='$post[target]'"));
    
     if($query) $result = json_encode(array('success'=>true, 'result'=>$follow, 'follower'=>$jml_follow));
     else $result = json_encode(array('success'=>false));
     echo $result;
  }
}