<?php
date_default_timezone_set('Asia/Tehran');
if(isset($_GET['c']) && $_GET['c'] == 1) {
echo "<div class=\"headline\"><span class=\"f10 c5\">Error creating constant.php check chmod.</span></div><br>";
}
?>
<form action="process.php" method="post" id="dataform">
<div id="statLeft" class="top10Wrapper">
<h4 class="round small  top top10_offs">تنظیمات سرور بازی</h4>
<table cellpadding="1" cellspacing="1" id="top10_offs" class="top10 row_table_data">

    	<tr class="hover">
			<td>نام سرور:</td>
			<td><input type="text" dir="ltr" class="text" name="servername" id="servername" value="TravianX"></td>
		</tr>
        <tr class="hover">
			<td>سرعت سرور:</td>
			<td><input name="speed" dir="ltr" class="text" type="text" id="speed" value="1"></td>
		</tr>
    	<tr class="hover">
			<td>سرعت حرکت لشکریان:</td>
			<td><input type="text" dir="ltr" class="text" name="incspeed" id="incspeed" value="2"></td>
		</tr>
    	<tr class="hover">
			<td>گنجایش نقشه:</td>
			<td><select name="wmax" dir="rtl" class="text">
		<option value="100" selected="selected">100x100</option>
        <option value="250">250x250</option>
        <option value="350">350x350</option>
        <option value="400">400x400</option></select></td>
		</tr>
    	<tr class="hover">
			<td>صفحه اصلی:</td>
			<td><input name="homepage" dir="ltr" class="text" type="text" id="homepage" value="http://<?php echo $_SERVER['HTTP_HOST']; ?>/"></td>
		</tr>
    	<tr class="hover">
			<td>زبان:</td>
			<td><select name="lang" dir="rtl" class="text">
		<option value="en">انگلیسی</option><option value="fa" selected="selected">پارسی</option></select></td>
		</tr>
    	<tr class="hover">
			<td>مدت زمان حمایت:</td>
			<td>
            <select name="beginner" dir="rtl" class="text" id="autodeltime">
                  <option value="3600" selected="selected">1 ساعت</option>
                  <option value="10800">3 ساعت</option>
                  <option value="21600">6 ساعت</option>
                  <option value="43200">12 ساعت</option>
                  <option value="86400">1 روز</option>
                  <option value="172800">2 روز</option>
                  <option value="259200">3 روز</option>
			</select>
          </td>
		</tr>
    	<tr class="hover">
			<td>مدت اکانت پلاس:</td>
			<td><select name="plus_time" dir="rtl" class="text">
	  <option value="43200">12 ساعت</option>
	  <option value="86400">1 روز</option>
	  <option value="172800">2 روز</option>
	  <option value="259200">3 روز</option>
	  <option value="345600">4 روز</option>
	  <option value="432000">5 روز</option>
	  <option value="518400">6 روز</option>
	  <option value="604800" selected="selected">7 روز</option></select></td>
		</tr>
    	<tr class="hover">
			<td>مدت +25% تولید:</td>
			<td><select name="plus_production" dir="rtl" class="text">
	  <option value="43200">12 ساعت</option>
	  <option value="86400">1 روز</option>
	  <option value="172800">2 روز</option>
	  <option value="259200">3 روز</option>
	  <option value="345600">4 روز</option>
	  <option value="432000">5 روز</option>
	  <option value="518400">6 روز</option>
	  <option value="604800" selected="selected">7 روز</option></select></td>
		</tr>
        
        <tr class="hover">
			<td>مدت حراج جنس:</td>
			<td><select name="auction_time" dir="rtl" class="text">
      <option value="10800" selected="selected">3 ساعت</option>
	  <option value="21600">6 ساعت</option>
	  <option value="43200">12 ساعت</option>
	  <option value="86400">24 ساعت</option>
      </select></td>
		</tr>
    	<tr class="hover">
			<td>Turn Threshold:</td>
			<td><input type="text" dir="ltr" class="text" name="ts_threshold" id="ts_threshold" value="30"></td>
		</tr>
    	<tr class="hover">
			<td>انبار بزرگ:</td>
			<td><select name="great_wks" dir="rtl" class="text">
      <option value="false">غیر فعال</option>
      <option value="true" selected="selected">فعال</option></select></td>
		</tr>
    	<tr class="hover">
			<td>آمار شگفتی جهان:</td>
			<td><select name="ww" dir="rtl" class="text">
      <option value="0">غیر فعال</option>
      <option value="1" selected="selected">فعال</option></select></td>
		</tr>

</table>
<h4 class="round small spacer top top10_defs">تنظیمات دیتابیس</h4>
<table cellpadding="1" cellspacing="1" id="top10_defs" class="top10 row_table_data">
    	<tr class="hover">
			<td>Hostname:</td>
			<td><input name="sserver" dir="rtl" class="text" type="text" id="sserver" value="localhost"></td>
		</tr>
    	<tr class="hover">
			<td>Username:</td>
			<td><input name="suser" dir="rtl" class="text" type="text" id="suser" value=""></td>
		</tr>
    	<tr class="hover">
			<td>Password:</td>
			<td><input type="text" dir="rtl" class="text" name="spass" id="spass"></td>
		</tr>
    	<tr class="hover">
			<td>DB name:</td>
			<td><input type="text" dir="rtl" class="text" name="sdb" id="sdb"></td>
		</tr>
    	<tr class="hover">
			<td>Prefix:</td>
			<td><input type="text" dir="rtl" class="text" name="prefix" id="prefix" value="s1_"></td>
		</tr>
    	<tr class="hover">
			<td>Type:</td>
			<td><select name="connectt" dir="rtl" class="text">
	  <option value="0" selected="selected">MYSQL</option>
	  <option value="1" disabled="disabled">MYSQLi</option>
	</select></td>
		</tr>
        <tr class="empty"><td></td><td></td></tr>
    	<tr class="hover">
			<td>نام مدیر:</td>
			<td><input type="text" dir="rtl" class="text" name="aname" id="aname"></td>
		</tr>
    	<tr class="hover">
			<td>ایمیل مدیر:</td>
			<td><input name="aemail" dir="rtl" class="text" type="text" id="aemail"></td>
		</tr>
    	<tr class="hover">
			<td>نمایش مدیر در آمار:</td>
			<td><select name="admin_rank" dir="rtl" class="text">
	  <option value="false">خیر</option>
	  <option value="true" selected="selected">بله</option></select></td>
		</tr>        
        
        
</table>
</div>
<div id="statRight" class="top10Wrapper">
<h4 class="round small  top top10_climbers">تنظیمات خبرها</h4>
<table cellpadding="1" cellspacing="1" id="top10_climbers" class="top10 row_table_data">
    	<tr class="hover">
			<td>جعبه خبر 1:</td>
			<td><select name="box1" dir="rtl" class="text">
	  <option value="1">فعال</option>
	  <option value="0" selected="selected">غیر فعال</option></select></td>
		</tr>
    	<tr class="hover">
			<td>جعبه خبر 2:</td>
			<td><select name="box2" dir="rtl" class="text">
	  <option value="1">فعال</option>
	  <option value="0" selected="selected">غیر فعال</option></select></td>
		</tr>
    	<tr class="hover">
			<td>جعبه خبر 3:</td>
			<td><select name="box3" dir="rtl" class="text">
	  <option value="1">فعال</option>
	  <option value="0" selected="selected">غیر فعال</option></select></td>
		</tr>
<tr class="empty"><td></td><td></td></tr>
    	<tr class="hover">
			<td>Log Building:</td>
			<td><select name="log_build" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log Tech:</td>
			<td><select name="log_tech" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log Login:</td>
			<td><select name="log_login" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log Gold:</td>
			<td><select name="log_gold_fin" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log Admin:</td>
			<td><select name="log_admin" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log War:</td>
			<td><select name="log_war" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log Market:</td>
			<td><select name="log_market" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Log Illegal:</td>
			<td><select name="log_illegal" dir="rtl" class="text">
	  <option value="0">No</option>
	  <option value="1" selected="selected">Yes</option></select></td>
		</tr>
<tr class="empty"><td></td><td></td></tr>
</table>
<h4 class="round small spacer top top10_raiders">تنظیمات پیشرفته</h4>
<table cellpadding="1" cellspacing="1" id="top10_raiders" class="top10 row_table_data">
    	<tr class="hover">
			<td>انجام وظایف:</td>
			<td><select name="quest" dir="rtl" class="text">
	  <option value="0">غیر فعال</option>
	  <option value="1" selected="selected">فعال</option></select></td>
		</tr>
    	<tr class="hover">
			<td>لینک فعال سازی:</td>
			<td><select name="activate" dir="rtl" class="text">
	  <option value="0" selected="selected">غیر فعال</option>
	  <option value="1">فعال</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Limit Mailbox:</td>
			<td><select name="limit_mailbox" dir="rtl" class="text">
	  <option value="false">غیر فعال</option>
	  <option value="true" selected="selected">فعال</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Max mails:</td>
			<td><input name="max_mails" dir="rtl" class="text" type="number" id="max_mails" value="30" size="15"></td>
		</tr>
    	<tr class="hover">
			<td>سطح ساختمان اصلی برای تخریب ساختمان ها:</td>
			<td><select name="demolish" dir="rtl" class="text">
	  <option value="5">5</option>
	  <option value="10" selected="selected">10</option>
	  <option value="15">15</option>
	  <option value="20">20</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Village Expand:</td>
			<td><select name="village_expand" dir="rtl" class="text">
	  <option value="1" selected="selected">Slow</option>
	  <option value="0">Fast</option></select></td>
		</tr>
    	<tr class="hover">
			<td>Error Reporting:</td>
			<td><select name="error" dir="rtl" class="text">
	  <option value="error_reporting (E_ALL ^ E_NOTICE);" selected="selected">بله</option>
	  <option value="error_reporting (0); ">خیر</option></select></td>
		</tr>

</table><br />

<h4 class="round small  top top10_offs">تنظیمات زمان شروع بازی</h4>
<table cellpadding="1" cellspacing="1" id="top10_raiders" class="top10 row_table_data">
    	<tr class="hover">
			<td>تاریخ شروع:</td>
			<td><input name="start_date" style="text-align:center;" class="text" type="text" id="start_date" value="<?php echo date('m/d/Y'); ?>" size="20"><br />
            <font class="none" size="1" face="Trebuchet MS">month / day / Year</font>
            </td>
		</tr>
    	<tr class="hover">
			<td>ساعت شروع:</td>
			<td><input name="start_time" style="text-align:center;" class="text" type="text" id="start_time" value="<?php echo date('H:i'); ?>" size="10"><br />
            <font class="none" size="1" face="Trebuchet MS">Hour : minute</font></td>
		</tr>

</table>

<div align="left">
<button type="submit" value="Upgrade level" class="build">
<div class="button-container"><div class="button-position"><div class="btl"><div class="btr"><div class="btc"></div></div></div>
<div class="bml"><div class="bmr"><div class="bmc"></div></div></div><div class="bbl"><div class="bbr"><div class="bbc"></div></div></div></div><div class="button-contents">تایید</div></div></button></div>
	<input type="hidden" name="subconst" value="1">
	</form>
</div>