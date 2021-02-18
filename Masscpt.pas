Unit Masscpt;

function MassCount(arr:array of integer; a:integer):integer;
begin
  if a < Length(arr)-1 then begin
    a+=1;
  end;
  MassCount:=a;
end;

function TryReadInteger(key:Boolean):Integer; //функция проверяющая исключения на ввод целочисленных переменных
begin //для ввода целых положительных и целых любых чисел
  var a:=-MaxInt; //переменная для контроля изменения значения
  if key = True then begin //если ключ "истинный" на ввод будут восприниматься только целые положительные числа
    while a <=0 do begin //исключение отрицательных чисел на ввод
        try
          a:=ReadInteger;
        except //исключение остальных ошибок ввода
          on  System.FormatException do
      end;
    end;
  end else begin //если ключ не "истинный" на ввод принимается любое целое число
    while a = -MaxInt do begin
      TryRead(a);
    end;
  end;
  TryReadInteger:=a; //возврат значение прошедшего проверку
end;

function InOut(arr:array of Integer; key:Boolean):array of Integer; //функция задачи массива и вывода массива
begin //задать, перезадать, вывести можно любой массив
  if key = True then begin //если ключ "истинный" происходит перезапись массива с новыми границами
    var n:Integer; //переменная для ограничения массива
    n:=TryReadInteger(True);
    SetLength(arr,n); //ограничение массива
    for var i:=0 to n-1 do begin //перезапись массива
      arr[i]:=TryReadInteger(false);
    end;
    InOut:=arr; //возвращение  значения массива
  end else begin //если ключ не "истинный" происходит вывод массива в консоль
    for var i:=0 to Length(arr)-1 do begin
      arr[i].Print;
    end;
    Println();
  end;
end;

function SumArr(arr:array of Integer):Integer;//функция суммирования всех элементов массива
begin
  for var i:=0 to Length(arr)-1 do begin
    SumArr+=arr[i];
  end;
end;

function MaxNegEvenNum(arr:array of Integer):Integer;//функция поиска наибольшего четного отрицательного числа
begin
  var max:=-MaxInt;//так как присвоить к функции типа (array of int):int обычное число нельзя вводим контрольную переменную
  for var i:=0 to Length(arr)-1 do begin//поиск...
    if (arr[i]>max) and (arr[i]<0) and (arr[i].IsEven) then begin
      max:=arr[i];
    end;
  end;
  if max>-MaxInt then begin //контроль наличия числа попавшего под условие
    MaxNegEvenNum:=max;
  end else begin
    MaxNegEvenNum:=0;
  end;
end;

function SortMass(arr:array of integer;key:boolean):array of integer;
begin
  if key = true then begin
    for var i:=0 to Length(arr)-1 do begin
      for var j:=0 to Length(arr)-2-i do begin
        if arr[j+1] < arr[j] then begin
          Swap(arr[j], arr[j+1]);
          end;
      end;
      end;
  end else begin
    for var i:=0 to Length(arr)-1 do begin
      for var j:=0 to Length(arr)-2-i do begin
        if arr[j+1] > arr[j] then begin
          Swap(arr[j], arr[j+1]);
        end;
      end;
    end;
  end;
  SortMass:=arr;
end;

function MultiplexMass(arrA,arrB:array of integer):array of Integer;
begin
var (m,n):=(0,0);
var arrC:array of integer;
SetLength(arrC,Length(arrA)+Length(arrB));
for var i:=0 to Length(arrC)-1 do begin
  arrC[i]:=MaxInt;
end;
for var i:=0 to Length(arrC)-1 do begin
  if (arrA[n]<arrB[m]) then begin
    Swap(arrC[i],arrA[n]);
    n:=MassCount(arrA,n);
  end else begin
    Swap(arrC[i],arrB[m]);
    m:=MassCount(arrB,m);
  end;
end;
MultiplexMass:=arrC;
end;

end.
{@I_SMAF}
