// Cleans the name user parentesys.
string clean_name (string s)
{
    list l = llParseString2List(s,["(",")"],[]);
    if(llGetListLength(l) > 1) return llStringTrim(llList2String(l,1),STRING_TRIM);
    else return llStringTrim(s,STRING_TRIM);
}

string url2key (string s) { return llGetSubString(s,24,59); }

string key2profile (key id) { return "secondlife:///app/agent/" + (string)id + "/about"; }

string build_name (string n, string d)
{
    if(d != "") return d + " ("+n+")";
    else return n;
}


key RequestProfilePic(key id) //Run the HTTP Request then set the texture
{
    //key id=llDetectedKey(0); This breaks the function, better off not used
    string URL_RESIDENT = "https://world.secondlife.com/resident/";
    return llHTTPRequest( URL_RESIDENT + (string)id,[HTTP_METHOD,"GET"],"");
}

string GetProfilePic (string body)
{
    string profile_key_prefix = "<meta name=\"imageid\" content=\"";
    string profile_img_prefix = "imageid";
    integer profile_key_prefix_length; // calculated from profile_key_prefix in state_entry()
    profile_key_prefix_length = 1;
    integer profile_img_prefix_length; // calculated from profile_key_prefix in state_entry()
    integer s1 = llSubStringIndex(body, profile_img_prefix);
    s1 += 18;
    return llGetSubString(body,s1, s1+35);

}

https://world.secondlife.com/resident/