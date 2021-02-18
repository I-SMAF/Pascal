uses
Masscpt in 'Masscpt.pas';
begin
  var a:array of integer;
  var b:array of integer;
  a:=inout(a,true);
  b:=inout(b,true);
  inout(MultiplexMass(a,b),false);
end.
