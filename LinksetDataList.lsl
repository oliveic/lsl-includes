
list ldKeys () { return llLinksetDataListKeys( 0, llLinksetDataCountKeys( )); }

list ldRead( string s) { return llCSV2List(llLinksetDataRead(s)); }

ldWrite (string s, list l ) { llLinksetDataWrite(s,llList2CSV(l); }

// DATA SET

list get_keys() { return llLinksetDataListKeys(0, llLinksetDataCountKeys()); }
integer count() { return llLinksetDataCountKeys(); }
string r(string name) { return  llLinksetDataRead(name); }
integer w(string name,string value) {
    if(value == "") value = "<empty>";
    llOwnerSay("write "+name);
    return (llLinksetDataWrite(name, value)==0); }
reset() { llLinksetDataReset( ); }



string ldReadElement (string s, integer index, integer type) { 
	if(type == TYPE_FLOAT) return llList2Float(llCSV2List(llLinksetDataRead(s)),index);
	if(type == TYPE_INTEGER) return llList2Integer(llCSV2List(llLinksetDataRead(s)),index);
	if(type == TYPE_KEY) return llList2Key(llCSV2List(llLinksetDataRead(s)),index);
	if(type == TYPE_ROTATION) return llList2Rot (llCSV2List(llLinksetDataRead(s)),index);
	if(type == TYPE_STRING) return llList2String(llCSV2List(llLinksetDataRead(s)),index);
	if(type == TYPE_VECTOR) return llList2Vector(llCSV2List(llLinksetDataRead(s)),index);
}


// Type				#	Description
// TYPE_INTEGER		1	integer
// TYPE_FLOAT		2	float
// TYPE_STRING		3	string
// TYPE_KEY			4	key
// TYPE_VECTOR		5	vector
// TYPE_ROTATION	6	rotation
// TYPE_INVALID		0	none  <104.26770, 24.17092, 2106.60791> <104.26770, 19.74674, 2106.60791>


/5<0.0, -9.0, 0.0>