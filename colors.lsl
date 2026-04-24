

vector black               = <0, 0, 0>;          //ColorPaletteEntry01, "Black"
vector white_A             = <1, 1, 1>;          //ColorPaletteEntry17, "White"
vector gray                = <0.5, 0.5, 0.5>;    //ColorPaletteEntry02, "Gray"
vector light_gray          = <0.75, 0.75, 0.75>; //ColorPaletteEntry18, "LtGray"
vector dark_red            = <0.5, 0, 0>;        //ColorPaletteEntry03
vector red                 = <1, 0, 0>;          //ColorPaletteEntry19, "Red"
vector dark_yellow         = <0.5, 0.5, 0>;      //ColorPaletteEntry04
vector yellow              = <1, 1, 0>;          //ColorPaletteEntry20, "Yellow"
vector dark_green          = <0, 0.5, 0>;        //ColorPaletteEntry05
vector green               = <0, 1, 0>;          //ColorPaletteEntry21, "Green"
vector dark_cyan           = <0, 0.5, 0.5>;      //ColorPaletteEntry06
vector cyan                = <0, 1, 1>;          //ColorPaletteEntry22
vector dark_blue           = <0, 0, 0.5>;        //ColorPaletteEntry07
vector blue                = <0, 0, 1>;          //ColorPaletteEntry23, "Blue"
vector dark_magenta        = <0.5, 0, 0.5>;      //ColorPaletteEntry08
vector magenta             = <1, 0, 1>;          //ColorPaletteEntry24, "Purple"
vector dirty_yellow        = <0.5, 0.5, 0>;      //ColorPaletteEntry09
vector light_yellow        = <1, 1, 0.5>;        //ColorPaletteEntry25
vector dark_green_to_blue  = <0, 0.25, 0.25>;    //ColorPaletteEntry10
vector green_to_blue       = <0, 1, 0.5>;        //ColorPaletteEntry26
vector light_green_to_blue = <0, 0.5, 1>;        //ColorPaletteEntry11
vector light_blue_to_green = <0.5, 1, 1>;        //ColorPaletteEntry27
vector dark_blue_to_cyan   = <0, 0.25, 0.5>;     //ColorPaletteEntry12
vector cyan_to_pink        = <0.5, 0.5, 1>;      //ColorPaletteEntry28
vector indigo              = <0.5, 0, 1>;        //ColorPaletteEntry13
vector violet              = <1, 1, 0.5>;        //ColorPaletteEntry29
vector dark_brown          = <0.5, 0.25, 0>;     //ColorPaletteEntry14
vector brown               = <1, 0.5, 0>;        //ColorPaletteEntry30
vector white_B             = <1, 1, 1>;          //ColorPaletteEntry15, "White"
vector white_C             = <1, 1, 1>;          //ColorPaletteEntry31
vector pale_yellow         = <1, 1, 0.79>;       //ColorPaletteEntry16, "LtYellow"
vector white_D             = <1, 1, 1>;          //ColorPaletteEntry32, "White"

vector club_color            = <0.094, 0.914, 0.918>;    // #18e9ea

vector hex2lsl(string hex)
{
    integer i = (integer)("0x" + hex);
    return <(i >> 16) & 0xFF, (i >> 8) & 0xFF, (i & 0xFF)> / 255;
}

list colors = [
    "NAVY","<0.000,0.122,0.247",
    "BLUE","<0.000,0.455,0.851",
    "AQUA","<0.498,0.859,1.000",
    "TEAL","<0.224,0.800,0.800",
    "OLIVE","<0.239,0.600,0.439",
    "GREEN","<0.180,0.800,0.251",
    "LIME","<0.004,1.000,0.439",
    "YELLOW","<1.000,0.863,0.000",
    "ORANGE","<1.000,0.522,0.106",
    "RED","<1.000,0.255,0.212",
    "MAROON","<0.522,0.078,0.294",
    "FUCHSIA","<0.941,0.071,0.745",
    "PURPLE","<0.694,0.051,0.788",
    "WHITE","<1.000,1.000,1.000",
    "SILVER","<0.867,0.867,0.867",
    "GRAY","<0.667,0.667,0.667",
    "BLACK","<0.000,0.000,0.000"
        ];


list lstHTML = [
        "aliceblue",            0xf0f8ff, "antiquewhite",    0xfaebd7, "aqua",            0x00ffff,
        "aquamarine",           0x7fffd4, "azure",           0xf0ffff, "beige",           0xf5f5dc,
        "bisque",               0xffe4c4, "black",           0x000000, "blanchedalmond",  0xffebcd,
        "blue",                 0x0000ff, "blueviolet",      0x8a2be2, "brown",           0xa52a2a,
        "burlywood",            0xdeb887, "cadetblue",       0x5f9ea0, "chartreuse",      0x7fff00,
        "chocolate",            0xd2691e, "coral",           0xff7f50, "cornflowerblue",  0x6495ed,
        "cornsilk",             0xfff8dc, "crimson",         0xdc143c, "cyan",            0x00ffff,
        "darkblue",             0x00008b, "darkcyan",        0x008b8b, "darkgoldenrod",   0xb8860b,
        "darkgray",             0xa9a9a9, "darkgreen",       0x006400, "darkkhaki",       0xbdb76b,
        "darkmagenta",          0x8b008b, "darkolivegreen",  0x556b2f, "darkorange",      0xff8c00,
        "darkorchid",           0x9932cc, "darkred",         0x8b0000, "darksalmon",      0xe9967a,
        "darkseagreen",         0x8fbc8f, "darkslateblue",   0x483d8b, "darkslategray",   0x2f4f4f,
        "darkturquoise",        0x00ced1, "darkviolet",      0x9400d3, "deeppink",        0xff1493,
        "deepskyblue",          0x00bfff, "dimgray",         0x696969, "dodgerblue",      0x1e90ff,
        "firebrick",            0xb22222, "floralwhite",     0xfffaf0, "forestgreen",     0x228b22,
        "fuchsia",              0xff00ff, "gainsboro",       0xdcdcdc, "ghostwhite",      0xf8f8ff,
        "gold",                 0xffd700, "goldenrod",       0xdaa520, "gray",            0x808080,
        "green",                0x008000, "greenyellow",     0xadff2f, "honeydew",        0xf0fff0,
        "hotpink",              0xff69b4, "indianred",       0xcd5c5c, "indigo",          0x4b0082,
        "ivory",                0xfffff0, "khaki",           0xf0e68c, "lavender",        0xe6e6fa,
        "lavenderblush",        0xfff0f5, "lawngreen",       0x7cfc00, "lemonchiffon",    0xfffacd,
        "lightblue",            0xadd8e6, "lightcoral",      0xf08080, "lightcyan",       0xe0ffff,
        "lightgoldenrodyellow", 0xfafad2, "lightgrey",       0xd3d3d3, "lightgreen",      0x90ee90,
        "lightpink",            0xffb6c1, "lightsalmon",     0xffa07a, "lightseagreen",   0x20b2aa,
        "lightskyblue",         0x87cefa, "lightslategray",  0x778899, "lightsteelblue",  0xb0c4de,
        "lightyellow",          0xffffe0, "lime",            0x00ff00, "limegreen",       0x32cd32,
        "linen",                0xfaf0e6, "magenta",         0xff00ff, "maroon",          0x800000,
        "mediumaquamarine",     0x66cdaa, "mediumblue",      0x0000cd, "mediumorchid",    0xba55d3,
        "mediumpurple",         0x9370d8, "mediumseagreen",  0x3cb371, "mediumslateblue", 0x7b68ee,
        "mediumspringgreen",    0x00fa9a, "mediumturquoise", 0x48d1cc, "mediumvioletred", 0xc71585,
        "midnightblue",         0x191970, "mintcream",       0xf5fffa, "mistyrose",       0xffe4e1,
        "moccasin",             0xffe4b5, "navajowhite",     0xffdead, "navy",            0x000080,
        "oldlace",              0xfdf5e6, "olive",           0x808000, "olivedrab",       0x6b8e23,
        "orange",               0xffa500, "orangered",       0xff4500, "orchid",          0xda70d6,
        "palegoldenrod",        0xeee8aa, "palegreen",       0x98fb98, "paleturquoise",   0xafeeee,
        "palevioletred",        0xd87093, "papayawhip",      0xffefd5, "peachpuff",       0xffdab9,
        "peru",                 0xcd853f, "pink",            0xffc0cb, "plum",            0xdda0dd,
        "powderblue",           0xb0e0e6, "purple",          0x800080, "red",             0xff0000,
        "rosybrown",            0xbc8f8f, "royalblue",       0x4169e1, "saddlebrown",     0x8b4513,
        "salmon",               0xfa8072, "sandybrown",      0xf4a460, "seagreen",        0x2e8b57,
        "seashell",             0xfff5ee, "sienna",          0xa0522d, "silver",          0xc0c0c0,
        "skyblue",              0x87ceeb, "slateblue",       0x6a5acd, "slategray",       0x708090,
        "snow",                 0xfffafa, "springgreen",     0x00ff7f, "steelblue",       0x4682b4,
        "tan",                  0xd2b48c, "teal",            0x008080, "thistle",         0xd8bfd8,
        "tomato",               0xff6347, "turquoise",       0x40e0d0, "violet",          0xee82ee,
        "wheat",                0xf5deb3, "white",           0xffffff, "whitesmoke",      0xf5f5f5,
        "yellow",               0xffff00, "yellowgreen",     0x9acd32
    ];

vector  sbColorConvert(string strData) {
    integer mode = llListFindList(lstHTML, [llToLower(strData)]);
    integer intColor = 0;

    if (~mode) {
        intColor = llList2Integer(lstHTML, mode | 1);
        mode = 8;
    }
    else {
        string strStart = llGetSubString(strData, 0, 1);
        if (strStart != "0x") {
            if (llGetSubString(strStart, 0, 0) == "#") {
                strData = "0x" + llDeleteSubString(strData, 0, 0);
                else {
                    vector vecColor = (vector)("<"+strData+">");
                    if (vecColor) {
                        return (vector)("<"+strData+">") / 255;
                    }
                    strData = "0x" + strData;
                }
            }
            intColor = (integer)strData;
            mode = llStringLength(strData);
        }
        if (mode == 8) {//RRGGBB
            return <(intColor >> 16) & 0xFF, (intColor >> 8) & 0xFF, intColor & 0xFF> / 0xFF;
        }
        else if (mode == 5) {//RGB (an HTML color format)
            return <(intColor >> 8) & 0xF, (intColor >> 4) & 0xF, intColor & 0xF> / 0xF;
        }
        return ZERO_VECTOR;//black
    }
}

integer ColorAlphatoRGBA(vector color, float alpha) {
    return (((integer)(alpha   * 255.0) & 0xFF) << 24) |
           (((integer)(color.x * 255.0) & 0xFF) << 16) |
           (((integer)(color.y * 255.0) & 0xFF) << 8) |
            ((integer)(color.z * 255.0) & 0xFF);
}

vector RGBAtoColor(integer rgba) {
    return < (rgba >> 16) & 0xFF, (rgba >> 8) & 0xFF, (rgba & 0xFF) > / 255.0;
}

float RGBAtoAlpha(integer rgba) {
    return ((rgba >> 24) & 0xFF) / 255.0;
}