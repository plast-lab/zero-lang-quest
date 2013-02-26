input = prompt().split('\n');
map = {};
for (i in input) {
	input[i] = input[i].split('|');
	k = input[i][0];
	v = input[i][1];
	map[k] ? map[k].push(v) : map[k] = [v];
}
for (i in input)
	map[input[i][0]].length > 1 &&
	console.log(input[i][0]+'|'+input[i][1]);

