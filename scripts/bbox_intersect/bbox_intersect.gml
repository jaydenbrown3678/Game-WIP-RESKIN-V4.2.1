// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function bbox_intersect(bbox1, bbox2) {
    return !(bbox1[2] < bbox2[0] || 
             bbox1[0] > bbox2[2] || 
             bbox1[3] < bbox2[1] || 
             bbox1[1] > bbox2[3]);
}
