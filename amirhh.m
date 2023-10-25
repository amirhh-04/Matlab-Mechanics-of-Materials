
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #1 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear
%num1 = input("Num 1: ");
%num2 = input("Num 2: ");

%a = num1*num2;
%b = num1/num2;
%c = num1+num2;
%d = num1-num2;

%disp("---------------------");
%fprintf("Num1 * Num2: %d\n", a);
%fprintf("Num1 / Num2: %d\n", b);
%fprintf("Num1 + Num2: %d\n", c);
%fprintf("Num1 - Num2: %d\n", d);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #2 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%num1 = input("Num 1: ");
%num2 = input("Num 2: ");

%p = (num1+num2) * 2;
%s = (num1*num2);

%disp("---------------------");
%fprintf("P: %d\n", p);
%fprintf("S: %d\n", s);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #3 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%f = input("F : ");
%d = 5/9*(f - 32);

%disp("---------------------");
%fprintf("D: %d\n", d);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #4 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%a = input("a : ");
%b = input("b : ");

%c = a;
%a = b;
%b = c;

%clear c;

%disp("---------------------");
%fprintf("a: %d\n", b);
%fprintf("b: %d\n", a);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #5 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%%a = input("a : ");
%%b = input("b : ");
%
%%a = a + b;
%%b = a - b;
%%a = a - b;

%disp("---------------------");
%fprintf("a: %d\n", a);
%fprintf("b: %d\n", b);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #6 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%times = input("Time : ");

%h = floor(times/3600);
%m = floor(((times - h* 3600) / 60));
%s = times - h * 3600 - m * 60;


%disp("---------------------");
%fprintf("H: %d, M:%d , S:%d\n", h, m, s);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #7 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");

%if x == 0 ; y = 0; else; y = 1/x; end;
%disp("---------------------");
%fprintf("Y: %f\n", y);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #8 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");

%if x < 0 
%    y = 1 - 2*x;
%else
%    if x == 0 
%        y = 1;
%    else
%        y = 1 + 2*x;
%    end
%end

%disp("---------------------");
%fprintf("Y: %d\n", y);
%disp("---------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #9 %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");
%y = input("Y : ");

%if x > y
%   x
%else
%   y
%end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #10 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");
%y = input("Y : ");

%max = x;

%if y > max
%   max = y;
%end

%max


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #11 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%max = input("Max : ");
%x = input("X : ");

%if x > max 
%   max = x;
%end

%max

% Code #12
%clc
%clear

%x = input("X : ");

%if mod(x, 2) == 0
%   disp("even");
%else
%   disp("odd");
%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #12 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("x : ");
%max = x;

%x = input("y : ");
%if x > max
%   max = x;   
%end

%x = input("z : ");
%if x > max 
%   max = x;
%end

%max


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #13 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% data = [67200000  180000000  300000000  420000000; 0.10  0.15  0.20  0.30; 0  11280000  29280000  53280000];
% tax  = 0;
% 
% income = input("Salary : ");
% 
% amount = (income - data(1,1));
% if amount > 0
%     tax = data(2,1) * (income - data(1,1));
%     amount = (income - data(1,2));
%     if amount > 0
%         tax = data(3,2) + (data(2,2) * (income - data(1,2)));
%         amount = (income - data(1,3));
%         if amount > 0
%             tax = data(3,3) + (data(2,3) * (income - data(1,3)));
%             amount = (income - data(1,4));
%             if amount > 0
%                tax = data(3,4) + (data(2,4) * (income - data(1,4)));
%             end
%         end
%     end
% end
% 
% finalIncome = income - tax;
% 
% disp("---------------------------------------------------------------");
% fprintf("Salary: %d , Tax: %d , Final Income: %d\n", income, tax, finalIncome);
% disp("---------------------------------------------------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #14 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");
%y = input("Y : ");
%z = input("Z : ");

%if power(x, 2) == power(y, 2) + power(z, 2) 
%    disp("Yes");
%else
%    if power(y, 2) == power(x, 2) + power(z, 2) 
%        disp("Yes");
%    else
%        if power(z, 2) == power(x, 2) + power(y, 2) 
%            disp("Yes");
%        else
%            disp("No");
%        end
%    end
%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #15 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");
%y = input("Y : ");
%z = input("Z : ");

%if (power(x, 2) == power(y, 2) + power(z, 2)) || (power(y, 2) == power(x, 2) + power(z, 2)) || (power(z, 2) == power(x, 2) + power(y, 2))
%    disp("Yes");
%else
%    disp("No");
%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #16 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");
%y = input("Y : ");
%z = input("Z : ");

%if x < y + z
%    if y < x + z
%        if z < x + y
%            s = (x + y + z) / 2;
%            area = sqrt(s * (s - x) * (s - y) * (s - z));
%            fprintf("Area: %d\n", area);
%        else
%            disp("No Triangle");
%        end
%    else
%        disp("No Triangle");
%    end
%else
%    disp("No Triangle");
%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #17 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%x = input("X : ");
%y = input("Y : ");
%z = input("Z : ");

%if (x < y + z) && (y < x + z) && (z < x + y)
%    s = (x + y + z) / 2;
%    area = sqrt(s * (s - x) * (s - y) * (s - z));
%    fprintf("Area: %d\n", area);
%else
%    disp("No Triangle");
%end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #18 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear

%a = input("A : ");
%b = input("B : ");
%c = input("C : ");

%if a < b
%    t = a;
%    a = b;
%    b = t;
%end
%if a < c 
%    t = a;
%    a = c;
%    c = t;
%end
%if b < c
%    t = b;
%    b = c;
%    c = t;
%end
%fprintf("A: %d, B: %d, C: %d\n", a, b, c);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #19 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% a = input("Coefficient A : ");
% b = input("Coefficient B : ");
% c = input("Coefficient C : ");
% 
% delta = (b^2) - (4 * a * c);
% 
% if delta < 0
%     disp("The equation does not have a correct answer!")
% else
%     if delta == 0
%         x = (-b / 2 * a);
%         answers = x;
%     else
%         x = ((-b + sqrt(delta)) / 2 * a);
%         y = ((-b - sqrt(delta)) / 2 * a);
%         answers = [x , y];
%     end
%     disp("---------------------------------------------------------------");
%     fprintf("Format : (%dx^2) + (%dx) + (%d) = 0, Delta : %d\n", a, b, c, delta);
%     fprintf("Answer : %.2d\n", answers);
%     disp("---------------------------------------------------------------");
% end

%% Test solve in matlab
%eqn = x^2 + 4 * x + 4 == 0;
%s = solve(eqn);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #20 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% x = input("Num : ");
% 
% if x < 21
%     money = 35;
% else
%     b = x - 20;
%     if b < 10
%         money = 35 + 5;
%     else
%         total = round(b / 10);
%         money = 35 + total * 5;
%     end
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("Tax : %.2d\n", money);
% disp("---------------------------------------------------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #21 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% m = input("M : ");
% d = input("D : ");
% 
% if m < 7
%     total = ((m - 1) * 31) + d;
% else
%     total = ((m - 7) * 30) + (6 * 31) + d;
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("Day : %.2d\n", total);
% disp("---------------------------------------------------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #22 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("Day : ");
% 
% if n < 187
%     if mod(n, 31) == 0
%         d = 31;
%         m = ((n - d) / 31) + 1;
%     else
%         d = mod(n, 31);
%         m = ((n - d) / 31) + 1;
%     end
% else
%     if mod(n - 6, 30) == 0
%         d = 30;
%         m = ((n - 6 - d) / 30) + 1;
%     else
%         d = mod(n - 6, 30);
%         m = ((n - 6 - d) / 30) + 1;
%     end
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("M : %.2d, D : %.2d\n", m, d);
% disp("---------------------------------------------------------------");


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #23 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("Num : ");
% 
% a = mod(n, 10);
% n = floor(n / 10);
% b = mod(n, 10);
% n = floor(n / 10);
% c = mod(n, 10);
% n = floor(n / 10);
% d = mod(n, 10);
% n = floor(n / 10);
% e = mod(n, 10);
% 
% if a == e && b == d
%     answer = "Mirror";
% else
%     answer = "No Mirror";
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("Answer : %s\n", answer);
% disp("---------------------------------------------------------------");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #24 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% b = 0;
% 
% for a = 1:20
%     c = input("Num : ");
%     b = b + c;
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("Num : %d\n", b);
% disp("---------------------------------------------------------------");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #25 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% a = 0;
% b = 0;
% 
% while a < 20
%     c = input("Num : ");
%     b = b + c;
%     a = a + 1;
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("Num : %d\n", b);
% disp("---------------------------------------------------------------");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #26 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% s = 0;
% n = input("N : ");
% 
% for c = 0:n
%     if c == n 
%         disp("---------------------------------------------------------------");
%         fprintf("S : %d, S/2 : %f\n", s, (s / n));
%         disp("---------------------------------------------------------------");
%     else
%         a = input("A : ");
%         s = s + a;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #27 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% c = 0;
% s = 0;
% 
% while (c ~= n)
%     a = input("A : ");
%     s = s + a;
%     c = c + 1;
% end
% 
% disp("---------------------------------------------------------------");
% fprintf("S : %d, S/2 : %f\n", s, (s / n));
% disp("---------------------------------------------------------------");

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #28 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("Num : ");
% max = n;
% 
% while n >= 0
%     n = input("Num : ");
%     if n > max
%         max = n;
%     end
% end
% 
% fprintf("Max : %d\n", max);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #29 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% sum = 0;
% i = 0;
% 
% while true
%     x = input("Num : ");
%     if (x > 20) || (x < 0)
%         break
%     end
%     sum = x + sum;
%     i = i + 1;
% end
% 
% fprintf("M : %d\n", (sum/i));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #30 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%clc
%clear
%
% hscore = 0;
% mscore = 0;
% lscore = 0;
% 
% total = 0;
%
% while true
%    score = input("Score : ");
% 
%    if (score > 20) || (score < 0)
%        break
%    end
% 
%    if (score > 15)
%        hscore = hscore + 1;
%    elseif (score >= 12)
%        mscore = mscore + 1;
%    elseif (score >= 0)
%        lscore = lscore + 1;
%    end
%    total = total + score;
% end
% 
% counter = hscore + mscore + lscore;
% fprintf("High Score : %d, Mid Score : %d, Low Score : %d, Total:%f\n", hscore, mscore, lscore, (total/counter));
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #31 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% tscore = 0;
% tunit = 0;
% 
% while true
%     score = input("Score : ");
%     if (score > 20) || (score < 0)
%         break
%     end
%     unit = input("Unit : ");
% 
%     tscore = tscore + (score * unit);
%     tunit = tunit + unit;
% end
% 
% fprintf("TScore : %d, TUnit : %d, G : %f\n", tscore, tunit, (tscore/tunit));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #32 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% bit = 0;
% dec = input("DEC : ");
% 
% if dec < 16
%     bit = 4;
% elseif dec < 256
%         bit = 8;
% elseif dec < 2048
%         bit = 12;
% end
% 
% dec2bin(dec, bit)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #33 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% a = "";
% dec = input("DEC : ");
% 
% while true
%     if (dec == 0)
%         break
%     end
% 
%     a = num2str(mod(dec, 2)) + a;
%     dec = floor(dec / 2);
% end
% 
% fprintf("DEC TO BIN : %s\n", a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #34 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% dec = input("DEC : ");
% 
% z = 0;
% j = 0;
% 
% while true
%     x = mod(dec,2);
%     z = z + x * 10^j;
%     dec = (dec - x) / 2;
%     if (dec == 0)
%         break
%     end
%     j = j + 1;
% end
% 
% fprintf("DEC TO BIN : %d\n", z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #35 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("Num : ");
% i = 2;
% a = "";
% 
% while true
%     if mod(n, i) == 0
%         a = a + i;
%         n = n / i;
%     else
%         i = i + 1;
%     end
%     if (n == 1)
%         break
%     end
% end
% fprintf("Answer : %s\n", a);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #36 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% x = input("X : ");
% y = input("Y : ");
% 
% a = x;
% b = y;
% 
% while true
%     if mod(a, b) == 0
%         break
%     end
%     c = mod(a, b);
%     a = b;
%     b = c;
% end
% 
% bmm = b;
% kmm = (x * y) / bmm;
% fprintf("BMM : %d, KMM : %d\n", bmm, kmm);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #37 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% counter = 0;
% s_1 = 0;  % +0
% s_2 = 0;  % -0
% s_3 = 0;  % 0
% 
% while true
%     a = input("A : ");
%     if a > 0 
%         s_1 = s_1 + 1;
%     end
%     if a < 0
%         s_2 = s_2 + 1;
%     end
%     if a == 0
%         s_3 = s_3 + 1;
%     end
%     counter = counter + 1;
%     if counter > 9
%         break
%     end
% end
% 
% fprintf("(+0) : %d, (-0) : %d, (0) : %d\n", s_1, s_2, s_3);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #38 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% counter = 0;
% 
% while true
%     num = input("Num : ");
%     if num == 0 
%         break
%     end
%     p = mod(num, 10);
%     if p == 3
%         counter = counter + 1;
%     end
% end
% 
% fprintf("Counter : %d\n", counter);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #39 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% counter = 0;
% 
% for a = 100:5:500
%     counter = counter + 1;
%     fprintf("Answer %d : %d\n", counter, a);
% end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #40 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% i = 1;
% fact = 1;
% num = input("Num : ");
% 
% while true
%     fact = fact * i;
%     i = i + 1;
%     if i > num 
%         break
%     end
% end
% 
% fprintf("Fact : %d\n", fact);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #41 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% i = 1;
% fact = 1;
% s = 0;
% num = input("Num : ");
% 
% while true
%     fact = fact * i;
%     s = s + fact;
%     i = i + 1;
%     if i > num 
%         break
%     end
% end
% 
% fprintf("S : %d\n", s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #42 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% bin = input("BIN : ");
% len = length(num2str(bin));
% 
% s = 0;
% j = 0;
% 
% while true
%     x = mod(bin, 10);
%     bin = floor(bin/10);
%     s = s + (x * (2^j));
%     j = j + 1;
%     if j >= len
%         break
%     end
% end
% 
% fprintf("S : %d\n", s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #43 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("N : ");
% m = input("M : ");
% 
% if n > m
%     t = n;
%     n = m;
%     m = t;
% end
% 
% a = 0;
% 
% while true 
%     m = m - n;
%     a = a + 1;
%     if m < n
%         break
%     end
% end
% 
% fprintf("A : %d, M : %d\n", a, m);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #44 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% t = 0;
% sum = 0;
% min = 0;
% max = 0;
% 
% while t < 3
%     a = input("A : ");
%     b = input("B : ");
%     c = input("C : ");
%     d = input("D : ");
%     e = input("E : ");
% 
%     s = a + b + c + d + e;
%     sum = sum + s;
%     ave = s / 5;
% 
%     fprintf("Ave : %d\n", ave);
% 
%     if ave < min
%         min = ave;
%     end
%     if ave > max
%         max = ave;
%     end
% 
%     t = t + 1;
% end
% 
% fprintf("Max : %d, Min : %d, S : %d\n", max, min, (sum/100));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #45 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("N : ");
% i = 1;
% 
% while ~(i > (n / 2))
%     m = mod(n, i);
%     if m == 0
%         fprintf("I : %d\n", i);
%     end
%     i = i + 1;
% end
% 
% fprintf("N : %d\n", n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #46 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("N : ");
% j = 2;
% 
% while true
%     r = mod(n, j);
%     if r == 0
%         n = n / j;
%         fprintf("J : %d\n", j);
%     else
%         break
%     end
% end
% 
% j = 3;
% 
% while true
%     r = mod(n, j);
%     if r == 0
%         n = n / j;
%         fprintf("J-2 : %d\n", j);
%         continue
%     end
%     j = j + 2;
%     if n == 1 || i > (n / 2)
%         break
%     end
% end
% fprintf("N : %d\n", n);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #47 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% days = ["Saturday", "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
% day = input("Day : ");
% 
% if (day > 8 || day < 1); disp("(   :/   )"); return; end
% 
% fprintf("D : %s\n", days(1, day));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #48 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% max = 0;
% 
% while true
%     n = input("N : ");
%     if n < 0
%         break;
%     end
%     if n > max
%         max = n;
%     end
%     max
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #49 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% t = 0;
% c = 0;
% while true
%     n = input("N : ");
%     if n == 0
%         break;
%     end
%     t = t + n;
%     c = c + 1;
% end
% fprintf("A : %.2f\n", (t/c));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #50 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% bin = input("BIN : ");
% 
% s = 0;
% j = 0;
% z = 0;
% k = 0;
% len = 0;
% 
% while bin >= (10^len)
%     len = len + 1;
% end
% 
% while true
%     x = mod(bin, 10);
%     bin = floor(bin/10);
%     s = s + (x * (2^j));
%     j = j + 1;
%     if j >= len
%         break
%     end
% end
% 
% while true
%     y = mod(s,3);
%     z = z + (y * (10^k));
%     s = (s - y) / 3;
%     k = k + 1;
%     if (s == 0)
%         break
%     end
% end
% 
% fprintf("BIN TO (3) : %d\n", z);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #51 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% num = input("Num : ");
% 
% i = 2;
% 
% while true
%     if mod(num, i) == 0
%         disp(i);
%         num = num / i;
%     else
%         i = i + 1;
%     end
%     if num == 1
%         break;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Code #52 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% 
% n = input("Num : ");
% 
% if n <= 186
%     if mod(n, 31) == 0
%         d = 31;
%         m = (n - d) / 31 + 1;
%     else
%         d = mod(n, 31);
%         m = (n - d) / 31 + 1;
%     end
% else
%     if mod(n - 6, 30) == 0
%         d = 30;
%         m = (n - 6 - d) / 30 + 1;
%     else
%         d = mod(n - 6, 30);
%         m = (n - 6 - d) / 30 + 1;
%     end
% end
% disp([d , m]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Code #53 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clc
% clear
% 
% h = 0;
% m = 0;
% l = 0;
% 
% while true
%     n = input("N : ");
%     if n < 0 || n > 20
%         break;
%     end
%     if n >= 16
%         h = h + 1;
%     else
%         if n >= 12
%             m = m + 1;
%         else
%             l = l + 1;
%         end
%     end
% end
% 
% disp([h, m, l]);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Code #54 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% a = input("a : ");
% b = input("b : ");
% c = input("c : ");
% 
% delta = (b^2) - (4 * a * c);
% 
% if delta > 0
%     disp((-b + sqrt(delta)) / (2*a));
%     disp((-b - sqrt(delta)) / (2*a));
% else
%     if delta == 0
%         disp(-b / (2 * a));
%     else
%         disp("no real root");
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% Code #55 %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% c = 0;
% j = 0;
% max = 0;
% 
% while c <= 5
%     n = input("N: ");
%     while n >= (10^j)
%         j = j + 1;
%     end
% 
%     if j == 3
%         if n > max
%             max = n;
%         end
%     end
%     c = c + 1;
% end
% 
% disp(max);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Exam %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% max_1 = 0;
% max_2 = 0;
% i = 0;
% id_1 = 0;
% id_2 = 0;
% 
% n = input("N : ");
% 
% while true
%     if i <= n
%         moadel = input("Moadel : ");
%         id = input("ID : ");
%         if moadel > max_1
%             id_2 = id_1;
%             max_2 = max_1;
%             max_1 = moadel;
%             id_1 = id;
%         else
%             if moadel > max_2
%                 max_2 = moadel;
%                 id_2 = id;
%             end
%         end
%         i = i + 1;
%     else
%         break;
%     end
% end
% 
% fprintf("Max 1: %.2f\nMax 2: %.2f\nID 1: %.2f\nID 2: %.2f\n", max_1, max_2, id_1, id_2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Exam %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; 
% clear;
% 
% n = 5;
% 
% while true
%     a = 1;
%     s = 0;
% 
%     while true
%         p = mod(n, a);
%         if p == 0
%             s = s + a;
%         end
%         a = a + 1;
%         if ~(a <= (n/2))
%             break;
%         end
%     end
% 
%     if s == n
%         disp(n);
%     end
% 
%     n = n + 1;
%     
%     if ~(n <= 100)
%         break;
%     end
% end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Exam %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% num = input("Num : ");
% 
% s = 0;
% t = num * 2;
% c = 0;
% 
% while c < t
%     c = c + 1;
%     if ~(mod(c, 2) == 0)
%         s = s + c;
%     end
% end
% 
% disp(s)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Exam %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% num = input("Num : ");
% 
% i = 1;
% fact = 1;
% s = 0;
% 
% while true
%     fact = fact * i;
% 
%     if mod(i, 3) == 0
%         s = s - fact;
%     else
%         s = s + fact;
%     end
% 
%     i = i + 1;
%     if i > num 
%         break
%     end
% end
% 
% fprintf("S : %d\n", s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Exam %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc
% clear
% 
% n = input("Num : ");
% 
% c = 1;
% s = 0;
% b = 1;
% 
% while true
%     c = c + 1;
%     b = b * c;
% 
%     if mod(c, 3) == 0
%         s = s - b;
%     else
%         s = ...
% s + b;
%     end
% 
%     if c == n
%         break;
%     end
% end
% 
% disp(s+1)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%% Exam %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% clc
% clear
% 
% c = 0;
% s = 1;
% 
% n = input("Num : ");
% 
% while true
%     b = s * c;
% 
%     c = c + 1;
% 
% %     if mod(c, 3) == 0
% %         s = s - b;
% %     else
% %         s = s + b;
% %     end
%     s = s + b;
% 
%     if c == n 
%         exit(0);
%     end
% end
% 
% disp(s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% a = 1.5666;
% 
% count_digits(a)
% 
% function count_digits = count_digits(number)
%     if number == 0
%         count_digits = 1;
%     else
%         count_digits = floor(log10(abs(number))) + 1;
%     end
% end

% url = 'https://api.waqi.info/search/?keyword=tehran&token=60b5dcf12ededfa0a6a83118231ab5f34d64ce6b';
% options = weboptions('Timeout',50);
% response = webread(url, options);
% if response.status == "ok"
%     disp("Get Done");
% end

% % disp(getAqi())
% % 
% % function [aqiData] = getAqi()
% %     url = sprintf('https://api.waqi.info/search/?keyword=%s&token=%s', "tehran", "60b5dcf12ededfa0a6a83118231ab5f34d64ce6b");
% %     options = weboptions('Timeout', 2.5);
% %     response = webread(url, options);
% %     data = response.data;
% %     numb = 0;
% %     total = 0;
% %     message = "";
% %     for num = 1:numel(data)
% %         loc = data(num);
% %         aqi = str2double(loc.aqi);
% %         if ~isnan(aqi)
% %             numb = numb + 1;
% %             total = total + aqi;
% %             message = strcat(message, sprintf('[%s]: %s\n', loc.station.name, loc.aqi));
% %         end
% %     end
% %     aqiData.aqi = total / numb;
% %     aqiData.message = message;
% % end
% 
% fb = 100; % نیروی عمودی به دکل (نیوتن)
% h = 60; % ارتفاع دکل (متر)
% b = 3; % عرض دکل (متر)
% L = 5; % طول دکل (متر)

% P = calcPressure(fb, h, b, L); % محاسبه فشار وارد بر ۴ پایه دکل
% 
% fprintf('فشار وارد بر ۴ پایه دکل برابر است با: %f پاسکال\n', P);
% 
% function [P] = calcPressure(F, h, b, L)
% % تابع محاسبه فشار وارد بر ۴ پایه دکل برق
% % F: نیروی عمودی به دکل
% % h: ارتفاع دکل
% % b: عرض دکل
% % L: طول دکل

% % ثابت‌ها
% g = 9.81; % شتاب جاذبه
% rho = 1.225; % چگالی هوا
% Cp = 1.2; % ضریب فشار هوا
% 
% % محاسبه مساحت مقطع عرضی دکل
% A = b * h;
% 
% % محاسبه ضریب تنش باد
% K = 1 + (0.5 * Cp * rho * F^2 * L^2) / (A * g);
% 
% % محاسبه فشار وارد بر پایه‌ها
% P = K * F / (4 * A);
% end
% 
% clc
% clear
% n = input("N : ");
% m = input("M : ");
% 
% if n > m
%     t = n;
%     n = m;
%     m = t;
% end
% 
% a = 0;
% 
% while m >= n
%     m = m - n;
%     a = a + 1;
% end
% 
% disp([a,m])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Term 2,Code 1 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% 
% c = 0; sn = 0; sp = 0;
% 
% while true
%     a = input("A : ");
% 
%     if a < 0; sn = sn + a; else; sp = sp + a; end;
% 
%     c = c + 1;
%     
%     if ~(c < 5); break; end;
% end
% 
% fprintf("SN: %.1f\nSP: %.1f\n", sn, sp);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%% Term 2,Code 2 %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% 
% s = 0;
% 
% while true
%     n = input("N : ");
% 
%     if n == 0; break; end;
% 
%     p = n - (floor(n/10)*10);
% 
%     if p == 3; s = s + 1; end;
% end
% 
% fprintf("S: %d\n", s);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% clc; clear;
% 
% n=1:15;         
% tau=linspace(-0.5,0.5,100);
% sn=sin(pi*n/4)./(pi*n/4);
% cntau=cos(2*pi*n'*tau);
% f=0.25*(1+2*sn*cntau);
% plot(tau,f);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% x = -2*pi:0.01:2*pi;
% f = x.^2;
% plot(x, f, 'LineWidth', 4);
% 
% X = -4*pi:0.01:4*pi;
% L = pi;
% a_0 = 8/3*pi^2;
% 
% s = a_0/2;
% 
% for n = 1:15
%     an = 4/n^2;
%     bn = -4*pi/n;
%     s = s + an*cos(n*pi/L*X) + bn*sin(n*pi/L*X);
% end
% plot(X, s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 
% X = -2:0.01:2;
% L = 1/2;
% a_0 = 1;
% 
% s = a_0/2;
% 
% for n = 1:200
%     a_n = 0;
%     b_n = -1/n*pi;
%     s = s + a_n*cos(n*pi/L*X) + b_n*sin(n*pi/L*X);
% end
% plot(X, s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%    
% X = -2*pi:0.01:2*pi;
% L = pi;
% 
% f = @(x) (-sin(x) + cos(2*x)).^2;
% 
% a_0 = integral(@(x) f(x), 0, L) / L;
% 
% s = a_0/2;
% 
% N = 500;
% b_3 = 0;
% for n = 1:N
%     a_n = integral(@(x) f(x) .* cos(2*pi*n*x/L), 0, L) * (2/L);
%     
%     b_n = integral(@(x) f(x) .* sin(2*pi*n*x/L), 0, L) * (2/L);
%     
%     s = s + a_n*cos(2*pi*n*X/L) + b_n*sin(2*pi*n*X/L);
%     
%     if n == 3
%         b_3 = b_n;
%     end
% end
% 
% fprintf('b_3: %f\n', b_3);
% 
% plot(X, s);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% clc; clear;
% 
% for n = 1:2
%    x = -(2):0.001:2;
%    y = (sqrt(cos(x)).*cos(200*x)+sqrt(abs(x))-0.7).*(4-x.*x).^0.01;
%    plot(x, y, 'black');
% end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Mechanics-Of-Materials %%%%%%%%%%%%%
%%%%%%%%%%%%  Computer - Problems   %%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%% P1-C1 %%%%%%%%%%
% clc; clear;
% 
% tElements = input("Total Elements : ");
% if ~ isnumeric(tElements) || ~ isscalar(tElements) || ~(tElements > 0); disp("Please enter a number!"); return; end;
% 
% data = cell(tElements, 1);
% 
% for c = 1:tElements
%     diameter = input("Diameter (E:" + c + ") [=> m]: ");
%     load = input("Load Applied (E:" + c + ") [=> N]: ");
% 
%     data{c, 1} = struct('diameter', diameter, 'load', load);
% 
%     area = pi * (data{c}.diameter / 2)^2;
%     averageStress = data{c}.load / area;
% 
%     data{c, 1}.area = area;
%     data{c, 1}.averageStress = averageStress;
% end
% 
% for c = 1:tElements
%     fprintf('\nElement %d \n    Force: %.2f (N)\n    Area: %.4e (M²)\n    Average Stress: %.4f (Pa)\n', c, data{c}.load, data{c}.area, data{c}.averageStress);
% end


%%%%%%%%% P1-C4 %%%%%%%%%%
clc; clear;

P = input("Force Applied [=> kips]: ");
ultimate_load = input("Ultimate Load [=> kips]: ");

alpha_range = (0:0.1:45);
beta_range = (0:0.1:45);

f_s = zeros(length(alpha_range), length(beta_range));

for i = 1:length(alpha_range)
    for j = 1:length(beta_range)
        alpha = alpha_range(i);
        beta = beta_range(j);

        force = P * ((15*sin(alpha) + 30 * cos(alpha)) / (15 * cos(beta) + 12 * sin(beta)));

        f_s(i, j) = ultimate_load / force;
    end
end

% (b) محاسبه ماکزیمم فاکتور ایمنی برای هر مقدار α
[max_safety_factors, max_beta_indices] = max(f_s);
optimal_beta_values = beta_range(max_beta_indices);
optimal_alpha_values = alpha_range;


% (c) محاسبه مینیمم فاکتور ایمنی
[min_safety_factor, min_safety_factor_idx] = min(f_s(:));
[min_alpha_idx, min_beta_idx] = ind2sub(size(f_s), min_safety_factor_idx);



% Display the results
fprintf('(b) Maximum Safety Factor: %.4f for β = %.2f and α = %.2f in radians\n', max_safety_factors, optimal_beta_values, optimal_alpha_values);
fprintf('(c) Minimum Safety Factor: %.4f for β = %.2f and α = %.2f in radians\n', min_safety_factor, beta_range(min_beta_idx), alpha_range(min_alpha_idx));


