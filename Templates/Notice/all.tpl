﻿<?php
$noticeClass = array("گزارش جاسوسی","پیروزی در حمله بدون تلفات.","پیروزی در حمله با تلفات.","شکست در حمله با تلفات.","پیروزی در دفاع بدون تلفات.","پیروزی در دفاع با تلفات.","شکست در دفاع با تلفات.","شکست در دفاع بدون تلفات","نیروی کمکی","گزارش ماجراجویی.","تاجران بیشتر چوب مبادله کردند.","تاجران بیشتر خشت مبادله کردند.","تاجران بیشتر آهن مبادله کردند.","تاجران بیشتر گندم مبادله کردند.","","حمله به نیروی کمکی");
$prefix = "".TB_PREFIX."ndata";
$sql = mysql_query("SELECT * FROM $prefix WHERE uid = $session->uid and archive = 0 ORDER BY time DESC");
$query = mysql_num_rows($sql); // دریافت تعداد کوئری ها از دیتابیس

if (isset($_GET['page'])) { // دریافت شماره صفحه
    $page = preg_replace('#[^0-9]#i', '', $_GET['page']); // فیلتر کردن همه چیز به جز اعداد
} else {
    $page = 1;
} 

$itemsPerPage = 10; //تعداد آیتم های قابل نمایش در هر صفحه
$lastPage = ceil($query / $itemsPerPage); // دریافت مقدار آخرین صفحه

if ($page < 1) {
    $page = 1;
} else if ($page > $lastPage) {
    $page = $lastPage;
} 

$centerPages = "";
$sub1 = $page - 1;
$sub2 = $page - 2;
$sub3 = $page - 3;
$add1 = $page + 1;
$add2 = $page + 2;
$add3 = $page + 3;

if ($page <= 1 && $lastPage <= 1) {
    $centerPages .= '<span class="number currentPage">1</span>';
	
}elseif ($page == 1 && $lastPage == 2) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=2">2</a>';
	
}elseif ($page == 1 && $lastPage == 3) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=2">2</a> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=3">3</a>';
	
}elseif ($page == 1) {
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add2 . '">' . $add2 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';
	
} else if ($page == $lastPage && $lastPage == 2) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage && $lastPage == 3) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=2">2</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == $lastPage) {
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub2 . '">' . $sub2 . '</a> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span>';
	
} else if ($page == ($lastPage - 1) && $lastPage == 3) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 2 && $page < ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';
	
}else if ($page == ($lastPage - 1)) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=1">1</a> ... ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';

} else if ($page > 1 && $page < $lastPage && $lastPage == 3) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a>';
    
} else if ($page > 1 && $page < $lastPage) {
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $sub1 . '">' . $sub1 . '</a> ';
    $centerPages .= '<span class="number currentPage">' . $page . '</span> ';
    $centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $add1 . '">' . $add1 . '</a> ... ';
	$centerPages .= '<a class="number" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '">' . $lastPage . '</a>';
}




$limit = 'LIMIT ' .($page - 1) * $itemsPerPage .',' .$itemsPerPage; 
$sql2 = mysql_query("SELECT * FROM $prefix WHERE uid = $session->uid and archive = 0 ORDER BY time DESC $limit");
$paginationDisplay = "";
$nextPage = $_GET['page'] + 1;
$previous = $_GET['page'] - 1;

if ($page == "1" && $lastPage == "1"){
$paginationDisplay .=  '<img alt="صفحه اول" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="صفحه قبل" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';

}elseif ($lastPage == 0){
$paginationDisplay .=  '<img alt="صفحه اول" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="صفحه قبل" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';

}elseif ($page == "1" && $lastPage != "1"){
$paginationDisplay .=  '<img alt="صفحه اول" src="img/x.gif" class="first disabled"> ';
$paginationDisplay .=  '<img alt="صفحه قبل" src="img/x.gif" class="previous disabled">';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="' . $_SERVER['PHP_SELF'] . '?page=2"><img alt="صفحه بعد" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="' . $_SERVER['PHP_SELF'] . '?page=3"><img alt="صفحه آخر" src="img/x.gif"></a>';

}elseif ($page != "1" && $page != $lastPage){
$paginationDisplay .=  '<a class="first" href="' . $_SERVER['PHP_SELF'] . '?page=1"><img alt="صفحه اول" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="' . $_SERVER['PHP_SELF'] . '?page=' . $previous . '"><img alt="صفحه قبل" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<a class="next" href="' . $_SERVER['PHP_SELF'] . '?page=' . $nextPage . '"><img alt="صفحه بعد" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="last" href="' . $_SERVER['PHP_SELF'] . '?page=' . $lastPage . '"><img alt="صفحه آخر" src="img/x.gif"></a>';

}elseif ($page == $lastPage){
$paginationDisplay .=  '<a class="first" href="' . $_SERVER['PHP_SELF'] . '?page=1"><img alt="صفحه اول" src="img/x.gif"></a> ';
$paginationDisplay .=  '<a class="previous" href="' . $_SERVER['PHP_SELF'] . '?page=' . $previous . '"><img alt="صفحه قبل" src="img/x.gif"></a>';
$paginationDisplay .= $centerPages;
$paginationDisplay .=  '<img alt="صفحه بعد" src="img/x.gif" class="next disabled"> ';
$paginationDisplay .=  '<img alt="صفحه آخر" src="img/x.gif" class="last disabled">';
}


$outputList = '';
$namee = 1;
if($query == 0) {        
    $outputList .= "<td colspan=\"4\" class=\"none\">هیچ گزارش جدیدی موجود نیست.</td>";
}else{
while($row = mysql_fetch_array($sql2)){ 
    $id = $row["id"];
    $toWref = $row["toWref"];
    $topic = $row["topic"];
    $ntype = $row["ntype"];
    $data = $row["data"];
    $time = $row["time"];
    $viewed = $row["viewed"];
    $archive = $row["archive"];
	$type = (isset($_GET['t']) && $_GET['t'] == 5)? $archive : $ntype;
    $dataarray = explode(",",$data);
    
    
    $outputList .= "<tr><td class=\"sel\"><input class=\"check\" type=\"checkbox\" name=\"n".$namee."\" value=\"".$id."\" /></td><td class=\"sub\">";
    
    if($type==9){
    	$outputList .= "<img src=\"img/x.gif\" class=\"iReport iReport21\" alt=\"".$noticeClass[$ntype]."\" title=\"".$noticeClass[$ntype]."\" /> <div>";
    }else{
    	$outputList .= "<img src=\"img/x.gif\" class=\"iReport iReport$type\" alt=\"".$noticeClass[$type]."\" title=\"".$noticeClass[$type]."\" /> <div>";
    }

if($type==1 || $type==2 || $type==5 || $type==6 || $type==7){
    if ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28] == 0) {
    $style = "empty";
	} elseif ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28] != $dataarray[29]) {
    $style = "half";
    } else {
    $style = "full";
    }
    $carry = ($dataarray[25]+$dataarray[26]+$dataarray[27]+$dataarray[28])."/".$dataarray[29];
    
    $outputList .= "<div class=\"reportInfoIcon\"><img title=\"".$carry."\" src=\"img/x.gif\" class=\"reportInfo carry ".$style."\"></div>";
    
}elseif($type==9){
$btype = $dataarray[1];
$type = $dataarray[2];
include "Templates/Auction/alt.tpl";
$typeArray = array("","helmet","body","leftHand","rightHand","shoes","horse","bandage25","bandage33","cage","scroll","ointment","bucketOfWater","bookOfWisdom","lawTables","artWork");
	if($dataarray[1]!='dead'){
    	if($dataarray[1]!=''){
			$outputList .= "<div class=\"reportInfoIcon\"><img title=\"".$name." (".$dataarray[3]."x)\" src=\"img/x.gif\" class=\"reportInfo itemCategory itemCategory_".$typeArray[$dataarray[1]]."\"></div>";
        }
    }else{
		$outputList .= "<div class=\"reportInfoIcon\"><img src=\"img/x.gif\" class=\"reportInfo adventureDifficulty0\" title=\"قهرمان کشته شد\"></div>";
	}
}
    $outputList .= "<a href=\"berichte.php?id=".$id."\">".$topic." </a> ";
    if($viewed == 0) { $outputList .= "(جدید)"; }
    $date = $generator->procMtime($time);
    $outputList .= "</div><div class=\"clear\"></div></td>
			<td class=\"dat\">".$date[0]." ".date('H:i',$time)."</td></tr>";
	$namee++;
}
 }


?>
<form method="post" action="berichte.php" name="msg">

	<table cellpadding="1" cellspacing="1" id="overview" class="row_table_data">
		<thead><tr><th colspan="2">موضوع:</th><th class="sent">فرستاده شده</th></tr></thead>
        <tbody>
   <?php 

    if(isset($_GET['s'])) {
    $s = $_GET['s'];
    }
    else {
    $s = 0;
    }
    
    print "$outputList";
    
    ?>

      
      
</tbody>
</table>

<div class="footer">
<?php if($session->plus) { ?>
			<div id="markAll">
			<input class="check" type="checkbox" id="sAll" onclick="
				$(this).up('form').getElements('input[type=checkbox]').each(function(element)
				{
					element.checked = this.checked;
				}, this);
			">
			<span><label for="sAll">انتخاب همه</label></span>
		</div>
<?php } ?>

	  <div class="paginator">
	  <?php echo $paginationDisplay; ?>
      </div>

    <div class="clear"></div>
</div>
<button name="delntc" type="submit" value="del" id="del" class="delete">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">حذف</div></div>
</button>
                    
<?php if($session->plus) { ?>
<button name="archive" type="submit" value="archive" id="archive" class="delete">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div><div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">آرشیو</div></div>
</button>
<?php } ?>
</form>