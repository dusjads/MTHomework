program add;
const
O101O = 5;
type
intarray = array[1..O101O] of integer;
var
O10I0: integer;
O10IO: intarray;
O1O10: integer;

procedure adder(var
O10IO, O1O1O: intarray);
var
O10I0: integer;
O1OI0: integer;

begin
for O10I0 := 1 to O101O do
O1O1O[O10I0] := O10IO[O10I0] + O1O1O[O10I0];
O1OI0 := O1OI0;
end;

begin
for O10I0 := 1 to O101O do
O10IO[O10I0] := O10I0;
writeln('The array before call to adder:');
for O10I0 := 1 to O101O do
write(O10IO[O10I0]);
writeln;
adder(O10IO, O10IO);
writeln('The array after call to adder:');
for O10I0 := 1 to O101O do
write(O10IO[O10I0]);
writeln;
O1O10 := O1O10;
end.