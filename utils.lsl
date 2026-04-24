integer sbDialog(key keyAgent, string strMessage, list lstButtons, integer intChannel) {
    integer intHandle;

    lstButtons =
        llList2List(lstButtons, -3, -1) +
        llList2List(lstButtons, -6, -4) +
        llList2List(lstButtons, -9, -7) +
        llList2List(lstButtons, -12, -10);

    intHandle = llListen(intChannel, "", keyAgent, "");
    llDialog(keyAgent, strMessage, lstButtons, intChannel);
    return intHandle;
}

list buttons = ["◄","►","▲"];

integer BuildChannel() { return 0x80000000 | (integer)("0x"+(string)llGetKey()); }

string freemem ()
{
	integer precision = 1;
	float input = (float)llGetFreeMemory() / 163.84 ; // total de 16384 bytes (16KiB).
	if((precision = (precision - 7 - (precision < 1))) & 0x80000000)
		return llGetSubString((string)input, 0, precision)+"%";
	return (string)input+"%";
}

string show_mem () { 
    integer total = (float)llGetMemoryLimit();
    integer used = (float)llGetUsedMemory();
    integer free = (float)llGetFreeMemory();
    return 
        "Total Mem: " + (string)llGetMemoryLimit() + " " +
        "\nUsed Mem: " + (string)llGetUsedMemory() + " " + (string)(user/total)+"%" +
        "\nFree Mem: " + (string)llGetFreeMemory() + " " + (string)(free/total)+"%";
 }

Test()
{
    llSetText("Limited Memory " + (string)llGetMemoryLimit() +
              "\nUsed Memory " + (string)llGetUsedMemory() +
              "\nFree Memory " + (string)llGetFreeMemory(),<1,1,1>,1);
}

lm (integer cmd, string str, key id) { llMessageLinked( LINK_SET,  cmd,  str,  id ); }


DisplayMenu(
	key id
    string  menuDescripter, //  = "mymenu"
    string  menuNavigate, //  = "TRUE";
    string  menuText, //  = "Main text displayed.~text1~text2~text3~text4~text5~text6~text7~text8~text9~text10"; 
    string  menuButtons, //  =  "B1~B2~B3~B4~B5~B6~B7~B8~B9~B10";                            
    string  menuFixedButtons //  = "FIXED1~FIXED2"
{   // Menu Functions        
    llMessageLinked(LINK_THIS, LINK_MENU_DISPLAY, menuDescripter+"|"+menuNavigate+"|"+menuText+"|"+ menuButtons+"|"+menuFixedButtons, id);
}

integer olf;
do
	llSay(0, (string)olf);    // olf is still equal to zero at first iteration
while (++olf < 5);            // Increments then does the while-test

