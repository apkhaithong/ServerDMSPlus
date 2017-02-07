unit Functn01;

interface
uses  DBTables,DBITypes,DBIProcs, SysUtils,DB,Math,winsock,classes,windows;
  // Round Decimal (amt :�觤��;Dec:�ȹ���;Ramt :�Ѻ���)
 // Function FRound(Amt:Double;Dec:Integer):Double;
  Function FRound(Amt:Double;Dec:word):Double; 
  Function Next_Mth(Dte_a,Fdate_a:Tdatetime;Tupay_a:Double):TdateTime;
  procedure ClearAsFloat(DataSet: TDataSet);
  procedure ClearAsString(DataSet: TDataSet);
  // ����¹����Ţ�繵���ѡ��}
  Procedure ChgNtoS(Var Amt:String);
  Procedure ChqNum(Var WordAmt:String;Expamt:Longint);
  Procedure MainChg(Var WordAmt:String;Totamt:Double);
  function IsWindows64: Boolean;
        { ������¡�� [MainChg(WordAmt,TotAmt);]
          WordAmt = �׹��ҷ�����ѡ�� , TotAmt = �觤���繵���Ţ}
  // ����¹�ѹ����繵���ѡ��}
  Procedure ChqDatetoS(Var Day1,Month1,Year1:String; Chang:Integer; ValueDate:TDateTime);

//  Procedure ChqDatetoS(Var WordDate:String;ValueDate:TDateTime);
       { ������¡�� [ChqDatetoS(WordDate,ValueDate);]
         WordDate = �׹��ҷ�����ѡ�� , ValueDate = �觤�����ѹ���}

  Procedure LDay(Var Day1:String;ValueDate:TDateTime );
  procedure SetLang(Lang:string);
implementation

function IsWindows64: Boolean;
type
  TIsWow64Process = function(AHandle:THandle; var AIsWow64: BOOL): BOOL; stdcall;
var
  vKernel32Handle: DWORD;
  vIsWow64Process: TIsWow64Process;
  vIsWow64       : BOOL;
begin
  // 1) assume that we are not running under Windows 64 bit
  Result := False;

  // 2) Load kernel32.dll library
  vKernel32Handle := LoadLibrary('kernel32.dll');
  if (vKernel32Handle = 0) then Exit; // Loading kernel32.dll was failed, just return

  try

    // 3) Load windows api IsWow64Process
    @vIsWow64Process := GetProcAddress(vKernel32Handle, 'IsWow64Process');
    if not Assigned(vIsWow64Process) then Exit; // Loading IsWow64Process was failed, just return

    // 4) Execute IsWow64Process against our own process
    vIsWow64 := False;
    if (vIsWow64Process(GetCurrentProcess, vIsWow64)) then
      Result := vIsWow64;   // use the returned value

  finally
    FreeLibrary(vKernel32Handle);  // unload the library
  end;
end;

procedure SetLang(Lang:string);
var Layout: array [0.. KL_NAMELENGTH] of char;
begin
  if lowerCase(Lang)='thai' then
  begin
    LoadKeyboardLayout(StrCopy(Layout, '0000041E'), KLF_ACTIVATE);
  end
  else if lowerCase(Lang)='eng' then
    LoadKeyboardLayout(StrCopy(Layout, '00000409'), KLF_ACTIVATE);
end;


Procedure ChqDatetoS(Var Day1,Month1,Year1:String; Chang:Integer; ValueDate:TDateTime);
Var  day,month,year : Word;
begin
  DecodeDate(ValueDate, Year, Month, Day);
  Case Chang of
    1 : Begin
          Case Month of
            1 : month1 := '01';
            2 : month1 := '02';
            3 : month1 := '03';
            4 : month1 := '04';
            5 : month1 := '05';
            6 : month1 := '06';
            7 : month1 := '07';
            8 : month1 := '08';
            9 : month1 := '09';
           10 : month1 := '10';
           11 : month1 := '11';
           12 : month1 := '12';
          End;
          Day1  := InttoStr(Day);
          Year1 := Inttostr(year+543);
        End;
    2 : Begin
          Case Month of
            1 : month1 := '���Ҥ�';
            2 : month1 := '����Ҿѹ��';
            3 : month1 := '�չҤ�' ;
            4 : month1 := '����¹';
            5 : month1 := '����Ҥ�';
            6 : month1 := '�Զع�¹';
            7 : month1 := '�á�Ҥ�';
            8 : month1 := '�ԧ�Ҥ�';
            9 : month1 := '�ѹ��¹';
           10 : month1 := '���Ҥ�';
           11 : month1 := '��Ȩԡ�¹';
           12 : month1 := '�ѹ�Ҥ�';
          End;
          Day1  := InttoStr(Day);
          Year1 := inttostr(year+543);
        end;
    3 : Begin
          Case Month of
            1 : month1 := '�.�.';
            2 : month1 := '�.�.';
            3 : month1 := '��.�.';
            4 : month1 := '��.�.';
            5 : month1 := '�.�.';
            6 : month1 := '��.�.';
            7 : month1 := '�.�.';
            8 : month1 := '�.�.';
            9 : month1 := '�.�.';
           10 : month1 := '�.�.';
           11 : month1 := '�.�.';
           12 : month1 := '�.�.';
          End;
          Day1  := InttoStr(Day);
          Year1 := Inttostr(year+543);
        End;
  End;
end;

Procedure ChgNtoS(Var Amt:String);
begin
   if Amt = '0' then Amt := '';
   if Amt = '1' then Amt := '˹��';
   if Amt = '2' then Amt := '�ͧ';
   if Amt = '3' then Amt := '���';
   if Amt = '4' then Amt := '���';
   if Amt = '5' then Amt := '���';
   if Amt = '6' then Amt := 'ˡ';
   if Amt = '7' then Amt := '��';
   if Amt = '8' then Amt := 'Ỵ';
   if Amt = '9' then Amt := '���';
end;

Procedure LDay(Var Day1:String;ValueDate:TDateTime );
Var  day,month,year : Word;
begin
   DecodeDate(ValueDate, Year, Month, Day);
   Case Month of
       1 : Day1 := '31';
       2 : Day1 := '28';
       3 : Day1 := '31';
       4 : Day1 := '30';
       5 : Day1 := '31';
       6 : Day1 := '30';
       7 : Day1 := '31';
       8 : Day1 := '31';
       9 : Day1 := '30';
       10 : Day1 := '31';
       11 : Day1 := '30';
       12 : Day1 := '31';
   End;
   If (Round(Year/4)*4 = year) and
      (Month = 2) Then
      Day1 := '29' ;
end;

Procedure ChqNum(Var WordAmt:String;Expamt:Longint);
Var Num    : LongInt;
    Amt    : String;
    ChkOne : Boolean;
begin
       ChkOne := False;
       if (expamt >= 10) and (expamt < 20) then
       begin
             Wordamt := '�Ժ';
             ExpAmt  := Trunc(ExpAmt) mod 10;
             if ExpAmt = 1 then
                   ChkOne := True;
       end;
       while (expamt > 0) do
         begin
            if expamt >= 1000000 then
              begin
                Num := Trunc(expamt) div 1000000;
                Amt := inttostr(Num);
                ChgNtoS(Amt);
                Amt := Amt + '��ҹ';
                ExpAmt  := Trunc(ExpAmt) mod 1000000;
              end
            else
              if (expamt >= 100000) and (expamt < 1000000) then
              begin
                Num := Trunc(expamt) div 100000;
                Amt := inttostr(Num);
                ChgNtoS(Amt);
                Amt := Amt + '�ʹ';
                ExpAmt  := Trunc(ExpAmt) mod 100000;
              end
            else
              if (expamt >= 10000) and (expamt < 100000) then
              begin
                Num := Trunc(expamt) div 10000;
                Amt := inttostr(Num);
                ChgNtoS(Amt);
                Amt := Amt + '����';
                ExpAmt  := Trunc(ExpAmt) mod 10000;
              end
            else
              if (expamt >= 1000) and (expamt < 10000) then
              begin
                Num := Trunc(expamt) div 1000;
                Amt := inttostr(Num);
                ChgNtoS(Amt);
                Amt := Amt + '�ѹ';
                ExpAmt  := Trunc(ExpAmt) mod 1000;
              end
            else
              if (expamt >= 100) and (expamt < 1000) then
              begin
                Num := Trunc(expamt) div 100;
                Amt := inttostr(Num);
                ChgNtoS(Amt);
                Amt := Amt + '����';
                ExpAmt  := Trunc(ExpAmt) mod 100;
              end
            else
              if (expamt >= 10) and (expamt < 100) then
              begin
                Num := Trunc(expamt) div 10;
                if ( Num = 2 ) then
                  begin
                     Amt := '����Ժ';
                     ExpAmt  := Trunc(ExpAmt) mod 10;
                  end
                else
                  begin
                     Amt := inttostr(Num);
                     If Amt<>'1' Then
                     Begin
                      ChgNtoS(Amt);
                      Amt := Amt + '�Ժ';
                     End
                     Else
                     Amt := '�Ժ';
                     ExpAmt  := Trunc(ExpAmt) mod 10;
                  end;
                if ExpAmt = 1 then
                   ChkOne := True;
              end
            else
              if (expamt >= 1) and (expamt < 10) then
              begin
                Num := Trunc(expamt) div 1;
                Amt := inttostr(Num);
                ChgNtoS(Amt);
                Amt := Amt;
                ExpAmt  := Trunc(ExpAmt) mod 1;
                if ChkOne = True then
                  Amt := '���';
              end;
            WordAmt := Wordamt + Amt;
         end;
end;

Procedure MainChg(Var WordAmt:String;Totamt:Double);
Var Tempstr,AMT,WORDTot,WordNum,WordDec,WDecamt    : String;
    expamt,Million,Decimal,ExpZero : longint;
begin
         WORDAMT := '';
         WordTot := FloattoStrF(TotAmt,ffFixed,15,2);
         WordNum := Copy(WordTot,1,Pos('.',WordTot)-1);
         ExpZero := Strtoint(WordNum) ;
         WordDec := Copy(WordTot,Pos('.',WordTot)+1,2);//(Length(WordTot)-Pos('.',WordTot)));
         Expamt  := Strtoint(WordNum);
         Decimal := Strtoint(WordDec);
         If ExpZero = 0 Then
            WordAmt := '�ٹ��ҷ'
         else
         Begin
            if (expamt >= 1000000)  then
            begin
               If (expamt > 1000000)  then
               begin
                 million := (expamt div 1000000);
                 expamt  := (expamt - (million * 1000000));
                 ChqNum(WordAmt,million);
                 WordAmt := WordAmt + '��ҹ' ;
               end
               else
               begin
                 million := (expamt div 1000000);
                 expamt  := (expamt - (million * 1000000));
                 ChqNum(WordAmt,million);
                 WordAmt := WordAmt + '��ҹ�ҷ' ;
               end;
            end;
            if (expamt > 0 ) and (expamt < 1000000) then
            begin
                ChqNum(WordAmt,Expamt);
                if (Decimal <= 0) then
                   WordAmt := WordAmt + '�ҷ'
                else
                   WordAmt := WordAmt + '�ҷ' ;
            end;
         end;
         if (Decimal > 0 ) then
         begin
               //ChqNum(WordAmt,Decimal);
             WDecamt:='';
             ChqNum(WDecamt,Decimal);
             WordAmt := WordAmt +WDecamt+ 'ʵҧ��' ;
         end
         else
             WordAmt := WordAmt +'��ǹ';
end;

{Function FRound(Amt:Double;Dec:Integer):Double;
var amt1 : double;
begin
  setroundmode(rmdown);
  amt1 := roundto(Amt,-(Dec+1));
  setroundmode(rmnearest);
  FRound := roundto(Amt1,-(Dec));
  //FRound := StrTofloat(Floattostrf(amt+0.0005,ffFixed,15,Dec));
end; }
Function FRound(Amt:Double;Dec:word):Double;
Var Tmp:Double;
begin
  FRound := StrTofloat(Floattostrf(amt+0.0005,ffFixed,15,Dec));
end;

Function Next_Mth(Dte_a,Fdate_a:Tdatetime;Tupay_a:Double):TdateTime;
Var Mon : Array[1..12] of Integer;
    Year1,Year2: double;
    K,M,C,D,MDay,Mn,Yr:Integer;
    S:String;
begin
  Mon[1] := 31;
  Mon[2] := 28;
  Mon[3] := 31;
  Mon[4] := 30;
  Mon[5] := 31;
  Mon[6] := 30;
  Mon[7] := 31;
  Mon[8] := 31;
  Mon[9] := 30;
  Mon[10] := 31;
  Mon[11] := 30;
  Mon[12] := 31;
  S     := copy(datetostr(Dte_a),7,4);
  Yr    := StrtoInt(S) ;
  Year1 := Strtofloat(S)/4;
  S     := FloatToStrF(Year1,ffFixed,15,2);
  Year1 := StrTofloat(S);
  Year2 := int(Year1);
  If Year1=Year2 Then
    Mon[2] :=29
  Else
    Mon[2] :=28;
  C := StrToint(copy(datetostr(FDate_a),1,2));
  D := StrToint(copy(datetostr(Dte_a),1,2));
  M := StrToint(copy(datetostr(Dte_a),4,2));
  Mn:= Strtoint(Floattostr(Tupay_a));
  K := M+Mn;
  If K>12 Then
  begin
    K  := K-12;
    Yr := Yr + 1 ;
  end;
  Mday := Mon[K] ;
  If C > D Then D := C ;
  If D > Mday Then D := Mday ;
  Result := EncodeDate(Yr, K, D);
end;

procedure ClearAsFloat(DataSet: TDataSet);
Var S:String;
    I:Integer;
begin
  For I:= 0 to DataSet.FieldCount-1 Do
  begin
    If (DataSet.Fields[I].dataType = ftFloat) and
       (DataSet.Fields[I].Isnull) Then
    begin
      S := DataSet.Fields[I].FieldName;
      DataSet.Fieldbyname(S).Asfloat := 0;
    end;
  End;
end;

procedure ClearAsstring(DataSet: TDataSet);
Var S:String;
    I:Integer;
begin
  For I:= 0 to DataSet.FieldCount-1 Do
  begin
    If (DataSet.Fields[I].dataType = ftstring) and
       (DataSet.Fields[I].Isnull) Then
    begin
      S := DataSet.Fields[I].FieldName;
      DataSet.Fieldbyname(S).Asstring := '';
    end;
  End;
end;

end.
