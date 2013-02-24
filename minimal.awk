BEGIN {FS="|"}
      {
	lines[NR] = $0
	if(val[$2] == ""){
	   val[$2] = $1
	}
	else if (val[$2] != $1){
	   val[$2] = "true"
	}
	
      }
END   {
	for (i=1; i<=NR; i++){
	    split(lines[i], p, "|");
	    if(val[p[2]] == "true"){
	       print lines[i]
	    }
	}
      }
