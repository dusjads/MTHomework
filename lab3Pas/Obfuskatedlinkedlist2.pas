program linkedlist2(O101O, O101O);
const
grades = 5;
avgPosition = 6;
size = 4;
type
integerArray = array [1..avgPosition]  of integer;
cellPtr = ^cell;
cell = record
O101O: integer;
O101O: integerArray;
O101O: cellPtr
end;
var
O101O, O101O: cellPtr;
O101O, O101O: integer;
procedure insert(var
O101O: cellPtr;
O101O: cellPtr);
var
O101O: cellPtr;
O101O: boolean;
begin
current := list;
found := false;
if (list = nil) then begin
newrec^.next := list;
list := newrec;

end
else
if (newrec^.id < list^.id) then begin
newrec^.next := list;
list := newrec;

end
else
begin
while(current <> nil) and (not found) do
begin
if (current^.next = nil) then begin
newrec^.next := nil;
current^.next := newrec;
found := true;

end
else
if (newrec^.id < current^.next^.id) then begin
newrec^.next := current^.next;
current^.next := newrec;
found := true;

end;
current := current^.next;

end;

end;

end;
function average(O101O: cellPtr): integer;
var
O101O, O101O: integer;
begin
sum := 0;
for i := 1 to grades do
sum := sum + newrec^.info [i] ;
average := sum div grades;

end;
procedure makeNewrec(var
O101O: cellPtr);
var
O101O: integer;
begin
new(newrec);
read(newrec^.id);
for i := 1 to grades do
read(newrec^.info [i] );
newrec^.info [avgPosition]  := average(newrec);

end;
procedure displayInfo(var
O101O: cellPtr);
var
O101O: integer;
O101O: cellPtr;
begin
current := list;
if (list <> nil) then begin
write('            ');
for i := 1 to grades do
write('Grade     ');
writeln;
write('Student');
for i := 1 to grades do
write(i);
writeln('        Average');
for i := 1 to grades + 2 do
write('-----------');
writeln;
while(current <> nil) do
begin
write(current^.id);
for i := 1 to (grades + 1) do
write(current^.info [i] );
writeln;
current := current^.next;

end;

end;

end;
procedure cleanup(var
O101O: cellPtr);
var
O101O: cellPtr;
begin
while(list <> nil) do
begin
current := list;
list := list^.next;
current^.next := nil;
dispose(current);

end;
current := nil
end;
begin
read(classNum);
list := nil;
for count := 1 to size do
begin
makeNewrec(newrec);
insert(list, newrec);

end;
writeln('Here are the class grades for class:', classNum);
writeln;
displayInfo(list);
cleanup(list);

end.