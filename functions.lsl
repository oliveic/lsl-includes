

// C:\Users\olive\OneDrive\Documentos\LSLEditor\include

// #include "functions.lsl"

// I - Numeros

integer IsVector(string s)
{
    list split = llParseString2List(s, [" "], ["<", ">", ","]);
    if (llGetListLength(split) != 7)
        return FALSE;
    return !((string)((vector)s) == (string)((vector)((string)llListInsertList(split, ["-"], 5))));
}
string percent (integer i, integer q) { if(q>0) return (string)(i*100 / q); else return ""; }

string FormatFloat(float f, integer num_decimals)
{
    float rounding = (float)(".5e-" + (string)num_decimals) - .5e-6;
    if (f < 0.0)
        f -= rounding;
    else
        f += rounding;
    string ret = llGetSubString((string)f, 0, num_decimals - (!num_decimals) - 7);
    if (llSubStringIndex(ret, ".") != -1)
    {
        while (llGetSubString(ret, -1, -1) == "0")
        {
            ret = llGetSubString(ret, 0, -2);
        }
    }
    if (llGetSubString(ret, -1, -1) == ".")
    {
        ret = llGetSubString(ret, 0, -2);
    }
    return ret;
}

string Float2String ( float num, integer places, integer rnd) { 
//allows string output of a float in a tidy text format
//rnd (rounding) should be set to TRUE for rounding, FALSE for no rounding

    if (rnd) {
        float f = llPow( 10.0, places );
        integer i = llRound(llFabs(num) * f);
        string s = "00000" + (string)i; // number of 0s is (value of max places - 1 )
        if(num < 0.0)
            return "-" + (string)( (integer)(i / f) ) + "." + llGetSubString( s, -places, -1);
        return (string)( (integer)(i / f) ) + "." + llGetSubString( s, -places, -1);
    }
    if (!places)
        return (string)((integer)num );
    if ( (places = (places - 7 - (places < 1) ) ) & 0x80000000)
        return llGetSubString((string)num, 0, places);
    return (string)num;
}

string fix(float input, integer precision) {if((precision = (precision - 7 - (precision < 1))) & 0x80000000) return llGetSubString((string)input, 0, precision); return (string)input; }

string fix_vector (vector input, integer precision) {return "<" + fix(input.x, precision) + ", " + fix(input.y, precision) + ", " + fix(input.z, precision) + ">"; }


// II - STRINGS

string first_word(string In_String, string Token)
{
	//This routine searches for the first word in a string,
	// and returns it.  If no word boundary found, returns
	// the whole string.
    if(Token == "") Token = " ";
    integer pos = llSubStringIndex(In_String, Token);

	//Found it?
    if( pos >= 1 )
        return llStringTrim(llGetSubString(In_String, 0, pos - 1), STRING_TRIM);
        else
            return In_String;
}

////////////////////////////////////////////////////////////////////////////////
string other_words(string In_String, string Token) //This routine searches for the other-than-first words in a string,and returns it.  If no word boundary found, returns the an empty string.
{
    if( Token == "" ) Token = " "; 
    integer pos = llSubStringIndex(In_String, Token); 
    if( pos >= 1 ) return llStringTrim(llGetSubString(In_String, pos + 1, llStringLength(In_String)), STRING_TRIM); 
    else return ""; 
} 



string center (string s, integer t) {integer i; string spc = ""; t = t-llStringLength(s); t /= 2; for(i=0;i<t;i++) spc += " "; return spc + s+ spc; }

string align (string s, string m, integer t) // m = C center m = l or e esqurda m = r or d direita
{integer i; string spc; t = t-llStringLength(s); m = llToLower(m); if (m == "c") {spc = ""; t /= 2; for(i=0;i<t;i++) spc += "-"; return spc + s+ spc; } else if(m == "l" || m == "e") {spc = ""; for(i=0;i<t;i++) spc += "-"; return s + spc; } else if(m == "l" || m == "d") {spc = ""; for(i=0;i<t;i++) spc += "-"; return spc + s; } else return s; }
