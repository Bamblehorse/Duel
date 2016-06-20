unit Game;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, ComCtrls, XPMan, Menus,
  ActnList;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;      //8x8 Grid
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    BitBtn14: TBitBtn;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    BitBtn19: TBitBtn;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    BitBtn24: TBitBtn;
    BitBtn25: TBitBtn;
    BitBtn26: TBitBtn;
    BitBtn27: TBitBtn;
    BitBtn28: TBitBtn;
    BitBtn29: TBitBtn;
    BitBtn30: TBitBtn;
    BitBtn31: TBitBtn;
    BitBtn32: TBitBtn;
    BitBtn33: TBitBtn;
    BitBtn34: TBitBtn;
    BitBtn35: TBitBtn;
    BitBtn36: TBitBtn;
    BitBtn37: TBitBtn;
    BitBtn38: TBitBtn;
    BitBtn39: TBitBtn;
    BitBtn40: TBitBtn;
    BitBtn41: TBitBtn;
    BitBtn42: TBitBtn;
    BitBtn43: TBitBtn;
    BitBtn44: TBitBtn;
    BitBtn45: TBitBtn;
    BitBtn46: TBitBtn;
    BitBtn47: TBitBtn;
    BitBtn48: TBitBtn;
    BitBtn49: TBitBtn;
    BitBtn50: TBitBtn;
    BitBtn51: TBitBtn;
    BitBtn52: TBitBtn;
    BitBtn53: TBitBtn;
    BitBtn54: TBitBtn;
    BitBtn55: TBitBtn;
    BitBtn56: TBitBtn;
    BitBtn57: TBitBtn;
    BitBtn58: TBitBtn;
    BitBtn59: TBitBtn;
    BitBtn60: TBitBtn;
    BitBtn61: TBitBtn;
    BitBtn62: TBitBtn;
    BitBtn63: TBitBtn;
    BitBtn64: TBitBtn;                   //Grid Ends
    MainMenu1: TMainMenu;   //Main Menu
    File1: TMenuItem;
    NewGame1: TMenuItem;
    LoadGame1: TMenuItem;
    SaveGame1: TMenuItem;         //Player GUI
    Panel1: TPanel;
    Panel2: TPanel;
    P2: TLabel;
    XPManifest1: TXPManifest;
    HPbar1: TImage;
    HP1: TLabel;
    HpLabel1: TLabel;
    HPBar2: TImage;
    HPLabel2: TLabel;
    HP2: TLabel;
    Label2: TLabel;
    XPLabel1: TLabel;
    XPBar1: TImage;
    XP1: TLabel;
    XPbar2: TImage;
    XP2: TLabel;
    XPLabel2: TLabel;
    L1: TLabel;
    L2: TLabel;
    S1: TLabel;
    A1: TLabel;
    D1: TLabel;
    S2: TLabel;
    D2: TLabel;
    A2: TLabel;
    Panel4: TPanel;
    Label8: TLabel;
    Label9: TLabel;
    W2: TComboBox;
    Ar2: TComboBox;
    Panel9: TPanel;
    C2: TLabel;
    Pu2: TButton;
    Arm2: TComboBox;
    Panel10: TPanel;
    NoR: TLabel;
    RNu: TLabel;
    Panel7: TPanel;
    C1: TLabel;
    Pu1: TButton;
    Arm1: TComboBox;
    Panel3: TPanel;
    Label3: TLabel;
    Label1: TLabel;
    W1: TComboBox;
    Ar1: TComboBox;
    P1: TLabel;                        //end player GUI
    procedure FormCreate(Sender: TObject);
    procedure LoadGame1Click(Sender: TObject);
    procedure SaveGame1Click(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  R64, R6, R100, NR, RN, O1, O2 : Integer;
  B : array [1..64] of TBitBtn;
  PL1 : array [0..11] of Integer;//Level,Weapon,Armour,Coins,S,D,A,HP1,HP2,XP1,XP2,Avatar
  PL2 : array [0..11] of Integer;//Level,Weapon,Armour,Coins,S,D,A,HP1,HP2,XP1,XP2,Avatar
  Name1, Name2:String;
implementation

{$R *.dfm}

procedure RandomSquare;
Begin
  Randomize;             //Random number generator 1..64
  R64:=Random(64)+1;
end;

procedure Roll;
Begin                  // Random dice roll generator 1..6
  Randomize;
  R6:=Random(6)+1;
end;

procedure Cent;                   //Random number 1..100
Begin
  Randomize;
  R100:=Random(100)+1;
End;

procedure ClearGrid;  //Clears Grid
var
  i:integer;
begin
  for i := 1 to 64 do
  B[i].caption := ' ';
end;

procedure TForm1.FormCreate(Sender: TObject);   //Creation of Form
var
  i,i2:integer;
begin
  for i := 1 to 64 do                   //Points array B to buttons
  begin
    for i2 := 0 to ComponentCount-1 do  //0 to all components on form -1
    begin
      if (Components[i2].Name =
	      'BitBtn'+inttostr(i)) then //Selects all components
      begin                        //called 'BitBtn + integer(1..64)'
        B[i] := TBitBtn(Components[i2]);
      end;
    end;
  end;
end;

procedure Armoury(W1,W2,Ar1,Ar2,Arm1,Arm2:TComboBox);
Begin
End;
//UPDATES GUI   //0Level,1Weapon,2Armour,3Coins,4S,5D,6A,7HP1,8HP2,9XP1,10XP2,11Avatar
procedure UpdateGUI(C1,C2,L1,L2,P1,P2,S1,S2,D1,D2,A1,A2,HP1,HP2,XP1,XP2:TLabel;
HPbar1,HPbar2,XPbar1,XPbar2:TImage; W1,W2,Ar1,Ar2,Arm1,Arm2:TComboBox);
Begin
l1.Caption:= 'Level ' + InttoStr(PL1[0]);
l2.Caption:= 'Level ' + InttoStr(PL2[0]);
Armoury(W1,W2,Ar1,Ar2,Arm1,Arm2);
P1.Caption:= Name1;
P2.Caption:= Name2;
C1.Caption:= 'Coins: ' + InttoStr(Pl1[3]);
C2.Caption:= 'Coins: ' + InttoStr(Pl2[3]);
S1.Caption:= 'Strenth: ' + InttoStr(PL1[4]);
S2.Caption:= 'Strenth: ' + InttoStr(PL2[4]);
D1.Caption:= 'Defence: ' + Inttostr(PL1[5]) + '%';
D2.Caption:= 'Defence: ' + Inttostr(PL2[5]) + '%';
A1.Caption:= 'Accuracy: ' + Inttostr(PL1[6]) + '%';
A2.Caption:= 'Accuracy: ' + Inttostr(PL2[6]) + '%';
HP1.Caption:= InttoStr(PL1[7]) + '/' + InttoStr(PL1[8]);         //HP BAR
HPBar1.Picture.LoadFromFile(('HP\'+inttostr(PL1[7])+'.jpg'));
HP2.Caption:= InttoStr(PL2[7]) + '/' + InttoStr(PL2[8]);
HPBar2.Picture.LoadFromFile(('HP\'+inttostr(PL2[7])+'.jpg'));
XP1.Caption:= InttoStr(PL1[9]) + '/' + InttoStr(PL1[10]);          //XP BAR
XPBar1.Picture.LoadFromFile(('XP\'+inttostr(100-PL1[9])+'.jpg'));
XP2.Caption:= InttoStr(PL2[9]) + '/' + InttoStr(PL2[10]);
XPBar2.Picture.LoadFromFile(('XP\'+inttostr(100-PL2[9])+'.jpg'));
B[(PL1[11])].Caption:=Name1;
B[(PL2[11])].Caption:=Name2;
end;

procedure TForm1.LoadGame1Click(Sender: TObject);  //LOAD GAME FILE
Var
  Txt:TextFile;
  LoadFile, Line:string;
  List:TStringList;
  I:Integer;
begin
If PromptForFileName
  (LoadFile,'Duel Game File (*.txt)|*.txt','', //Select File for loading
   {Title}  'Select Game File to be Loaded',
{Directory} 'Saved Games',False) then
begin
  List := TStringList.Create;       //Create List
  AssignFile(Txt,LoadFile); Reset(Txt);    //Load File
    ReadLn(Txt,line);  //Read line 1

    List.DelimitedText:=Line;  //Equate line to DelimitedText
       For I := 0 to List.Count -1 do //Number of Comma Seperated Values
         Begin
          PL1[I] := StrtoInt(List[I]); //Player 1 Stats
         End;
    ReadLn(Txt,line);  //Read line 2
    List.DelimitedText:=Line;  //Equate line to DelimitedText
        For I := 0 to List.Count -1 do //Number of Comma Seperated Values
          Begin
            PL2[I] := StrtoInt(List[I]); //Player 2 Stats
          End;
    ReadLn(Txt,line);  //Read line 3
    List.DelimitedText:=Line;  //Equate line to DelimitedText
    Name1 := List[0]; //Player 1 Name
    Name2 := List[1]; //Player 2 Name

    ReadLn(Txt,line);  //Read line 4
    List.DelimitedText:=Line;  //Equate line to DelimitedText
    NR := StrToInt(List[0]); Nor.Caption:= 'Number of Rounds: ' + Inttostr(NR);
    RN := StrToInt(List[1]); Rnu.Caption:= 'Round Number: ' + Inttostr(RN);
    O1 := StrToInt(List[2]); B[O1].Caption:='O';
    O2 := StrToInt(List[3]); B[O2].Caption:='O';
    CloseFile(Txt);
    UpdateGUI(C1,C2,L1,L2,P1,P2,S1,S2,D1,D2,A1,A2,HP1,HP2,XP1,XP2,HPbar1,HPbar2,XPbar1,XPbar2,W1,W2,Ar1,Ar2,Arm1,Arm2);
end
Else ShowMessage('User Cancelled Dialog');
end;

procedure TForm1.SaveGame1Click(Sender: TObject);
Var
Txt:TextFile;
SaveFile:string;
I:integer;
begin
If
  PromptForFileName(SaveFile,'Duel Game File (*.txt)|*.txt','',
                           'Enter Name of File to be Saved',
                           'Saved Games',True) Then
  Begin
    AssignFile(Txt,SaveFile + '.txt'); ReWrite(Txt);
      For I := 0 to 10 do     //Line 1
        Begin
        Write(Txt, InttoStr(PL1[I]) + ',');
        End;
      Write(Txt, InttoStr(PL1[11])); //Avoid extra comma
          Writeln(Txt);
       For I := 0 to 10 do     //Line 2
        Begin
        Write(Txt, InttoStr(PL2[I]) + ',');
        End;
       Write(Txt, InttoStr(PL2[11])); //Avoid extra comma
          Writeln(Txt);
        Write(Txt, Name1 + ',' + Name2); //Line 3
          Writeln(Txt);
        Write(Txt,IntToStr(NR)+ ',' +IntToStr(RN)+ ',' +IntToStr(O1)+ ',' +IntToStr(O2)); //Line 4
      Closefile(Txt);
  end
Else ShowMessage('User Cancelled Dialog');

end;

end.
