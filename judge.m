function [Y] = judge(m,n)
%m:7-12 n:1-6
a = m-6;
b = n;
list = {'a','b','c','d','e','f';...
        'g','h','i','j','k','l';...
        'm','n','o','p','q','r';...
        's','t','u','v','w','x';...
        'y','z','1','2','3','4';...
        '5','6','7','8','9','0'};

Y =  list{b,a} ;  




end
