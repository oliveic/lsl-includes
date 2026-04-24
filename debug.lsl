
key ME = "0aacb414-b08d-4d38-953a-f2eb7185eb0c";

key MY_KEY = "0aacb414-b08d-4d38-953a-f2eb7185eb0c";

Out(list l) { if(l == []) llOwnerSay("<empty>"); else llOwnerSay(llDumpList2String(l, "|")); }

ScriptOut(list l) { if(l == []) llOwnerSay("<empty>"); else llOwnerSay(llDumpList2String([llGetScriptName()]+l, "|")); }

OwnerSay (string m) {string o = llGetObjectName(); llSetObjectName(""); llOwnerSay(m); llSetObjectName(o); }

debug (list l) { Out(l); }

dump() {
	integer n = llLinksetDataCountKeys( );
	list keys = llLinksetDataListKeys(0,n);
	while(n--) { llOwnerSay( llDumpList2String([keys[n] , llLinksetDataRead(keys[n])], "|"); }
}


