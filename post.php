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
   //$post = array('username'=>'daffa', 'password'=>'135a4e22cda0e0a68499e6d6e2a861aa', 'member'=>2, 'aksi'=>'single', 'idpost'=>1, 'start'=>0, 'limit'=>5, 'target'=>3, 'gambar'=>'', 'keterangan'=>'');

if(member_valid($post['username'], $post['password'])){
  if($post['aksi'] == "tampil"){
     $data = array();
     $query = mysqli_query($mysqli,  "SELECT * FROM post LEFT JOIN member ON post.id_member=member.id_member WHERE post.id_member='$post[member]' OR post.id_member IN (SELECT member_target FROM follow WHERE id_member='$post[member]') ORDER BY post.id_post DESC LIMIT $post[start],$post[limit]");
     
     while($row = mysqli_fetch_array($query)){
         $jml_like = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM post_like WHERE id_post='$row[id_post]' AND id_member='$post[member]'"));

         $jml_comment = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM comment WHERE id_post='$row[id_post]'"));

      $data[] = array(
          'id' => $row['id_post'],          
          'id_member' => $row['id_member'],
          'foto'  => $row['photo'],
          'nama'  => $row['name'],
          'post' => $row['post'],
          'gambar' => $row['image'],
          'suka' => $jml_like,
          'jml_komentar' => $jml_comment,
          'tanggal' => tgl_indonesia($row['created_at'])
      );
     }
     
     if($query) $result = json_encode(array('success'=>true, 'result'=>$data));
     else $result = json_encode(array('success'=>false));
     echo $result;
  }

  elseif($post['aksi'] == "single"){
     $data = array();
     $query = mysqli_query($mysqli,  "SELECT * FROM post LEFT JOIN member ON post.id_member=member.id_member WHERE post.id_post='$post[idpost]'");
     $row = mysqli_fetch_array($query);
         
       $jml_like = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM post_like WHERE id_post='$row[id_post]' AND id_member='$post[member]'"));

       $jml_comment = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM comment WHERE id_post='$row[id_post]'"));
    $data[] = array(
          'id' => $row['id_post'],          
          'id_member' => $row['id_member'],
          'foto'  => $row['photo'],
          'nama'  => $row['name'],
          'post' => $row['post'],
          'gambar' => $row['image'],
          'suka' => $jml_like,
          'jml_komentar' => $jml_comment,
          'tanggal' => tgl_indonesia($row['created_at'])
      );

     if($query) $result = json_encode(array('success'=>true, 'result'=>$data));
     else $result = json_encode(array('success'=>false));
     echo $result;
  }

  elseif($post['aksi'] == "profil"){ 
     $data = array();
     $query = mysqli_query($mysqli,  "SELECT * FROM post WHERE id_member='$post[target]' ORDER BY id_post DESC");
     while($row = mysqli_fetch_array($query)){
      $data[] = array(
          'id' => $row['id_post'],          
           'gambar' => $row['image']
        );
     }

     $profil = array();
     $member = mysqli_fetch_array(mysqli_query($mysqli, "SELECT * FROM member WHERE id_member='$post[target]'"));

     $jmlpost = mysqli_num_rows($query);
     $jmlfollow = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM follow WHERE id_member='$post[target]'"));
     $jmlfollower = mysqli_num_rows(mysqli_query($mysqli, "SELECT * FROM follow WHERE member_target='$post[target]'"));

     $profil[] = array(
        'foto'=>$member['photo'],
        'nama'=>$member['name'],
        'jmlpost'=>$jmlpost,
        'jmlfollow'=>$jmlfollow,
        'jmlfollower'=>$jmlfollower
     );

     if($query) $result = json_encode(array('success'=>true, 'profil'=>$profil, 'result'=>$data ));
     else $result = json_encode(array('success'=>false));
     echo $result;
  }

  elseif($post['aksi'] == "tambah"){
    $entry = base64_decode($post['gambar']);
    $image = imagecreatefromstring($entry);

    $tgl = date('Y-m-d_H-i-s');
    $directory = "images/post/post_".$tgl.".jpg"; 
    imagejpeg($image, $directory);
    imagedestroy($image);

    $query = mysqli_query($mysqli,  "INSERT INTO post SET
         id_member = '$post[member]',
         image = '$directory',
         post = '$post[keterangan]'
       ");
    $idpost = mysqli_insert_id($mysqli);

     if($query) $result = json_encode(array('success'=>true, 'idpost'=>$idpost));
     else $result = json_encode(array('success'=>false));
     echo $result;
  }
}