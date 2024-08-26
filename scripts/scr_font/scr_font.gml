function text(text)
{
	for (var i = 0; i < string_length(text); i++)
	{
		arrayString[i] = string_char_at(text,i+1);
	}
	for (var i = 0; i < array_length(arrayString); i++)
	{
		switch arrayString[i]
		{
			case " ":
			arrayFont[i] = whitespace
			break;	
			case "A":
			arrayFont[i] = A;
			break;
			case "B":
			arrayFont[i] = B;
			break;
			case "C":
			arrayFont[i] = C;
			break;
			case "D":
			arrayFont[i] = D;
			break;
			case "E":
			arrayFont[i] = E;
			break;
			case "F":
			arrayFont[i] = F;
			break;			
			case "G":
			arrayFont[i] = G;
			break;	
			case "H":
			arrayFont[i] = H;
			break;				
			case "I":
			arrayFont[i] = I;
			break;			
			case "J":
			arrayFont[i] = J
			break;	
			case "K":
			arrayFont[i] = K
			break;	
			case "L":
			arrayFont[i] = L
			break;				
			case "M":
			arrayFont[i] = M
			break;	
			case "N":
			arrayFont[i] = N
			break;	
			case "O":
			arrayFont[i] = O
			break;	
			case "P":
			arrayFont[i] = P
			break;				
			case "Q":
			arrayFont[i] = Q
			break;		
			case "R":
			arrayFont[i] = R
			break;					
			case "S":
			arrayFont[i] = S
			break;		
			case "T":
			arrayFont[i] = T
			break;		
			case "U":
			arrayFont[i] = U
			break;			
			case "V":
			arrayFont[i] = V
			break;	
			case "W":
			arrayFont[i] = W
			break;	
			case "X":
			arrayFont[i] = X
			break;	
			case "Y":
			arrayFont[i] = Y
			break;	
			case "Z":
			arrayFont[i] = Z
			break;	
		}
	}
	for (var i = 0; i < array_length(arrayFont); i++)
	{
		draw_sprite_ext(arrayFont[i], 0,x+7*i,y,1,1,0,c_white,1);
	}
}