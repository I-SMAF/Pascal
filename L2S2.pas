uses
Masscpt in 'Masscpt.pas';

begin
  var a:array of integer;
  var b:array of integer;
  a:=SortMass(inout(a,true),true);
  b:=SortMass(inout(b,true),true);
  inout(MultiplexMass(a,b),false);
end.
{@I_SMAF}