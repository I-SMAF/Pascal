Unit Masscpt;

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
    for var i:=0 to arr.High do begin
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

function MassCount(arr:array of integer; a:integer):integer; //счётчик элементовмассива вне циклической зависимости
begin
  if a < arr.High then begin
    a+=1;
  end;
  MassCount:=a;
end;

function MaxNegEvenNum(arr:array of Integer):Integer;//функция поиска наибольшего четного отрицательного числа
begin
  var max:=-MaxInt;//так как присвоить к функции типа (array of int):int обычное число нельзя вводим контрольную переменную
  for var i:=0 to arr.High do begin//поиск...
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

function SortMass(arr:array of integer;key:boolean):array of integer; //сортировка массива
begin
  if key = true then begin //если ключ "истинный" происходит сортировка по возростанию 
    for var i:=0 to arr.High do begin //пузырик,ибо нефиг.
      for var j:=0 to arr.High-1-i do begin
        if arr[j+1] < arr[j] then begin
          Swap(arr[j], arr[j+1]);
          end;
      end;
      end;
  end else begin//если ключ не "истинный" происходит сортировка по убыванию 
    for var i:=0 to arr.High do begin //пузырик,ибо нефиг.Х2
      for var j:=0 to arr.High-1-i do begin
        if arr[j+1] > arr[j] then begin
          Swap(arr[j], arr[j+1]);
        end;
      end;
    end;
  end;
  SortMass:=arr;//возвращение значению функции итогового массива
end;

function MultiplexMass(arrA,arrB:array of integer):array of Integer;//слияние сортирующее отсортированные массивы,
begin//знаю,звучит сложно, блок-схема прилагается
  var (m,n):=(0,0);//ндивидуальные счётчики для массивов 
  var arrC:array of integer;//итоговы массив(его резерв тк запись напрямую в фунцию невозможна)
  SetLength(arrC,Length(arrA)+Length(arrB));
  arrC.Fill(MaxInt);//заполнение всех яйчеек массива максимальным элементом
  for var i:=0 to arrC.High do begin //слияние
    if (arrA[n]<arrB[m]) then begin//поэлементное сравнение значений массивов
      Swap(arrC[i],arrA[n]);//смена элементов  сминимального на максимальный для выхода из условия
      n:=MassCount(arrA,n);//измененение значение счёстчика 
    end else begin
      Swap(arrC[i],arrB[m]);//смена элементов  сминимального на максимальный для выхода из условия
      m:=MassCount(arrB,m);//измененение значение счёстчика
    end;
  end;
  MultiplexMass:=arrC;//возвращение значению функции итогового массива
end;

{недоработанный метод сортировки
Сортировка слиянием !!! изучть 

function MergeSortImpl(arr,buffer:array of integer;l,r:integer):array of integer; 
begin
  if l < r then begin
    var m:=(l+r) div 2;
    MergeSortImpl(arr, buffer, l, m);
    MergeSortImpl(arr, buffer, m + 1, r);

    var k:= l;
    var j:=m + 1;
    var i:=0;
    while (i <= m) or (j <= r) do begin   
      if (j > r) or ((i <= m) and (arr[i] < arr[j])) then begin
        buffer[k]:= arr[i];
        i+=1;
      end else begin
        buffer[k]:= arr[j];
        j+=1;
      end;
      k+=1;
    end;
    for var h:=l to r do begin
      arr[h]:= buffer[h];
    end;
  end;
MergeSortImpl:=arr;
end;

function MergeSortMass(arr:array of integer):array of integer;
begin
  var buffer:=arr;
  MergeSortMass:=MergeSortImpl(arr, buffer, 0, arr.High);
end;
} 

{ Фунция исключена в связи с наличием сисемного аналога (.Sum)

function SumArr(arr:array of Integer):Integer;//функция суммирования всех элементов массива
begin
  for var i:=0 to arr.High do begin
    SumArr+=arr[i];
  end;
end;}
end.
{@I_SMAF}