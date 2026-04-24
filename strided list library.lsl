// Strided Functions For working with Strided Lists.
// By Aakanaar LaSalle

// the intStride parameter is the length of the strides within the list
// the intIndex is which stride we're working with.
// the intSubIndex is which element of the stride we're working with.

// Returns number of Strides in a List
integer fncStrideCount(list lstSource, integer intStride) {  return llGetListLength(lstSource) / intStride; }

// Find a Stride within a List (returns stride index, and item subindex)
list fncFindStride(list lstSource, list lstItem, integer intStride) { integer intListIndex = llListFindList(lstSource, lstItem); if (intListIndex == -1) { return [-1, -1]; } integer intStrideIndex = intListIndex / intStride; integer intSubIndex = intListIndex % intStride; return [intStrideIndex, intSubIndex]; } 

// Deletes a Stride from a List
list fncDeleteStride(list lstSource, integer intIndex, integer intStride) { integer intNumStrides = fncStrideCount(lstSource, intStride); if (intNumStrides != 0 && intIndex < intNumStrides) { integer intOffset = intIndex * intStride; return llDeleteSubList(lstSource, intOffset, intOffset + (intStride - 1)); } return lstSource; } 

// Returns a Stride from a List
list fncGetStride(list lstSource, integer intIndex, integer intStride) { integer intNumStrides = fncStrideCount(lstSource, intStride); if (intNumStrides != 0 && intIndex < intNumStrides) { integer intOffset = intIndex * intStride; return llList2List(lstSource, intOffset, intOffset + (intStride - 1)); } return []; } 

// Replace a Stride in a List
list fncReplaceStride(list lstSource, list lstStride, integer intIndex, integer intStride) { integer intNumStrides = fncStrideCount(lstSource, intStride); if (llGetListLength(lstStride) != intStride) { return lstSource; } if (intNumStrides != 0 && intIndex < intNumStrides) { integer intOffset = intIndex * intStride; return llListReplaceList(lstSource, lstStride, intOffset, intOffset + (intStride - 1)); } return lstSource; } 

// Retrieve a single element from a Stride within a List
list fncGetElement(list lstSource, integer intIndex, integer intSubIndex, integer intStride) { if (intSubIndex >= intStride) { return []; } integer intNumStrides = fncStrideCount(lstSource, intStride); if (intNumStrides != 0 && intIndex < intNumStrides) { integer intOffset = (intIndex * intStride) + intSubIndex; return llList2List(lstSource, intOffset, intOffset); } return []; } 

// Update a single item in a Stride within a List
list fncReplaceElement(list lstSource, list lstItem, integer intIndex, integer intSubIndex, integer intStride) { integer intNumStrides = fncStrideCount(lstSource, intStride); if (llGetListLength(lstItem) != 1) { return lstSource; } if (intNumStrides != 0 && intIndex < intNumStrides) { integer intOffset = (intIndex * intStride) + intSubIndex; return llListReplaceList(lstSource, lstItem, intOffset, intOffset); } return lstSource; } 

//Get Col
list fncGetColumn(list lstSource, integer intSubIndex, integer intStride) { 	integer i; 	list l=[]; 	for(i=0;i<fncStrideCount(lstSource,intStride);i++) l += fncGetElement(lstSource, i, intSubIndex, intStride); 	return l; }

//Get Col fitering a single element of another colun
list fncGetColumnFilter(list lstSource, integer intSubIndex, integer intStride, list filter, integer indexFilter)
{
	integer ix = 0;
	list aux = [];
	for(ix = 0; ix < fncStrideCount(lstSource,intStride); ix++ )
	{
		if( llListFindList(fncGetElement(lstSource, ix, indexFilter, intStride), filter ) != -1)
			aux += fncGetElement(lstSource, ix, intSubIndex, intStride);
	}
	return aux;
}

integer fncInList(list test, list src) {if(llListFindList(src, test ) == -1) return FALSE; else return TRUE; }

list fnc_search_in_list (string search, list l) {
	list aux = [];
	integer i;
	for(i=0; i < llGetListLength(tree); i++)
		if(llSubStringIndex(llList2String(tree,i),search) != -1) aux += llList2List(tree,i,i);
	return aux;
}

list ListUnique( list lAll ) {
    integer i;
    list lFiltered = llList2List(lAll, 0, 0);
    integer iAll = llGetListLength( lAll );
    for (i = 1; i < iAll; ++i) {
        if ( llListFindList(lFiltered, llList2List(lAll, i, i) ) == -1 ) {
            lFiltered += llList2List(lAll, i, i);
        }
    }
    return lFiltered;
}
list ListItemDelete(list mylist,string element_old) {
    integer placeinlist = llListFindList(mylist, [element_old]);
    if (placeinlist != -1)
        return llDeleteSubList(mylist, placeinlist, placeinlist);
    return mylist;
}

list fnc_filter_single_list (string filter, list src) {
	list aux = [];
	integer i;
	for(i = 0; i < llGetListLength(src), i++)
		if(llSubStringIndex(llList2String(src,i),filter) != -1) aux += llList2String(src,i);
	return aux;
}

list max(list l) { return llList2List(llListSort(l,1,0),0,0); }
list min(list l) { return llList2List(llListSort(l,1,1),0,0); }

integer ListCompare(list a, list b) {
	 if (a != b) {
		if (a == []) return TRUE;
		return !llListFindList(a, b);
	 }
}