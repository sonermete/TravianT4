<?php

    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

if($golds['b1'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b1 = '0' where `username`='".$session->username."'") or die(mysql_error());
}

if($golds['b2'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b2 = '0' where `username`='".$session->username."'") or die(mysql_error());
}
if($golds['b3'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b3 = '0' where `username`='".$session->username."'") or die(mysql_error());
}

if($golds['b4'] <= time()) {
mysql_query("UPDATE ".TB_PREFIX."users set b4 = '0' where `username`='".$session->username."'") or die(mysql_error());
}

include("Templates/Plus/pmenu.tpl");
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

        $today = date("mdHi");

if (mysql_num_rows($MyGold)) {
	if($session->gold == 0) {
		echo "<div class=\"boxes boxesColor gray goldBalance\"><div class=\"boxes-tl\"></div><div class=\"boxes-tr\"></div><div class=\"boxes-tc\"></div><div class=\"boxes-ml\"></div><div class=\"boxes-mr\"></div><div class=\"boxes-mc\"></div><div class=\"boxes-bl\"></div><div class=\"boxes-br\"></div><div class=\"boxes-bc\"></div><div class=\"boxes-contents\">در حال حاضر شما <b>هیچ</b> سکه ای ندارید</div></div>";
	} else {
		echo "<div class=\"boxes boxesColor gray goldBalance\"><div class=\"boxes-tl\"></div><div class=\"boxes-tr\"></div><div class=\"boxes-tc\"></div><div class=\"boxes-ml\"></div><div class=\"boxes-mr\"></div><div class=\"boxes-mc\"></div><div class=\"boxes-bl\"></div><div class=\"boxes-br\"></div><div class=\"boxes-bc\"></div><div class=\"boxes-contents\">در حال حاضر شما <b>$session->gold</b> عدد سکۀ طلای تراوین داريد.</div></div>";
	}
}

if($_GET['action']==FinishBuilding){
	$golds = $database->getUserArray($session->username, 0);

    $MyVilId = mysql_query("SELECT * FROM ".TB_PREFIX."bdata WHERE `wid`='".$village->wid."'") or die(mysql_error());
    $uuVilid = mysql_fetch_array($MyVilId);
    $MyVilId2 = mysql_query("SELECT * FROM ".TB_PREFIX."research WHERE `vref`='".$village->wid."'") or die(mysql_error());
    $uuVilid2 = mysql_fetch_array($MyVilId2);
	
    $buildnum = mysql_num_rows($MyVilId);
    $resnum = mysql_num_rows($MyVilId2);
    
    $goldlog = mysql_query("SELECT * FROM ".TB_PREFIX."gold_fin_log") or die(mysql_error());

if($session->gold >= 2) {

if (mysql_num_rows($MyVilId) || mysql_num_rows($MyVilId2)) {

mysql_query("UPDATE ".TB_PREFIX."bdata set timestamp = '1' where wid = ".$village->wid." AND type != '25' OR type != '26'") or die(mysql_error());
mysql_query("UPDATE ".TB_PREFIX."research set timestamp = '1' where vref = '".$village->wid."'") or die(mysql_error());



$done1 = "ساخت <b>".$buildnum."</b> ساختمان و <b>".$resnum."</b> تحقیق به پایان رسید.";
    mysql_query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-2)." where `username`='".$session->username."'") or die(mysql_error());
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Finish construction and research with gold')") or die(mysql_error());

} else {
    mysql_query("INSERT INTO ".TB_PREFIX."gold_fin_log VALUES ('".(mysql_num_rows($goldlog)+1)."', '".$village->wid."', 'Failed construction and research with gold')") or die(mysql_error());

}
} else {
        $done1 = "سکۀ طلای کافی ندارید";
}

}
 ?>

<h4 class="spacer">پلاس</h4>

<?php echo $done1; ?>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
	<thead>

		<tr>
			<td>توضیح</td>
			<td>مدت زمان</td>
			<td>سکۀ طلای تراوین</td>
			<td>عمل</td>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td class="desc">
				اکانت <b><font color="#71D000">پلاس</font></b><br><span class="run">
<?php 
$datetimep=$golds['plus'];
$datetime1=$golds['b1'];
$datetime2=$golds['b2'];
$datetime3=$golds['b3'];
$datetime4=$golds['b4'];
$datetimeap=$golds['ap'];
$datetimedp=$golds['dp'];
//Retrieve the current date/time  
$date2=strtotime("NOW"); 


	if ($datetimep == 0) {
		print "";
	}elseif ($datetimep <= $date2) {
		mysql_query("UPDATE ".TB_PREFIX."users set plus = '0' where `username`='".$session->username."'") or die(mysql_error());
 	} else {
   
$holdtotmin=(($datetimep-$date2)/60);
$holdtothr=(($datetimep-$date2)/3600); 
$holdtotday=round(($datetimep-$date2)/86400, 1);
$holdhr=intval($holdtothr-($holdtotday*24));	
$holdmr=intval($holdtotmin-(($holdhr*60)+($holdtotday*1440))); 
    
    echo "هنوز <b>".$holdtotday. "</b> روز تا ".date('H:i',$golds['plus'])."";
 }
?>
                </span>			</td>
			<td class="dur"><?php if(PLUS_TIME >= 86400){
			echo ''.(PLUS_TIME/86400).' روز';
			} else if(PLUS_TIME < 86400){
			echo ''.(PLUS_TIME/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">10</td>
			<td class="act">
<?php
    $MyGold = mysql_query("SELECT * FROM ".TB_PREFIX."users WHERE `username`='".$session->username."'") or die(mysql_error());
    $golds = mysql_fetch_array($MyGold);

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 9 && $datetimep < $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=8'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";
}elseif
	($golds['gold'] > 9 && $datetimep > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=8'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">تمدید</div></div></button>";

} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">طلا کم است</div></div></button>";
    }
}
 ?>            
            </td>
		</tr>
  </tbody>
</table>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td>توضیح</td>
			<td>مدت زمان</td>
			<td>سکۀ طلای تراوین</td>
			<td>عمل</td>
		</tr>
	</thead>
	<tbody>
				<tr>
			<td class="desc">
				+<b>25</b>% <img class="r1" src="img/x.gif" alt="چوب"> تولید: چوب<br>
				<span class="run">
<?php

$tl_b1=$golds['b1'];
 if ($tl_b1 < $date2) {
     print "";
 } else {
$holdtotmin1=(($tl_b1-$date2)/60);
$holdtothr1=(($tl_b1-$date2)/3600); 
$holdtotday1=round(($tl_b1-$date2)/86400, 1);
$holdhr1=intval($holdtothr1-($holdtotday1*24));	
$holdmr1=intval($holdtotmin1-(($holdhr1*60)+($holdtotday1*1440))); 
}

 if ($tl_b1 < $date2) {
     print " ";
 } else {		
echo "هنوز <b>".$holdtotday1. "</b> روز تا ".date('H:i',$golds['b1'])."";

 }
?>               
                
                </span>			</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' روز';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b1 < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=9'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";
}elseif
	($golds['gold'] > 4 && $datetime1 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=9'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">تمدید</div></div></button>";
} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">طلا کم است</div></div></button>";
    }
}
?>            
            </td>
		</tr>
			<tr>
			<td class="desc">
				+<b>25</b>% <img class="r2" src="img/x.gif" alt="خشت"> تولید: خشت<br>
				<span class="run">
                <?php

$tl_b2=$golds['b2'];
 if ($tl_b2 < $date2) {
     print " ";
 } else {
$holdtotmin2=(($tl_b2-$date2)/60);
$holdtothr2=(($tl_b2-$date2)/3600); 
$holdtotday2=round(($tl_b2-$date2)/86400, 1);
$holdhr2=intval($holdtothr2-($holdtotday2*24));	
$holdmr2=intval($holdtotmin2-(($holdhr2*60)+($holdtotday2*1440))); 
}

 if ($tl_b2 < $date2) {
     print " ";
 } else {		

echo "هنوز <b>".$holdtotday2. "</b> روز تا ".date('H:i',$golds['b2'])."";

 }
?>
                
                </span>			</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' روز';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b2 < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=10'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";
}elseif
	($golds['gold'] > 4 && $tl_b2 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=10'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">تمدید</div></div></button>";
} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">طلا کم است</div></div></button>";
    }
    }
 ?>
            
            </td>
		</tr>
			<tr>
			<td class="desc">
				+<b>25</b>% <img class="r3" src="img/x.gif" alt="آهن"> تولید: آهن<br>
				<span class="run">
<?php

$tl_b3=$golds['b3'];
 if ($tl_b3 < $date2) {
     print " ";
 } else {
$holdtotmin3=(($tl_b3-$date2)/60);
$holdtothr3=(($tl_b3-$date2)/3600); 
$holdtotday3=round(($tl_b3-$date2)/86400, 1);
$holdhr3=intval($holdtothr3-($holdtotday3*24));	
$holdmr3=intval($holdtotmin3-(($holdhr3*60)+($holdtotday3*1440))); 
}

 if ($tl_b3 < $date2) {
     print " ";
 } else {		
echo "هنوز <b>".$holdtotday3. "</b> روز تا ".date('H:i',$golds['b3'])."";

 }
?>
                
                </span>			</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' روز';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b3  < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=11'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";
}elseif
	($golds['gold'] > 4 && $tl_b3 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=11'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">تمدید</div></div></button>";
} else  {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">طلا کم است</div></div></button>";
} }
 ?>            
            </td>
		</tr>
			<tr>
			<td class="desc">
				+<b>25</b>% <img class="r4" src="img/x.gif" alt="گندم"> تولید: گندم<br>
<?php

$tl_b4=$golds['b4'];
 if ($tl_b4 < $date2) {
     print " ";
 } else {
$holdtotmin4=(($tl_b4-$date2)/60);
$holdtothr4=(($tl_b4-$date2)/3600); 
$holdtotday4=round(($tl_b4-$date2)/86400, 1);
$holdhr4=intval($holdtothr4-($holdtotday4*24));	
$holdmr4=intval($holdtotmin4-(($holdhr4*60)+($holdtotday4*1440))); 
}

 if ($tl_b4 < $date2) {
     print " ";
 } else {		

echo "هنوز <b>".$holdtotday4. "</b> روز تا ".date('H:i',$golds['b4'])."";
 }
?>
		</td>
			<td class="dur"><?php if(PLUS_PRODUCTION >= 86400){
			echo ''.(PLUS_PRODUCTION/86400).' روز';
			} else if(PLUS_PRODUCTION < 86400){
			echo ''.(PLUS_PRODUCTION/3600).' ساعت';
			} ?></td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">5</td>
			<td class="act">
<?php

if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 4 && $tl_b4 < $date2) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=12'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";
}elseif
	($golds['gold'] > 4 && $tl_b4 > $date2) {
	echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=12'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">تمدید</div></div></button>";
} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">طلا کم است</div></div></button>";
} }
?>
            
            </td>
		</tr>
  </tbody>
</table>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
	<thead>
		<tr>
			<td>توضیح</td>
			<td>مدت زمان</td>
			<td>سکۀ طلای تراوین</td>
			<td>عمل</td>
		</tr>
	</thead>
	<tbody>
		
		<tr>
			<td class="desc">تمامی ساخت ها و تحقیق های در حال انجام در این دهکده را 
بصورت فوری تمام کن (در مورد اقامتگاه و قصر کار نمی کند).</td>
			<td class="dur">فوری</td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">2</td>
			<td class="act">
<?php
if (mysql_num_rows($MyGold)) {
	if($golds['gold'] > 1) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=3&action=FinishBuilding'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";

} else {
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";
	}
}
 ?>
			</td>
		</tr>
			<tr>
			<td class="desc">تعدیل منابع بصورت 1:1</td>
			<td class="dur">فوری</td>
			<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">3</td>
			<td class="act link">
            <?php
            if($building->getTypeLevel(17)){ ?>
            <a class="arrow" href="build.php?gid=17&amp;t=3">ورود به بازار</a>
            <?php }else{ ?>
            <span class="none"><center>بازار بنا کن</center></span>
            <?php } ?>
			</td>
		</tr>
        <tr>
				<td class="desc">مبادلۀ سکۀ طلای تراوین طلا و سکۀ نقرۀ تراوین</td>
				<td class="dur">فوری</td>
				<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین"></td>
				<td class="act arrow" style="text-align: right"><a class="arrow" href="plus.php?id=6">مبادله</a></td>
			</tr>
        </tbody>
</table>
<h4 class="spacer">کلوپ طلایی تراوین</h4>
<table class="plusFunctions" cellpadding="1" cellspacing="1">
		<thead>
			<tr>
				<td>توضیح</td>
				<td>مدت زمان</td>
				<td>سکۀ طلای تراوین</td>
				<td>عمل</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="desc">
					<a name="goldclub"></a>
					<b>کلوپ طلایی</b>

<div class="run">تا پایان بازی فعال می باشد.</div>
				</td>
				<td class="dur">
					تا پایان بازی فعال می باشد؛ امکانات اکانت پلاس و افزایش تولید 
جز امکانات کلوپ طلایی نمی باشد.
				</td>
				<td class="cost"><img src="img/x.gif" class="gold" alt="سکۀ طلای تراوین">100</td>
				<td class="act">
<?php
if($session->gold >= 100){
	if($golds['goldclub'] == 0) {
		echo "<button type=\"button\" value=\"فعال سازی\" onclick=\"window.location.href = 'plus.php?id=15'; return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال سازی</div></div></button>";

	} else {
		echo "<button type=\"button\" value=\"فعال شده\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">فعال شده</div></div></button>";
	}
}else{
	echo "<button type=\"button\" value=\"فعال سازی\" class=\" disabled\" onclick=\"(new Event(event)).stop(); return false;\" onfocus=\"$$('button', 'input[type!=hidden]', 'select')[0].focus(); (new Event(event)).stop(); return false;\"><div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div><div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div></div><div class=\"button-contents\">طلا کم است</div></div></button>";
}
                ?></td>
			</tr>



	</tbody>
</table>
<div class="clear">&nbsp;</div>