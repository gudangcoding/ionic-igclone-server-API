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
	
   //$post = array('username'=>'daffa', 'password'=>'135a4e22cda0e0a68499e6d6e2a861aa',  'member'=>2);

if(member_valid($post['username'], $post['password'])){
   $data = array();
   $query = mysqli_query($mysqli,  "SELECT * FROM notification LEFT JOIN member ON notification.id_member=member.id_member WHERE member_target='$post[member]' ORDER BY notification.id_notification DESC");

   while($row = mysqli_fetch_array($query)){
	  $data[] = array(
        'id' => $row['id_notification'],	        
        'id_member' => $row['id_member'],
        'nama'	=> $row['name'],
        'notifikasi' => $row['message'],
        'baru' => $row['new'],
        'target' => $row['member_target'],
        'idpost' => $row['id_post'],
        'tanggal' => tgl_indonesia($row['created_at'])
     );

	 mysqli_query($mysqli, "UPDATE notification SET new=0 WHERE id_notification='$row[id_notification]'");
   }
   
   if($query) $result = json_encode(array('success'=>true, 'result'=>$data));
   else $result = json_encode(array('success'=>false));
   echo $result;
}
?>