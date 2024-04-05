#!/bin/bash
#=====================================================================================
fmSedCommand()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 32);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=32;fi
 if [[ $aa -gt 32 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=32;fi
 if [[ $j1 -gt 32 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 32 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=42; a++ ))
  do
   echo -e "\e[${a};1H\e[34m\xE2\x94\x82                                                                                \xE2\x94\x82\e[0m"
  done
 echo -en "\e[1;1H\e[34m┌────────────────────────────────────────────────────────────────────────────────┐\e[0m";
 echo -en "\e[2;2H\e[36m COMMAND\e[0m                                                                Команды\e[0m";
 echo -en "\e[3;2H\e[2m Это всего лишь краткий обзор команд sed, который послужит напоминанием тем,\e[0m";
 echo -en "\e[4;2H\e[2m кто уже знает sed. Для получения более полных описаний необходимо обратиться\e[0m";
 echo -en "\e[5;2H\e[2m к другой документации (например, к документу texinfo).\e[0m";
 echo -en "\e[6;1H\e[34m├─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ \e[36m Zero-address \`\`commands''\e[0m\e[34m ─┤\e[0m";
 echo -en "\e[10;1H\e[34m├─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ \e[36m Команды с нулевым или одним адресом \e[0m\e[34m─┤\e[0m";
 echo -en "\e[20;1H\e[34m├─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─ ─\e[36m Команды, принимающие диапазоны адресов \e[0m\e[34m─┤\e[0m";
 echo -en "\e[41;1H\e[34m├─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────┤\e[0m";
 echo -en "\e[43;1H\e[34m└────────────────────────────────────────────────────────────────────────────────┘\e[0m";
}
  E0(){ echo -en "\e[7;2H Label for b and t commands.                                         \e[32m : label \e[0m";}
  E1(){ echo -en "\e[8;2H Комментарий продолжается до следующей новой строки                 \e[32m #comment \e[0m";}
  E2(){ echo -en "\e[9;2H Закрывающая скобка блока { }                                              \e[32m } \e[0m";}
  E3(){ echo -en "\e[11;2H Print the current line number                                             \e[32m = \e[0m";}
  E4(){ echo -en "\e[12;2H                                                                         \e[32m a \\ \e[0m";}
  E5(){ echo -en "\e[13;2H Добавить текст, в котором предшествует обратная косая черта            \e[32m text \e[0m";}
  E6(){ echo -en "\e[14;2H                                                                         \e[32m i \\ \e[0m";}
  E7(){ echo -en "\e[15;2H Вставьте текст, в котором предшествует обратная косая черта            \e[32m text \e[0m";}
  E8(){ echo -en "\e[16;2H Закроет сценарий sed                                          \e[32m q [exit-code] \e[0m";}
  E9(){ echo -en "\e[17;2H Закроет сценарий sed                                          \e[32m Q [exit-code] \e[0m";}
 E10(){ echo -en "\e[18;2H Добавить текст, прочитанный из имени файла                       \e[32m r filename \e[0m";}
 E11(){ echo -en "\e[19;2H Добавьте строку, прочитанную из имени файла                      \e[32m R filename \e[0m";}
 E12(){ echo -en "\e[21;2H Начинает блок команд (заканчивается символом })                           \e[32m { \e[0m";}
 E13(){ echo -en "\e[22;2H Ветвь для метки                                                     \e[32m b label \e[0m";}
 E14(){ echo -en "\e[23;2H                                                                         \e[32m c \\ \e[0m";}
 E15(){ echo -en "\e[24;2H Замените выбранные строки текстом                                      \e[32m text \e[0m";}
 E16(){ echo -en "\e[25;2H Delete pattern space. Start next cycle                                    \e[32m d \e[0m";}
 E17(){ echo -en "\e[26;2H Если пространство шаблонов не содержит новой строки                       \e[32m D \e[0m";}
 E18(){ echo -en "\e[27;2H Скопируйте/добавьте пространство шаблона, чтобы сохранить место         \e[32m h H \e[0m";}
 E19(){ echo -en "\e[28;2H Скопируйте/добавьте пространство удержания в пространство шаблона       \e[32m g G \e[0m";}
 E20(){ echo -en "\e[29;2H Перечислите текущую строку в \`\`visually unambiguous'' форме               \e[32m l \e[0m";}
 E21(){ echo -en "\e[30;2H Перечислите текущую строку в \`\`visually unambiguous'' форме         \e[32m l width \e[0m";}
 E22(){ echo -en "\e[31;2H Прочитайте/добавьте следующую строку ввода в пространство шаблонов      \e[32m n N \e[0m";}
 E23(){ echo -en "\e[32;2H Распечатайте текущее пространство шаблона                                 \e[32m p \e[0m";}
 E24(){ echo -en "\e[33;2H Выведите до первой встроенной новой строки текущего пространства шаблонов \e[32m P \e[0m";}
 E25(){ echo -en "\e[34;2H s/регулярное выражение/замена/                        \e[32m s/regexp/replacement/ \e[0m";}
 E26(){ echo -en "\e[35;2H Если s/// выполнил успешную замену с момента чтения последней строки\e[32m t label \e[0m";}
 E27(){ echo -en "\e[36;2H Если ни один s/// не выполнил успешную замену чтения входной строки \e[32m T label \e[0m";}
 E28(){ echo -en "\e[37;2H Записать текущее пространство шаблонов в имя файла               \e[32m w filename \e[0m";}
 E29(){ echo -en "\e[38;2H Запишите первую строку текущего пространства шаблонов в имя файла\e[32m W filename \e[0m";}
 E30(){ echo -en "\e[39;2H Поменяйте содержимое пространств удержания и шаблона                      \e[32m x \e[0m";}
 E31(){ echo -en "\e[40;2H Транслитерировать символы в пространстве шаблонов            \e[32m y/source/dest/ \e[0m";}
 E32(){ echo -en "\e[42;2H                                                                        \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[1;37m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[1;37m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Комментарий продолжается до следующей новой строки
 (или конца фрагмента сценария -e).
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[1;37m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[1;37m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Вызвать sed, использовав команду = , утилита выведет номера строк в потоке данных:
\e[32m sed \"=\" file.txt\e[0m

 выведены будут только номера строк, соответствующих шаблону:
\e[32m sed -n \"/test/=\" file.txt\e[0m

 Нумерует строки в file.txt:\e[32m sed = file.txt / sed \"N;s/\\\n/\\\t/\"\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[1;37m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[1;37m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить текст, в котором каждой встроенной новой строке предшествует
 обратная косая черта.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[1;37m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[1;37m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Вставьте текст, в котором каждой встроенной новой строке предшествует
 обратная косая черта.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[1;37m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Немедленно закройте сценарий sed, не обрабатывая больше никаких входных данных,
 за исключением того, что если автоматическая печать не отключена, будет напечатано
 текущее пространство шаблонов. Аргумент кода выхода является расширением GNU.

 Замена команды head:\e[32m sed 10q file.txt\e[0m

 Получает заголовок письма:\e[32m sed \"/^$/q\"\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[1;37m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Немедленно закройте сценарий sed, не обрабатывая больше вводимых данных.
 Это расширение GNU.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[1;37m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 В качестве источника данных можно воспользоваться и файлом.
 Для этого служит команда r , которая позволяет вставлять в поток данные
 из указанного файла. При её вызове можно указать номер строки,
 после которой надо вставить содержимое файла, или шаблон.
\e[32m sed "3r newfile.txt" file.txt\e[0m
 Вставка в поток содержимого файла
 Тут содержимое файла newfile было вставлено после третьей строки файла myfile .
 Вот что произойдёт, если применить при вызове команды r шаблон:
\e[32m sed "/test/r newfile.txt" file.txt\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[1;37m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавьте строку, прочитанную из имени файла.
 Каждый вызов команды считывает строку из файла. Это расширение GNU.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[1;37m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[1;37m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Ветвь для метки; если метка опущена, происходит переход к концу скрипта.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[1;37m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[1;37m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Замените выбранные строки текстом,
 в котором каждой встроенной новой строке предшествует обратная косая черта.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[1;37m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Удалить пространство шаблона. Начать следующий цикл.
 Выводит весь файл file.txt за исключением строк с 12 по 18:\e[32m sed 12,18d file.txt\e[0m
 Удаляет все строки, начиная с 8-й, до disk:\e[32m sed \"17,/disk/d\" file.txt\e[0m
 Удалить каждую третью строку, начиная с первой:\e[32m sed "1~3d" file.txt\e[0m
 Удаляет строки, соответствующие шаблону pattern:\e[32m sed "/pattern/d" file.txt\e[0m
 Получает тело письма:\e[32m sed \"1,/^$/d\"\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[1;37m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Если пространство шаблонов не содержит новой строки, запустите обычный новый цикл,
 как если бы была введена команда d. В противном случае удалите текст
 в пространстве шаблонов до первой новой строки и перезапустите цикл
 с полученным пространством шаблонов, не читая новую строку ввода.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[1;37m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[1;37m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Удваивает пробелы в file.txt:\e[32m sed G file.txt\e[0m
 Утраивает пробелы в файле:\e[32m sed \"G;G\" file.txt\e[0m
 Вставляет пустую строку под каждой строкой regex:\e[32m sed \"/regex/G\" file.txt\e[0m
 или\e[32m sed \"/regex/{x;p;x;G;}\" file.txt\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[1;37m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[1;37m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Перечислите текущую строку в \`\`visually unambiguous'' форме,
 разбивая ее на символы ширины. Это расширение GNU.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[1;37m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 начало N - Каждая N -я строка, начиная с номера начало
 /регулярное_выражение/ - строки, попадающие под регулярное_выражение

 Сделать каждое слово в файле с новойстроки:\e[32m sed 's/ /\\\n/g' input.txt > output.txt\e[0m
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[1;37m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[1;37m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[1;37m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Команда s - substitution (замена)

 Попытайтесь сопоставить регулярное выражение с пространством шаблонов.
 В случае успеха замените ту часть, которая соответствует замене.
 Замена может содержать специальный символ &
 для ссылки на ту часть пространства шаблонов, которая совпала,
 а специальный переход через \9
 для ссылки на соответствующие совпадающие подвыражения в регулярном выражении.

 В данном случае sed заменяет слово «test» в строке, переданной для обработки,
 словами «another test». Для оформления правила обработки текста, заключённого в
 кавычки, используются прямые слэши. В нашем случае применена команда вида s/
 pattern1/pattern2/. Буква «s» — это сокращение слова «substitute», то есть —
 перед нами команда замены. Sed, выполняя эту команду, просмотрит переданный
 текст и заменит найденные в нём фрагменты

 Пример замены текста:
\e[32m echo день | sed s/день/ночь/\e[0m

 Пример замены знаков в выводе один на другой:\e[32m echo 'ababababab' | sed 's/a/8/g'\e[0m
 Результат. A заменено на 8:\e[33m 8b8b8b8b8b\e[0m

 Пример замены текста:
\e[32m echo 'This is a test' | sed 's/test/another test/'\e[0m


 Пример замены знаков в редактируемом файле:
\e[32m sed 's/Nick/John/g' input.txt > output.txt\e[0m
 Результат. Замена слова на слово.

 Заменяет каждое вхождение Nick на John:
\e[32m sed "s/Nick/John/g" report.txt\e[0m

 Заменяет первое поле на 9999:
\e[32m sed \"s/^[^,]*,/9999,/\" file.csv\e[0m

 Производит замену Johnson на White только в строках 1 - 20:
\e[32m sed "1,20 s/Johnson/White/g" file.txt\e[0m

 Цитирует сообщение, вставляя\e[33m >\e[0m перед каждой строкой
\e[32m sed \"s/^/> /\" file.txt\e[0m

 Обратная команда (убирает цитирование из сообщения):
\e[32m sed \"s/^> //\"\e[0m

";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[1;37m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Если s/// выполнил успешную замену с момента чтения последней входной строки
 и с момента последней команды t или T,
 то переход к метке, если метка опущена, происходит переход к концу скрипта.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[1;37m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Если ни один s/// не выполнил успешную замену с момента чтения последней входной
 строки и с момента последней команды t или T, то переход к метке,
 если метка опущена, происходит переход к концу скрипта. Это расширение GNU.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 28)D;echo -en "\e[1;37m";(E28);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 29)D;echo -en "\e[1;37m";(E29);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Запишите первую строку текущего пространства шаблонов в имя файла.
 Это расширение GNU.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 30)D;echo -en "\e[1;37m";(E30);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 31)D;echo -en "\e[1;37m";(E31);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Транслитерировать символы в пространстве шаблонов,
 которые появляются в источнике, соответствующим символам в dest.
";echo -en "\e[1;34m ENTER = main menu ";read;INI;fi;;
 32)D;echo -en "\e[1;37m";(E32);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fmSed;fi;;
esac;C;done
}
#=====================================================================================
fmSed()
{
 trap 'echo -en "\ec"; stty sane; exit' SIGINT
 aa=0
 A(){ for b in $(seq 0 29);do E${b};done; }
 B()
{
  local c
  IFS= read -s -n1 c 2>/dev/null >&2
  if [[ $c = $(echo -en "\e") ]]; then
    read -s -n1 c 2>/dev/null >&2
    if [[ $c = \[ ]]; then
      read -s -n1 c 2>/dev/null >&2
      case $c in
        A) echo d ;;
        B) echo e ;;
        C) echo f ;;
        D) echo g ;;
      esac
    fi
  elif [[ "$c" == "$(echo -en \\x0A)" ]]; then
    echo enter
  fi
}
 C()
{
 if [[ $i == d ]];then ((aa--));fi
 if [[ $i == e ]];then ((aa++));fi
 if [[ $aa -lt 0  ]];then aa=29;fi
 if [[ $aa -gt 29 ]];then aa=0;fi;
}

 D()
{
 j1=$((aa+1)); k1=$((aa-1))
 if [[ $k1 -lt 0   ]];then k1=28;fi
 if [[ $j1 -gt 29 ]];then j1=0;fi
 if [[ $aa -lt $aa ]];then echo -en "\e[0m";E$k1;else echo -en "\e[0m";E$j1;fi
 if [[ $j1 -eq 0   ]] || [ $k1 -eq 29 ];then
 echo -en "\e[0m" ; E$k1; E$j1;fi;echo -en "\e[0m";E$k1;E$j1;
}
 TXa()
{
 for (( a=2; a<=40; a++ ))
  do
   echo -e "\e[${a};1H\e[47;30m│\e[0m                                                                                \e[47;30m│\e[0m"
  done
 echo -en "\e[1;1H\033[0m\033[47;30m┌────────────────────────────────────────────────────────────────────────────────┐\033[0m";
 echo -en "\e[3;3H\e[1m *** sed ***\e[0m              \e[2m stream editor for filtering and transforming text\e[0m";
 echo -en "\e[4;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[15;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[16;3H\e[2m Опции\e[0m                                                              \e[36m OPTIONS\e[0m";
 echo -en "\e[34;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[36;1H\e[47;30m├\e[0m────────────────────────────────────────────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[38;1H\e[47;30m├\e[0m─ \xE2\x86\x91 Up ───── \xE2\x86\x93 Down ──── \xe2\x86\xb2 Select Enter ────────────────────────────────────────\e[0m\e[47;30m┤\e[0m";
 echo -en "\e[41;1H\033[0m\033[47;30m└────────────────────────────────────────────────────────────────────────────────┘\033[0m";
}
  E0(){ echo -en "\e[5;3H Установка                                                          \e[32m INSTALL \e[0m";}
  E1(){ echo -en "\e[6;3H Kраткий обзор                                                     \e[32m SYNOPSIS \e[0m";}
  E2(){ echo -en "\e[7;3H Описание                                                       \e[32m DESCRIPTION \e[0m";}
  E3(){ echo -en "\e[8;3H Ошибки                                                                \e[32m BUGS \e[0m";}
  E4(){ echo -en "\e[9;3H Авторы                                                              \e[32m AUTHOR \e[0m";}
  E5(){ echo -en "\e[10;3H Авторские права                                                  \e[32m COPYRIGHT \e[0m";}
  E6(){ echo -en "\e[11;3H Смотрите также                                                    \e[32m SEE ALSO \e[0m";}
  E7(){ echo -en "\e[12;3H Обычные выражения и операторы                          \e[32m REGULAR EXPRESSIONS \e[0m";}
  E8(){ echo -en "\e[13;3H Адреса                                                           \e[32m ADDRESSES \e[0m";}
  E9(){ echo -en "\e[14;3H                                                                  \e[32m HOME PAGE \e[0m";}
 E10(){ echo -en "\e[17;3H запретить автоматическую печать пространства шаблона              \e[32m --silent \e[0m";}
 E11(){ echo -en "\e[18;3H запретить автоматическую печать пространства шаблона               \e[32m --quiet \e[0m";}
 E12(){ echo -en "\e[19;3H запретить автоматическую печать пространства шаблона                    \e[32m -n \e[0m";}
 E13(){ echo -en "\e[20;3H аннотировать выполнение программы                                  \e[32m --debug \e[0m";}
 E14(){ echo -en "\e[21;3H добавьте скрипт в команды                    \e[32m -e script --expression=script \e[0m";}
 E15(){ echo -en "\e[22;3H добавить содержимое файла сценария       \e[32m -f script-file --file=script-file \e[0m";}
 E16(){ echo -en "\e[23;3H следовать символическим ссылкам при обработке на месте   \e[32m --follow-symlinks \e[0m";}
 E17(){ echo -en "\e[24;3H редактировать файлы на месте                \e[32m -i[SUFFIX] --in-place[=SUFFIX] \e[0m";}
 E18(){ echo -en "\e[25;3H укажите желаемую длину переноса строк для команды «l»\e[32m -l N, --line-length=N \e[0m";}
 E19(){ echo -en "\e[26;3H отключите все расширения GNU                                       \e[32m --posix \e[0m";}
 E20(){ echo -en "\e[27;3H используйте в расширенные регулярные выражения     \e[32m -E -r --regexp-extended \e[0m";}
 E21(){ echo -en "\e[28;3H рассматривайте файлы как отдельные, а не как единый поток    \e[32m -s --separate \e[0m";}
 E22(){ echo -en "\e[29;3H работать в режиме песочницы (отключить команды e/r/w)            \e[32m --sandbox \e[0m";}
 E23(){ echo -en "\e[30;3H загружать минимальные объемы данных из входных файлов      \e[32m -u --unbuffered \e[0m";}
 E24(){ echo -en "\e[31;3H отдельные строки символами NUL                              \e[32m -z --null-data \e[0m";}
 E25(){ echo -en "\e[32;3H Display this help and exit                                          \e[32m --help \e[0m";}
 E26(){ echo -en "\e[33;3H Output version information and exit                              \e[32m --version \e[0m";}
 E27(){ echo -en "\e[35;3H Команды                                                            \e[36m COMMAND \e[0m";}
 E28(){ echo -en "\e[37;3H                                                                        \e[36m Git \e[0m";}
 E29(){ echo -en "\e[39;3H                                                                       \e[34m Exit \e[0m";}
 INI(){ echo -en "\ec" ;stty sane;TXa;A; };INI
 while [[ "$l1" != " " ]]; do case $aa in
  0)D;echo -en "\e[47;30m"; (E0);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Обычно предустановлен в большинстве дистрибутивов Linux.
\e[32m sudo apt-get install sed\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  1)D;echo -en "\e[47;30m"; (E1);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sed [OPTION]... {script-only-if-no-other-script} [input-file]...\e[0m

Команда sed имеет формат:
\e[32m sed [ -n ] [ -e скрипт ] [ -f скрипт-файл ] [ файлы ]\e[0m
 Флаг -n подавляет вывод
 -e - указывает на список инструкций, заданный в командной строке.
 -f - указывает местонахождение файла-скрипта.

 Формат команд редактирования
 Скриптовый файл состоит из набора команд:
\e[32m [ адрес [ , адрес ] ] команда [ аргументы ]\e[0m по одной в каждой строке.
 Адреса это либо номера строк, либо специальные символы, либо регулярное выражение.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  2)D;echo -en "\e[47;30m"; (E2);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Sed — потоковый редактор. Редактор потока используется для выполнения основных
 преобразований текста во входном потоке (файле или входных данных из конвейера).
 Хотя в некотором смысле он похож на редактор, который допускает редактирование по
 сценарию (например, ed), sed работает, выполняя только один проход по входным
 данным и, следовательно, более эффективен. Но именно способность sed фильтровать
 текст в конвейере особенно отличает его от других типов редакторов.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  3)D;echo -en "\e[47;30m"; (E3);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Отправляйте отчеты об ошибках по адресу:\e[36m bug-sed@gnu.org\e[0m
 Кроме того, если это возможно, включите вывод\e[32m \`\`sed --version''\e[0m в тело отчета.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  4)D;echo -en "\e[47;30m"; (E4);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Авторы сценария Джей Фенласон, Том Лорд, Кен Пиццини, Паоло Бонзини, Джим Мейеринг
 и Ассаф Гордон. Эта программа sed была создана с поддержкой SELinux.
 SELinux включен в этой системе.
 Домашняя страница GNU sed:\e[36m https://www.gnu.org/software/sed/\e[0m
 Общая справка по использованию программного обеспечения GNU:
\e[36m https://www.gnu.org/gethelp/\e[0m
 Отправляйте отчеты об ошибках по адресу:\e[36m bugsed@gnu.org\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  5)D;echo -en "\e[47;30m"; (E5);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Авторские права © 2020 Free Software Foundation, Inc. Лицензия GPLv3+: GNU GPL
 версии 3 или новее:\e[36m https://gnu.org/licenses/gpl.html\e[0m
 Это бесплатное программное обеспечение: вы можете изменять и распространять его.
 НЕТ НИКАКИХ ГАРАНТИЙ, в пределах, разрешенных законом.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  6)D;echo -en "\e[47;30m"; (E6);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 awk, ed, grep, tr, perlre, sed.info, любые книги по sed,
 часто задаваемые вопросы по sed:\e[36m http://sed.sf.net/Grabbag/tutorials/sedfaq.txt\e[0m,
\e[36m http://sed.sf.net/grabbag/\e[0m
 Полная документация по sed поддерживается в виде руководства Texinfo.
 Если программы info и sed правильно установлены на вашем сайте,
 команда info sed должна предоставить вам доступ к полному руководству.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  7)D;echo -en "\e[47;30m"; (E7);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 POSIX.2 BRE должны поддерживаться, но не полностью из-за проблем
 с производительностью.
 Последовательность \\\n в регулярном выражении соответствует символу новой строки,
 а также для \\\a, \\\t и других последовательностей.

 Опция -E вместо этого переключается на использование расширенных регулярных
 выражений, он уже много лет поддерживается GNU sed и теперь включен в POSIX.

Регулярные выражения (РВ)

(Regular expressions, regexp, RE)

Тема регулярных выражений настолько обширна, что ей посвящены целые книги
(смотри ссылки в конце статьи). Тем не менее, говорить всерьез о редакторе sed,
не применяя регулярных выражений, также непродуктивно, как разговаривать о
тригонометрии при помощи счетных палочек. Поэтому необходимо рассказать хотя бы
о тех регулярных выражениях, которые часто используются с программой sed.

с Или любая другая буква. Большинство букв, цифр и прочих неспециальных
символов считаются регулярными выражениями, представляющими сами себя.

* Астериск, следующий за каким-либо символом или регулярным выражением,
означает любое число (в том числе и нулевое) повторов этого символа или
регулярного выражения.

\+ Означает один или более повтор символа или регулярного выражения.

\? Означает ни одного или один повтор.

\{i\} Означает ровно i повторов.

\{i,j\} Число повторов находится в интервале от i до j включительно.

\{i,\} Число повторов больше или равно i.

\{,j\ } Число повторов меньше или равно j.

\(RE\ ) Запомнить регулярное выражение или его часть с целью дальнейшего
использования как единое целое. Например, \(а-я\)* будет искать любое сочетание
любого количества (в том числе и нулевого) строчных букв.

. Означает любой символ, в том числе символ новой строки.

^ Означает нулевое выражение в начале строки. Другими словами, то, перед чем
стоит этот знак, должно появляться в начале строки. Например, ^#include будет
искать строки, начинающиеся с #include.

$ То же, что и предыдущее, только относится к концу строки.

[СПИСОК] Означает любой символ из СПИСКА. Например, будет искать любую
английскую гласную букву.

[^СПИСОК] Означает любой символ, кроме тех, что в списке. Например, [^aeiou]
будет искать любую согласную. Примечание: СПИСОК может быть интервалом,
например [а-я], что будет означать любую строчную букву. Если нужно включить в
СПИСОК ] (квадратную скобку) укажите ее в списке первой; если нужно включить в
СПИСОК - (дефис), то укажите его в списке первым или последним.

RE1\|RE2 Означает РВ1 или РВ2.

RE1RE2 Означает объединение регулярных выражений РВ1 и РВ2.

\n Означает символ новой строки.

\$; \*; \.; \[; \\; \^ Означают соответственно: $; *; .; [; \; ^

Внимание: Остальные условные обозначения на основе обратного слэша (\),
принятые в языке С, не поддерживаются программой sed.

\1 \2 \3 \4 \5 \6 \7 \8 \9 Означает соответствующую по счету часть регулярного
выражения, запомненную при помощи знаков \(и \).

 Операторы
 Другие операторы, широко использующиеся в регулярных выражениях - это:
\e[32m ?\e[0m соответствует повторению предшествующего символа ноль или один раз
 (то есть flavou? r будет соответствовать flavor и flavour),
\e[32m *\e[0m - ноль или более раз,
\e[32m +\e[0m - один или более раз.

\e[32m ^\e[0m соответствует началу строки:
 Добавляет пробел слева от текста для улучшения качества печати:
\e[32m sed "s/^/ /" file.txt > file_new.txt\e[0m

\e[32m $\e[0m - наоборот.

 Прямой слэш (/) используется в качестве разделителя по традиции, так как предок
 программы sed - редактор ed использует их (как и редактор vi). В некоторых
 случаях такой разделитель весьма неудобен, например, когда надо менять пути
 (path) к директориям, которые тоже содержат прямой слэш (/usr/local/bin). В
 этом случае приходится разделять прямые слэши обратными:
\e[32m sed \"s/\\/usr\\/local\\/bin/\\/common\\/bin/\"\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  8)D;echo -en "\e[47;30m"; (E8);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Команды Sed могут передаваться без адресов, и в этом случае команда будет выполнена
 для всех входных строк с одним адресом, и в этом случае команда будет выполнена
 только для строк ввода, соответствующих этому адресу или с двумя адресами, и в этом
 случае команда будет выполнена для всех входных строк, соответствующих включенному
 диапазону строк, начиная с первого адреса и заканчивая вторым адресом. В отношении
 диапазонов адресов следует отметить три вещи:
 синтаксис: addr1, addr2 (т. е. адреса разделяются запятой)
 строка, которой соответствует адрес1, всегда будет принята, даже если адрес2
 выберет более раннюю строку и если addr2 является регулярным выражением, оно не
 будет проверяться на соответствие строке, которой соответствует addr1.
 После адреса (или диапазона адресов) и перед командой ставится ! может быть
 вставлено, что указывает, что команда должна выполняться только в том случае,
 если адрес (или диапазон адресов) не совпадает.
 Поддерживаются следующие типы адресов:
 число Соответствует только указанному номеру строки (который увеличивается
 кумулятивно по всем файлам, если в командной строке не указана опция -s).
\e[32m first~step\e[0m Сопоставьте каждую строку шага, начиная с первой строки. Например,
\e[32m \`\`sed -n 1~2p''\e[0m напечатает все нечетные строки во входном потоке, а адрес 2~5 будет
 соответствовать каждой пятой строке, начиная со второй. первое может быть нулевым;
 в этом случае sed работает так, как если бы он был равен шагу. (Это расширение.)
\e[32m \$\e[0m Сопоставьте последнюю строку.
\e[32m /regexp/\e[0m Сопоставьте строки, соответствующие регулярному выражению регулярного
 выражения. Сопоставление выполняется в текущем пространстве шаблонов,
 которое можно изменить с помощью таких команд, как\e[32m \`\`s///''\e[0m
\e[32m \\\cregexpc\e[0m Сопоставьте строки, соответствующие регулярному выражению
 регулярного выражения. Символ c может быть любым символом.
 GNU sed также поддерживает некоторые специальные двухадресные формы:
\e[32m 0,addr2\e[0m Начните с состояния «совпадающий первый адрес», пока не будет найден адрес
 addr2. Это похоже на 1,addr2, за исключением того, что если addr2 соответствует
 самой первой строке ввода, форма 0,addr2 будет в конце своего диапазона, тогда как
 форма 1,addr2 все равно будет в начале своего диапазона.
 Это работает только в том случае, если addr2 является регулярным выражением.
\e[32m addr1,+N\e[0m Будет соответствовать адресу addr1 и N строкам, следующим за адресом1.
\e[32m addr1,~N\e[0m Будет соответствовать адресу addr1 и строкам, следующим за addr1,
 до следующей строки, номер входной строки которой кратен N.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
  9)D;echo -en "\e[47;30m"; (E9);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -en "
 GNU sed home page:              \e[36m https://www.gnu.org/software/sed/\e[0m
 General help using GNU software:\e[36m https://www.gnu.org/gethelp/\e[0m
 E-mail bug reports to:          \e[36m bugsed@gnu.org\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 10)D;echo -en "\e[47;30m";(E10);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 11)D;echo -en "\e[47;30m";(E11);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 12)D;echo -en "\e[47;30m";(E12);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Выводит один абзац, начинающийся с /Of course/ и заканчивающийся на /attention/:
\e[32m sed -n \"/Of course/,/attention/p\" file.txt\e[0m

 Выводит только строки 12-18 файла file.txt :
\e[32m sed -n 12,18p file.txt\e[0m

 Печатать каждую пятую строку, начиная со второй:
\e[32m sed -n "2~5p" file.txt\e[0m

 Печатает только первое соответствие RE (регулярного выражения):
\e[32m sed -n \"/RE/{p;q;}\" file.txt\e[0m

 Печатает строки длиной 65 символов и более:
\e[32m sed -n \"/^.\{65\}/p\" file.txt\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 13)D;echo -en "\e[47;30m";(E13);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 14)D;echo -en "\e[47;30m";(E14);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавьте скрипт в команды, которые будут выполняться.
 Если опция -e, --expression, то первый аргумент, не являющийся опцией,
 принимается в качестве сценария sed для интерпретации.
 Все остальные аргументы — это имена входных файлов.
 Если входные файлы не указаны, то считывается стандартный ввод.

 Пример цветного вывоада x1b:
\e[32m sed -e 's/ключевым/\\\x1b[31m&\\\x1b[0m/g' file.txt | cat\e[0m

 Пример цветного вывоада ESC (Escape):
\e[32m sed -e 's/ключевым/'\"\$(printf '\\\\033[31m&\\\\033[0m')/g\" file.txt | cat\e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 15)D;echo -en "\e[47;30m";(E15);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Добавить содержимое файла сценария к выполняемым командам.
 Если опция  -f или --file то первый аргумент, не являющийся опцией,
 принимается в качестве сценария sed для интерпретации.
 Все остальные аргументы — это имена входных файлов.
 Если входные файлы не указаны, то считывается стандартный ввод.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 16)D;echo -en "\e[47;30m";(E16);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 17)D;echo -en "\e[47;30m";(E17);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 редактировать файлы на месте (создает резервную копию, если указан СУФФИКС)
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 18)D;echo -en "\e[47;30m";(E18);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 19)D;echo -en "\e[47;30m";(E19);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 20)D;echo -en "\e[47;30m";(E20);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 используйте в скрипте расширенные регулярные выражения
 (для переносимости используйте POSIX -E)
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 21)D;echo -en "\e[47;30m";(E21);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 рассматривайте файлы как отдельные,
 а не как единый непрерывный длинный поток.
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 22)D;echo -en "\e[47;30m";(E22);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 23)D;echo -en "\e[47;30m";(E23);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 Загружать минимальные объемы данных из входных файлов, чаще очищать выходные буферы
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 24)D;echo -en "\e[47;30m";(E24);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "24";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 25)D;echo -en "\e[47;30m";(E25);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sed --help\e[32m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 26)D;echo -en "\e[47;30m";(E26);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
\e[32m sed --version\e[32m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 27)D;echo -en "\e[47;30m";(E27);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;fmSedCommand;echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 28)D;echo -en "\e[47;30m";(E28);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;echo -e "
 mSed Описание утилиты sed. Stream editor for filtering and transforming text.
 asciinema:  \e[36m https://asciinema.org/a/651056\e[0m
 codeberg:   \e[36m https://codeberg.org/Grannik/mSed\e[0m
 github:     \e[36m \e[0m
 gitlab:     \e[36m \e[0m
 sourceforge:\e[36m \e[0m
 notabug:    \e[36m \e[0m
 bitbucket:  \e[36m \e[0m
 gitea:      \e[36m \e[0m
 gogs:       \e[36m \e[0m
";echo -en "\e[47;30m ENTER = main menu ";read;INI;fi;;
 29)D;echo -en "\e[47;30m";(E29);i=`B`;if [[ $i == enter ]];then echo -en "\ec";stty sane;exit 0;fi;;
esac;C;done
}
fmSed
