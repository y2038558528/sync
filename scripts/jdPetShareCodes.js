let codes = ['MTE1NDQ5OTUwMDAwMDAwNDM2MzczMjk=
for (let i = 0; i < codes.length; i++) {
	const index = (i + 1 === 1) ? '' : (i + 1);
	exports['PetShareCode' + index] = codes[i];
}