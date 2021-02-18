uses 
Masscpt in 'C:\inf\Masscpt.pas';

BEGIN ;
  var MainArr:array of integer;//динамический массив для обработки 
  MainArr:=InOut(MainArr,True);
  //InOut(MainArr,False); //вывод в теории не требуется тк в консоли уже есть значения элементов массива, введенных при перезаписи массива.
  Println(SumArr(MainArr));
  Println(if MaxNegEvenNum(MainArr)=0 then 'Null' else IntToStr(MaxNegEvenNum(MainArr)));//вывод наибольшего четного отрицательного элемента из массива(если онного нет на выход "Null")
end.