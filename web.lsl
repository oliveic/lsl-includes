string    url="http://sldata.tec.br/log/auction_payment.php";
list      post = [HTTP_METHOD, "POST", HTTP_MIMETYPE, "application/x-www-form-urlencoded"];

payment(list l)
{
	string values = llList2Json (JSON_OBJECT,
                    [
                     "slavekey"      , (string)l[1]    //
                    ,"slavename"     , (string)l[2]    //llList2String(user,1) 
                    ,"slavedisplay"  , (string)l[3]    //llList2String(user,2)
                    ,"bidderkey"     , (string)l[4]    //GetKey(last_bidder)
                    ,"biddername"    , (string)l[5]    //llList2String(last_bidder,1)
                    ,"bidderdisplay" , (string)l[6]    //llList2String(last_bidder,2)
                    ,"bid"           , (string)l[7]    //amount
                    ,"feeslave"      , (string)l[8]    //fee
                    ,"feeland"       , (string)l[9]    //amount - fee
                    ,"closedate"     , (string)l[10]    //llGetDate()
                    ,"place"         , (string)l[11]    //place
                    ]);
     llHTTPRequest(url,post,"info="+values);
}

string HTTP_write 	= "https://sldata.tec.br/sl_comm/write.php";
string HTTP_read 	= "https://sldata.tec.br/sl_comm/read.php";
string HTTP_del 	= "https://sldata.tec.br/sl_comm/del.php";
string HTTP_append 	= "https://sldata.tec.br/sl_comm/append.php";

key write(string f, string c)	{return llHTTPRequest(HTTP_write,	post, "file=" + f + "&content=" + c);}
key read(string f, string c)	{return llHTTPRequest(HTTP_read,	post, "file=" + f + "&content=" + c);}
key del(string f, string c)		{return llHTTPRequest(HTTP_del,		post, "file=" + f + "&content=" + c);}
key append(string f, string c)	{return llHTTPRequest(HTTP_append,	post, "file=" + f + "&content=" + c);}
