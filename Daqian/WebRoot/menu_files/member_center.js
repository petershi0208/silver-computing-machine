/*鼠标选中和单击时触发函数*/
function selected_Menu_Navigation(obj) {
	var members = "members";
	var myFinancial = "myFinancial";
	var myBorrowing = "myBorrowing";
	var SetUpThe = "SetUpThe";
	var Exit_s = "Exit";

	if (obj == members) {
		document.getElementById(obj + 1).className = "left_menu_width   left_menu_orangeBackgroundImg";
		document.getElementById(obj + 2).className = "small_icon_Wide_High_qualified   the_member_center_W";
		document.getElementById(obj + 3).className = "menu_fontSize_white";

		document.getElementById(myFinancial + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myFinancial + 2).className = "small_icon_Wide_High_qualified  myFinancial_B";
		document.getElementById(myFinancial + 3).className = "menu_fontSize";

		document.getElementById(myBorrowing + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myBorrowing + 2).className = "small_icon_Wide_High_qualified  myBorrowing_B";
		document.getElementById(myBorrowing + 3).className = "menu_fontSize";

		document.getElementById(SetUpThe + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(SetUpThe + 2).className = "small_icon_Wide_High_qualified  SetUpThe_B";
		document.getElementById(SetUpThe + 3).className = "menu_fontSize";

		document.getElementById(Exit_s + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(Exit_s + 2).className = "small_icon_Wide_High_qualified  Exit_B";
		document.getElementById(Exit_s + 3).className = "menu_fontSize";

	} else if (obj == myFinancial) {

		document.getElementById(obj + 1).className = "left_menu_width  left_menu_orangeBackgroundImg";
		document.getElementById(obj + 2).className = "small_icon_Wide_High_qualified   myFinancial_W";
		document.getElementById(obj + 3).className = "menu_fontSize_white";

		document.getElementById(members + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(members + 2).className = "small_icon_Wide_High_qualified  the_member_center_B";
		document.getElementById(members + 3).className = "menu_fontSize";

		document.getElementById(myBorrowing + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myBorrowing + 2).className = "small_icon_Wide_High_qualified  myBorrowing_B";
		document.getElementById(myBorrowing + 3).className = "menu_fontSize";

		document.getElementById(SetUpThe + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(SetUpThe + 2).className = "small_icon_Wide_High_qualified  SetUpThe_B";
		document.getElementById(SetUpThe + 3).className = "menu_fontSize";

		document.getElementById(Exit_s + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(Exit_s + 2).className = "small_icon_Wide_High_qualified  Exit_B";
		document.getElementById(Exit_s + 3).className = "menu_fontSize";

	} else if (obj == myBorrowing) {

		document.getElementById(obj + 1).className = "left_menu_width  left_menu_orangeBackgroundImg";
		document.getElementById(obj + 2).className = "small_icon_Wide_High_qualified  myBorrowing_W";
		document.getElementById(obj + 3).className = "menu_fontSize_white";

		document.getElementById(members + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(members + 2).className = "small_icon_Wide_High_qualified  the_member_center_B";
		document.getElementById(members + 3).className = "menu_fontSize";

		document.getElementById(myFinancial + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myFinancial + 2).className = "small_icon_Wide_High_qualified  myFinancial_B";
		document.getElementById(myFinancial + 3).className = "menu_fontSize";

		document.getElementById(SetUpThe + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(SetUpThe + 2).className = "small_icon_Wide_High_qualified  SetUpThe_B";
		document.getElementById(SetUpThe + 3).className = "menu_fontSize";

		document.getElementById(Exit_s + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(Exit_s + 2).className = "small_icon_Wide_High_qualified  Exit_B";
		document.getElementById(Exit_s + 3).className = "menu_fontSize";

	} else if (obj == SetUpThe) {

		document.getElementById(obj + 1).className = "left_menu_width  left_menu_orangeBackgroundImg";
		document.getElementById(obj + 2).className = "small_icon_Wide_High_qualified   SetUpThe_W";
		document.getElementById(obj + 3).className = "menu_fontSize_white";

		document.getElementById(members + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(members + 2).className = "small_icon_Wide_High_qualified  the_member_center_B";
		document.getElementById(members + 3).className = "menu_fontSize";

		document.getElementById(myFinancial + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myFinancial + 2).className = "small_icon_Wide_High_qualified  myFinancial_B";
		document.getElementById(myFinancial + 3).className = "menu_fontSize";

		document.getElementById(myBorrowing + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myBorrowing + 2).className = "small_icon_Wide_High_qualified  myBorrowing_B";
		document.getElementById(myBorrowing + 3).className = "menu_fontSize";

		document.getElementById(Exit_s + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(Exit_s + 2).className = "small_icon_Wide_High_qualified  Exit_B";
		document.getElementById(Exit_s + 3).className = "menu_fontSize";

	} else if (obj == Exit_s) {

		document.getElementById(obj + 1).className = "left_menu_width  left_menu_orangeBackgroundImg";
		document.getElementById(obj + 2).className = "small_icon_Wide_High_qualified   Exit_W";
		document.getElementById(obj + 3).className = "menu_fontSize_white";

		document.getElementById(members + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(members + 2).className = "small_icon_Wide_High_qualified  the_member_center_B";
		document.getElementById(members + 3).className = "menu_fontSize";

		document.getElementById(myFinancial + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myFinancial + 2).className = "small_icon_Wide_High_qualified  myFinancial_B";
		document.getElementById(myFinancial + 3).className = "menu_fontSize";

		document.getElementById(myBorrowing + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(myBorrowing + 2).className = "small_icon_Wide_High_qualified  myBorrowing_B";
		document.getElementById(myBorrowing + 3).className = "menu_fontSize";

		document.getElementById(SetUpThe + 1).className = "left_menu_width  left_menu_whiteBackgroundImg";
		document.getElementById(SetUpThe + 2).className = "small_icon_Wide_High_qualified  SetUpThe_B";
		document.getElementById(SetUpThe + 3).className = "menu_fontSize";

	}

}