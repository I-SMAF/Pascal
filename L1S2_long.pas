program L2S2;
function TryReadInteger(key:Boolean):Integer; //функция проверяющая исключения на ввод челочисленных переменных
begin //для ввода целых положительных и целых любых чисел
   var a:=-MaxInt; //переменная для контроля для контроля изменения значения
   if key = True then begin //если ключ "истинный" на ввод будут восприниматься только целые положителные числа
    while a <=0 do begin //исключение отрицательных чисел на ввод
        try
          a:=ReadInteger;
        except //исключение остальных ошибок ввода
          on  System.FormatException do
        end;
      end;
    end else begin //если ключ не "истинный" на ввод принимается лютое целое число
      while a = -MaxInt do begin
        try
          a:=ReadInteger;
        except //исключение остальных ошибок ввода
          on  System.FormatException do
        end;
      end;
    end;
    TryReadInteger:=a; //возврат значение прошедшего проверку
end;

function InOut(arr:array of Integer; key:Boolean):array of Integer; //фунция задаци массива и вывода массива
begin //задать, перезадать, вывести можно любой массив
  if key = True then begin //если ключ "истинный" просходит перезапись массива с новыми границами
    var n:Integer; //переменная для ограничения массива
    n:=TryReadInteger(True);
    SetLength(arr,n); //ограничение массива
    for var i:=0 to n-1 do begin //перезапись массива
      arr[i]:=TryReadInteger(false);
    end;
    InOut:=arr; //возвращение значения массива
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
  var max:=-MaxInt;//так как присвоить к фунции типа (array of int):int обычное число нельза вводим контрольную переменную
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

BEGIN
  var MainArr:array of integer;//динамический массив для обработки
  MainArr:=InOut(MainArr,True);
  //InOut(MainArr,False);
  //вывод в теории не требуеться тк в консоли уже есть значения элементов массиваа, введенных при перезаписи массива.
  Println(SumArr(MainArr));
  Println(if MaxNegEvenNum(MainArr)=0 then 'Null' else IntToStr(MaxNegEvenNum(MainArr)));//вывод наибольшиго четного отрицательного элемента из массива(если онного нет на выход "Null")
end.
{@I_SMAF}