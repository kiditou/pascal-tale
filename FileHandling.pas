{ A Very Simple File Management Application for the completion of requirements for                 }
{ the subject ITCOMS014 Lecture for the course of Bachelor of Science in Information Technology.   }

{ Made in PASCAL with LOVE, by kiditou (Dela Cruz, Ron Michael Capacia)                            }
{ Email: kiritoneesan@gmail.com                                                                    }
{ Facebook: kiditouKun                                                                             }
{ Twitter: @kiditouKun                                                                             }

{ Application's design was inspired by UNDERTALE, a game by Toby Fox *bark* *bark*                 }
{ Compiled Using Free Pascal Compiler from *www.freepascal.org*                                    }

{ Obiously, the application's "Program" header or whatever you call it }
Program FileHandling;
{$MODE OBJFPC}

{ Uses Directive }
Uses
	Classes, Sysutils;
	
{ Variable Declarations }
Var
	{ Declaration for the file variables, and the selected option }
	fileSource, fileDestination, option : string;
	sourceFile, destinationFile : TFileStream;
	{ This is for the box's long horizontal line, don't mind this, mind your own business }
	line : ShortInt;
	{ Variable Declaration for the application's reply monolouge }
	monolouge : ShortInt;
	{ The boolean variable for the loop }
	askAgain : boolean;

Procedure LongHorizontalLine();
begin
	line:= 0;
	while line <= 77 do
		begin
			Write(#9552);
			Inc(line, 1);
		end;
end;
	
{ Start of the application's code }
Begin
	{ Initializes the loop and the text reply }
	askAgain := true;
	monolouge := 0;	
	
	{ The welcome screen is too old. Say hi to the 'Hi!' screen! }
	Write(#9556);
	{ You'll be seeing a lot of this emulated for loops                  }
	{ it is for the long horizontal line which encloses the system texts }
	{ so that it looks like a dialog box from the famous game UNDERTALE  }
	LongHorizontalLine();
	Write(#9559);
	Write(#9553 + '                                                                              ' + #9553);
	Write(#9553 + ' * Hi, you are using the Copy Pasta application made by RM Dela Cruz ' + #9829 + '        ' + #9553);
	Write(#9553 + '                                                                              ' + #9553);
	Write(#9553 + ' * You can type an option from the following or not :                         ' + #9553);
	Write(#9553 + '                                                                              ' + #9553);
	Write(#9553 + '      [copy] to copy a file                                                   ' + #9553);
	Write(#9553 + '      [move] to move a .. file                                                ' + #9553);
	Write(#9553 + '      [edit] to edit ... a text file                                          ' + #9553);
	Write(#9553 + '      [delete] of course to delete your ... file                              ' + #9553);
	Write(#9553 + '                                                                              ' + #9553);
	Write(#9553 + '      [help] type it if you need help. Read or you' + #39 + 'll have a bad time         ' + #9553);
	Write(#9553 + '                                                                              ' + #9553);
	Write(#9562);
	{ Another loooooong horizontal line, I don't know if you get me but, if you do thanks, if not .. go study faggot }
	LongHorizontalLine();
	Write(#9565);
	WriteLn;
	
	{ Loop start here, it keeps prompting the user until a correct code was written }
	while askAgain = true do
	begin
	Write(' > ');
	ReadLn(option);
	WriteLn;
		
		{ This catches the commands thrown by the user }
		{ Copy }
		if (option = 'copy') then
		begin
			WriteLn;
			WriteLn(' * So you want to copy files?');
			WriteLn;
			WriteLn(' Now Enter salsa (file source) :');
			Write(' > ');
			ReadLn(fileSource);
			WriteLn;
			WriteLn(' Enter the file destination (Where do you want me to throw it?) :');
			Write(' > ');
			ReadLn(fileDestination);

			{ Copy File Handling Codes }
			sourceFile := TFileStream.Create(fileSource, fmOpenRead);
			destinationFile := TFileStream.Create(fileDestination, fmCreate);
			destinationFile.CopyFrom(sourceFile, sourceFile.Size);
			sourceFile.Free;
			destinationFile.Free;
			
			{ Dialog Box / Prompt Box }
			WriteLn;
			Write(#9556);
			LongHorizontalLine();
			Write(#9559);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * (The application threw your file in the Recycle Bin.)                      ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * File copying failed ...                                                    ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * Just Kidding ;)                                                            ' + #9553);
			Write(#9553 + '                                                                              ' + #9553); 
			Write(#9553 + ' * File copying just finished. probably.                                      ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9562);
			LongHorizontalLine();
			Write(#9565);
			WriteLn;
			askAgain := false;
			monolouge := 0;
		end
		
		{ Move }
		else if (option = 'move') then
		begin
			WriteLn;
			WriteLn(' * Oh we are moving something, slide it in ~');
			WriteLn;
			WriteLn(' Now Enter salsa (file source) :');
			Write(' > ');
			ReadLn(fileSource);
			WriteLn;
			WriteLn(' Enter the file destination (Where the cutouts will be kept) :');
			Write(' > ');
			ReadLn(fileDestination);

			{ Move File Handling Codes }
			sourceFile := TFileStream.Create(fileSource, fmOpenRead);
			destinationFile := TFileStream.Create(fileDestination, fmCreate);
			destinationFile.CopyFrom(sourceFile, sourceFile.Size);
			sourceFile.Free;
			destinationFile.Free;
			DeleteFile(fileSource);
			
			{ Dialog Box / Prompt Box }
			WriteLn;
			Write(#9556);
			LongHorizontalLine();
			Write(#9559);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * (The application sliced your file into pieces.)                            ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * A file fragment flew away ...                                              ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * Moving finished. With an file integrity error - omg                        ' + #9553);
			Write(#9553 + '                                                                              ' + #9553); 
			Write(#9553 + ' * Operation almost got failed .. but you found the missing bits.             ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * Finishing operation ... your file was successfuly moved.                   ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9562);
			LongHorizontalLine();
			Write(#9565);
			WriteLn;
			askAgain := false;
			monolouge := 0;
		end
		
		{ Delete }
		else if (option = 'delete') then
		begin
			WriteLn;
			WriteLn(' * Oh boi, are you serious? just kidding go on..');
			WriteLn;
			WriteLn(' Now Enter salsa to be fed to the great doggo (file to be killed / deleted) :');
			Write(' > ');
			ReadLn(fileSource);
			WriteLn;
			WriteLn(' * Do you really want to delete this file? There is no turning back after this.      [yes] or [no]?');
			Write(' > ');
			ReadLn(option);
			WriteLn;
			If (option = 'yes') then
			begin
				DeleteFile(fileSource);
			end
			else if (option = 'no') then
			begin
				WriteLn(' * You changed your mind.');
			end
			else 
			begin
				WriteLn(' * A tactical way to escape ... spamming key(s)');
			end;
			
			{ Dialog Box / Prompt Box }
			WriteLn;
			Write(#9556);
			LongHorizontalLine();
			Write(#9559);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * (The application fed your file to the great doggo)                         ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * It seemed to be happy with the file he just ate..                          ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * The great doggo is now digesting your file.                                ' + #9553);
			Write(#9553 + '                                                                              ' + #9553); 
			Write(#9553 + ' * Allau Ahkbar! the file was successfuly deleted.                            ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9553 + ' * Finishing operation ... your file was successfuly ... fed.                 ' + #9553);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9562);
			LongHorizontalLine();
			Write(#9565);
			WriteLn;
			askAgain := false;
			monolouge := 0;
		end
		
		{ If the user types in something stupid, it will go through here. }
		else
		begin
			Write(#9556);
			LongHorizontalLine();
			Write(#9559);
			Write(#9553 + '                                                                              ' + #9553);
			
			{ The application will have different reply in every mistake you make, unless you make a good one ouo }
			if (monolouge = 0) then	
			begin
				Write(#9553 + ' * Ooops, you typed in a wrong option ... do you?                             ' + #9553);
				Write(#9553 + ' * I think you need to select another, what do you think?                     ' + #9553);
			end
			else if (monolouge = 1) then
			begin
				Write(#9553 + ' * Oooops, you did it again mate.                                             ' + #9553);
			end
			else if (monolouge = 2) then
			begin
				Write(#9553 + ' * Hmnn ... I don' + #39 + 't know why you keep doing this.                             ' + #9553);
			end
			else if (monolouge = 3) then
			begin
				Write(#9553 + ' * It' + #39 + 's possible that you have a problem.                                     ' + #9553);
			end
			else if (monolouge = 4) then
			begin
				Write(#9553 + ' * It continues.                                                              ' + #9553);
			end
			else if (monolouge = 5) then
			begin
				Write(#9553 + ' * Really...                                                                  ' + #9553);
				monolouge := 0;
				askAgain := false;
			end;
			
			Inc(monolouge, 1);
			Write(#9553 + '                                                                              ' + #9553);
			Write(#9562);
			LongHorizontalLine();
			Write(#9565);
			WriteLn;
		end;
	end;
	
	{ This is always shown in the end of the program, it marks the end of the application }
	WriteLn;
	WriteLn(' * Oh! I almost forgot to say that you need to "Press [Enter] key to continue."');
	ReadLn;
	
End.