depth = -9999 //stay above everything
itemXPos = 430; //x shift for item position
currentItemPos = 0; //scroll position
weaponPosY = 20;
currentWeaponPos = 0;
frameTimer = 0;
frame = 0;

//arrows
weaponArrowFrame = 0;
itemArrowFrameRight = 0;
itemArrowFrameLeft = 0;

//log
arrayLog[0] = "WELCOME TO REVENGE OF THE PETSCII ROBOTS";
arrayLog[1] = "ATTACK OF THE PETSCII ROBOTS BY DAVID MURRAY 2021";
arrayLog[2] = "REVENGE OF THE PETSCII ROBOTS BY MOPSPEAR 2024";
newLine = "";
switchWarning = true;

//radar
radar = true;
targetDir = 0;

draw_set_color(GREEN);