string s ="ß???a ƒ???a?ì";
default
{
	state_entry()
	{
		integer i;
		for(i=0; i < llStringLength(s); i++)
			llOwnerSay(llGetSubString(s,i,i));
			}
	touch_start(integer total_number)
	{
		llSay(0, "Touched: "+(string)total_number);
	}
}