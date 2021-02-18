uses 
Masscpt in 'C:\inf\Masscpt.pas';

begin
  var a:array of integer;
  var b:array of integer;
  var c:array of integer;
  var (m,n):=(0,0);
  a:=inout(a,true);
  b:=inout(b,true);
  //SortMass(a,true);
  //SortMass(b,true);
  println(Length(a)+Length(b));
  SetLength(c,Length(a)+Length(b));
  for var i:=0 to Length(a)+Length(b)-1 do begin
    if (a[n]<b[m]) and (n<m) then begin
      c[i]:=a[n];
      if n < Length(a)-1 then
      n+=1;
   end else begin
      c[i]:=b[m];
      if  m < Length(b)-1 then
      m+=1;
    end;
    end;
    inout(c,false);
end.