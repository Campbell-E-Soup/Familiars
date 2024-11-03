instance_destroy(boundFrame);
var coin = 0;
coin++;
if (Bonus) {
	coin++;
}
if (irandom(2) = 2) {
	coin++
}
Gold+=coin;
var C = instance_create_layer(x,y-32,"UI",oCoinUP)
C.amt = coin; 

playSound("Death")