
integer DAYS_PER_YEAR        = 365;           // Non leap year
integer SECONDS_PER_YEAR     = 31536000;      // Non leap year
integer SECONDS_PER_DAY      = 86400;
integer SECONDS_PER_HOUR     = 3600;
integer SECONDS_PER_MINUTE   = 60;

list MonthList = [  "JAN", "FEB", "MAR", "APR", "MAY", "JUN", 
                        "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" ];
                        
list MonthNameList = [];
 
list Meses  = ["JAN", "FEV", "MAR","ABR", "MAI", "JUN", "JUL", "AGO", "SET", "OUT", "NOV", "DEZ"]; 
 
list MesesCompletos = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];


// Script para definir variáveis listas com os nomes dos meses em várias línguas

// Meses em Português "pt"
list meses_portugues_longo = ["Janeiro", "Fevereiro", "Março", "Abril", "Maio", "Junho", "Julho", "Agosto", "Setembro", "Outubro", "Novembro", "Dezembro"];
list meses_portugues_curto = ["Jan", "Fev", "Mar", "Abr", "Mai", "Jun", "Jul", "Ago", "Set", "Out", "Nov", "Dez"];

// Dias da semana em Português
list dias_semana_portugues_longo = ["Domingo", "Segunda-feira", "Terça-feira", "Quarta-feira", "Quinta-feira", "Sexta-feira", "Sábado"];
list dias_semana_portugues_curto = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sáb"];

// Meses em Espanhol "es"
list meses_espanhol_longo = ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"];
list meses_espanhol_curto = ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"];

// Dias da semana em Espanhol
list dias_semana_espanhol_longo = ["Domingo", "Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado"];
list dias_semana_espanhol_curto = ["Dom", "Lun", "Mar", "Mié", "Jue", "Vie", "Sáb"];

// Meses em Francês "fr"
list meses_frances_longo = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"];
list meses_frances_curto = ["Jan", "Fév", "Mar", "Avr", "Mai", "Juin", "Juil", "Aoû", "Sep", "Oct", "Nov", "Déc"];

// Dias da semana em Francês
list dias_semana_frances_longo = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"];
list dias_semana_frances_curto = ["Dim", "Lun", "Mar", "Mer", "Jeu", "Ven", "Sam"];

// Meses em Inglês "us" ou  ""
list meses_ingles_longo = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
list meses_ingles_curto = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

// Dias da semana em Inglês
list dias_semana_ingles_longo = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"];
list dias_semana_ingles_curto = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];


integer LeapYear( integer year)
{
    return !(year & 3);
}
 
integer DaysPerMonth(integer year, integer month)
{
    // Compact Days-Per-Month algorithm. Omei Qunhua.
    if (month == 2)     return 28 + LeapYear(year);
    return 30 + ( (month + (month > 7) ) & 1);           // Odd months up to July, and even months after July, have 31 days
}
 
integer DaysPerYear(integer year)
{
    return 365 + LeapYear(year);
}



integer DateTime2Unix(list timeList)
{
    integer year   = (integer)timeList[0];
    integer month  = (integer)timeList[1];
    integer day    = (integer)timeList[2];
    integer hour   = (integer)timeList[3];
    integer minute = (integer)timeList[4];
    integer second = (integer)timeList[5];
    
    integer time = 0;
    integer yr = 1970;
    integer mt = 1;
    integer days;
    
    while(yr < year)
    {
        days = DaysPerYear(yr++);
        time += days * SECONDS_PER_DAY;
    }
    
    while (mt < month)
    {
        days = DaysPerMonth(year, mt++);
        time += days * SECONDS_PER_DAY;
    }
    
    days = day - 1;
    time += days * SECONDS_PER_DAY;
    time += hour * SECONDS_PER_HOUR;
    time += minute * SECONDS_PER_MINUTE;
    time += second;
    
    return time;
}
//"pt" portugues
// "en" ingles, 
// "es" espanhol
// "fr" frnaces

string Unix2String (integer unixtime, integer short, string language) 
{
	return DateString(Unix2DateTime(unixtime),  short, language);
}

list Unix2DateTime(integer unixtime)
{
    integer days_since_1_1_1970     = unixtime / SECONDS_PER_DAY;
    integer day = days_since_1_1_1970 + 1;
    integer year  = 1970;
    integer days_per_year = DaysPerYear(year);
    
    while (day > days_per_year)
    {
        day -= days_per_year;
        ++year;
        days_per_year = DaysPerYear(year);
    }

    integer month = 1;
    integer days_per_month = DaysPerMonth(year, month);
    
    while (day > days_per_month)
    {
        day -= days_per_month;
        
        if (++month > 12)
        {    
            ++year;
            month = 1;
        }
        
        days_per_month = DaysPerMonth(year, month);
    }

    integer seconds_since_midnight  = unixtime % SECONDS_PER_DAY;
    integer hour        = seconds_since_midnight / SECONDS_PER_HOUR;
    integer second      = seconds_since_midnight % SECONDS_PER_HOUR;
    integer minute      = second / SECONDS_PER_MINUTE;
    second              = second % SECONDS_PER_MINUTE;
    
    return [ year, month, day, hour, minute, second ];
}

string MonthName2(list timeList, integer short, string language)
{
    integer month = (integer)timeList[1];
    if (month < 1 && month > 12) return "";
    else
    {
        month--;
        if (0 == llSubStringIndex(llStringTrim(llToLower(language),STRING_TRIM),"pt"))
        {
            if(short) return llList2String(Meses, month);
            else { return llList2String(MesesCompletos, month); }
        }
        else // if (0 == llSubStringIndex(llStringTrim(llToLower(language),STRING_TRIM),"us"))
        {
            if(short) return llList2String(MonthList, month);
            else { return llList2String(MonthNameList, month); }
        }
    }  
}

string MonthName(list timeList, integer short, string language)
{
    integer month = (integer)timeList[1];
    if (month < 1 && month > 12) return "";
    list l = [];
    if(llToLower(language) == "pt")
            {
                if(short) l = meses_portugues_curto; else l = meses_portugues_longo;
            }
        else if (llToLower(language) == "es")
            {
                if(short) l = meses_espanhol_curto; else l = meses_espanhol_longo;
            }
        else if (llToLower(language) == "fr")
            {
                if(short) l = meses_frances_curto; else l = meses_frances_longo;
            }
            else
            {
                if(short) l = meses_ingles_curto; else l = meses_ingles_longo;
            }
    return llList2String(l, month-1);
}


string DateString(list timelist, integer short, string language)
{
    integer year       = llList2Integer(timelist,0);
    integer month      = llList2Integer(timelist,1);
    integer day        = llList2Integer(timelist,2);
    
    return (string)day + "-" + MonthName(timelist,short,language) + "-" + (string)year;
}

string TimeString(list timelist)
{
    string  hourstr     = llGetSubString ( (string) (100 + llList2Integer(timelist, 3) ), -2, -1);
    string  minutestr   = llGetSubString ( (string) (100 + llList2Integer(timelist, 4) ), -2, -1);
    string  secondstr   = llGetSubString ( (string) (100 + llList2Integer(timelist, 5) ), -2, -1);
    return  hourstr + ":" + minutestr + ":" + secondstr;
}

list String2ListTimeStamp(string s)
{
    return llParseString2List( s, ["-", "T", ":", "."], [] ); // "YYYY-MM-DDThh:mm:ss.ff..fZ"
}

string String2ListTimeStamp(list l)
{
	return	llList2String(l,0) + "-"  	// YYYY
			+ llList2String(l,1) + "-"	// MM
			+ llList2String(l,2) + "T"	// DD
			+ llList2String(l,3) + ":"	// hh
			+ llList2String(l,4) + ":"	// mm
			+ llList2String(l,5) + "."	// ss
			+ llList2String(l,6);		//.ff..fZ
}

integer getISOWeek() {
    // 1. Obter data atual (AAAA-MM-DD) e converter para inteiros
    string date = llGetDate();
    integer y = (integer)llGetSubString(date, 0, 3);
    integer m = (integer)llGetSubString(date, 5, 6);
    integer d = (integer)llGetSubString(date, 8, 9);

    // 2. Algoritmo para encontrar o Dia da Semana (0=Dom, 1=Seg... 6=Sab)
    // Baseado na Congruência de Zeller simplificada
    integer a = (14 - m) / 12;
    integer y_adj = y - a;
    integer m_adj = m + 12 * a - 2;
    integer dow = (d + y_adj + y_adj/4 - y_adj/100 + y_adj/400 + (31 * m_adj) / 12) % 7;

    // 3. ISO Week: A semana pertence ao ano que contém sua Quinta-Feira
    // Ajustamos o dia atual para a Quinta-Feira da mesma semana
    // Se hoje é Dom(0), vira 4. Se Seg(1), vira 3... Se Sab(6), vira -2.
    integer iso_dow = dow;
    if(iso_dow == 0) iso_dow = 7; // ISO Segunda=1, Domingo=7
    
    // Calculamos o dia do ano (Ordinal Date)
    // Simplificado para LSL usando uma lista de dias acumulados
    list month_days = [0, 31, 59, 90, 120, 151, 181, 212, 243, 273, 304, 334];
    integer day_of_year = llList2Integer(month_days, m - 1) + d;
    
    // Ajuste de ano bissexto para o dia do ano
    if (m > 2 && (y % 4 == 0 && (y % 100 != 0 || y % 400 == 0))) {
        day_of_year++;
    }

    // 4. Cálculo final da semana ISO
    // week = (day_of_year - iso_dow + 10) / 7
    integer week = (day_of_year - iso_dow + 10) / 7;

    // Casos de borda: Semana 0 (pertence ao ano anterior) ou 53 (pode ser a 1 do próximo)
    if (week < 1) {
        week = 52; // Simplificação funcional para LSL
    } else if (week > 52) {
        // Verifica se a quinta-feira do alvo cai no próximo ano
        if (((day_of_year - iso_dow + 10) % 7) < 4) week = 1;
    }

    return week;
}