<h1 class="titleInHeader">سفارت <span class="level">سطح <?php echo $village->resarray['f'.$id]; ?></span></h1>
<div id="build" class="gid18">
<div class="build_desc">
<a href="#" onClick="return Travian.Game.iPopup(18,4);" class="build_logo">
	<img class="building big white g18" src="img/x.gif" alt="سفارت" title="سفارت" />
</a>
سفارت محلی برای مذاکرۀ دیپلمات ها است. هر قدر سطح آن بالا باشد قدرت پادشاه بیشتر خواهد بود.</div>

<?php
include("upgrade.tpl");
if($village->resarray['f'.$id] >= 3 && $session->alliance == 0) {
include("18_create.tpl");
}
if($session->alliance != 0) {
echo "
<table cellpadding=\"1\" cellspacing=\"1\" id=\"ally_info\" class=\"transparent\"><div class=\"clear\"></div>
        <h4 class=\"round\">اتحاد</h4>
	<tbody><tr>
		<th>برچسب:</th>
		<td>".$alliance->allianceArray['tag']."</td>
	</tr>
	<tr>
		<th>نام:</th>
		<td>".$alliance->allianceArray['name']."</td>

	</tr>
	<tr>
		<td colspan=\"2\"><a href=\"allianz.php\" class=\"arrow\">نمایش اتحاد</a></td>
	</tr></tbody>
	</table>";
    }
    else {
    ?>
    <div class="clear"></div>
    <h4 class="round">پیوستن به اتحاد</h4>
<table cellpadding="1" cellspacing="1" id="join" class="transparent">
<form method="post" action="build.php">
<input type="hidden" name="id" value="<?php echo $id ?>">
<input type="hidden" name="a" value="2">

<thead></thead>
<tbody><tr>
	<?php
    if($alliance->gotInvite) {
    	foreach($alliance->inviteArray as $invite) {
        	 echo "
             <div>
             <button type=\"button\" value=\"npc\" class=\"icon\" onclick=\"window.location.href = 'build.php?id=".$id."&a=2&d=".$invite['id']."'; return false;\"><img class=\"del\" src=\"img/x.gif\" alt=\"انصراف\" title=\"انصراف\" /></button>
        <a href=\"allianz.php?aid=".$invite['alliance']."\">&nbsp;".$database->getAllianceName($invite['alliance'])."</a>
         <button type=\"button\" value=\"Upgrade level\" class=\"build\" onclick=\"window.location.href = 'build.php?id=".$id."&a=3&d=".$invite['id']."'; return false;\">
<div class=\"button-container\"><div class=\"button-position\"><div class=\"btl\"><div class=\"btr\"><div class=\"btc\"></div></div></div>
<div class=\"bml\"><div class=\"bmr\"><div class=\"bmc\"></div></div></div><div class=\"bbl\"><div class=\"bbr\"><div class=\"bbc\"></div></div></div>
</div><div class=\"button-contents\">قبول کن</div></div></button></div>";
        }
        }
    else {
		echo "<td colspan=\"3\" class=\"noData\">هیچ دعوتنامه ای ارسال نشده است.</td>";
        }
        ?>
	</tr></tbody></table>
    <?php 
        if($alliance->gotInvite) {
        echo "<p class=\"error2\"></p>";
        } 
    }
?></form><div class="clear"></div><br />
</div>
