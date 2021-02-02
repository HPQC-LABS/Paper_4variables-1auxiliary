%% Pg. 5, Eqs 15-18 (in first arXiv version)
b= dec2bin(2^10-1:-1:0)-'0';
b1=b(:,1);b2=b(:,2);b3=b(:,3);b4=b(:,4);b5=b(:,5);b6=b(:,6);b7=b(:,7);b8=b(:,8);ba1=b(:,9);ba2=b(:,10);

blue_LHS= b1.*b2.*b3.*b4 + b1.*b2.*b3 + b1.*b2.*b4 + 2*b1.*b3.*b4 + 3*b2.*b3.*b4;
blue_RHS= 3*b1.*b2 + 4*b1.*b3 + 4*b1.*b4 + 5*b2.*b3 + 5*b2.*b4 + 6*b3.*b4 + ba1.*(10 - 6*b1 - 7*b2 - 8*b3 - 8*b4);  

red_LHS= -b5.*b6.*b7.*b8 - 2*b5.*b6.*b7 - 3*b5.*b6.*b8 - 4*b5.*b7.*b8 - 5*b6.*b7.*b8;
red_RHS=  ba2.*(31 - 10*b5 - 11*b6 - 12*b7 - 13*b8); % Note that there's no negative sign in front of the whole expression, so there's a typo in the paper.

LHS= min(reshape(blue_LHS + red_LHS,4,[]));
RHS= min(reshape(blue_RHS + red_RHS,4,[]));
isequal(LHS,RHS) % Gives 1

%% Pg. 6, Eqs 23-28
b= dec2bin(2^8-1:-1:0)-'0';
b1=b(:,1);b2=b(:,2);b3=b(:,3);b4=b(:,4);b5=b(:,5);ba1=b(:,6);ba2=b(:,7);ba3=b(:,8);

blue_LHS= 5*b1.*b2.*b3.*b4 - 3*b1.*b2.*b3 - b1.*b2.*b4 - b1.*b3.*b4 - 2*b2.*b3.*b4;
blue_RHS= b1.*b2 + b1.*b3 + 3*b1.*b4 + 2*b2.*b4 + 2*b3.*b4 - ba1.*(5*b1 + 4*b2 + 4*b3 + 6*b4 - 8);

green_LHS= 4*b1.*b2.*b3.*b5 - 5.*b1.*b2.*b5 - b1.*b3.*b5 - b2.*b3.*b5;
green_RHS= (-3)*b1 + 6*b2 - 3*b3 + 5*b5 - 5*b1.*b2 + 3*b1.*b3 - 5*b1.*b5 - b2.*b3 - b3.*b5 - ba2.*(-8*b1 + 6*b2 - 4*b3 + 5*b5 + 3) + 3;

red_LHS= 3*b1.*b2.*b4.*b5 - b1.*b4.*b5 - 4*b2.*b4.*b5;
red_RHS= b1 + 4*b2 + 3*b1.*b2 - b1.*b4 - b1.*b5 - 4*b2.*b4 - 4*b2.*b5 + ba3.*(-4*b1 - 7*b2 + 5*b4 + 5*b5 + 3);

LHS= min(reshape(blue_LHS + green_LHS + red_LHS,8,[]));
RHS= min(reshape(blue_RHS + green_RHS + red_RHS,8,[]));
isequal(LHS,RHS) % Gives 1

%% Pg. 6-7, Eqs 32-38
b= dec2bin(2^10-1:-1:0)-'0';
b1=b(:,1);b2=b(:,2);b3=b(:,3);b4=b(:,4);b5=b(:,5);ba1=b(:,6);ba2=b(:,7);ba3=b(:,8);ba4=b(:,9);ba5=b(:,10);

blue_LHS= 5*b1.*b2.*b3.*b4 - 3*b1.*b2.*b3 - b1.*b2.*b4 - b1.*b3.*b4 - 2*b2.*b3.*b4;
blue_RHS= b1.*b2 + b1.*b3 + 3*b1.*b4 + 2*b2.*b4 + 2*b3.*b4 - ba1.*(5*b1 + 4*b2 + 4*b3 + 6*b4 - 8);

red_LHS= 4*b1.*b2.*b3.*b5 - 5*b1.*b2.*b5 - b1.*b3.*b5 - b2.*b3.*b5;
red_RHS= -3*b1 + 6*b2 - 3*b3 + 5*b5 - 5*b1.*b2 + 3*b1.*b3 - 5*b1.*b5 - b2.*b3 - b3.*b5 - ba2.*(-8*b1 + 6*b2 - 4*b3 + 5*b5 + 3) + 3;

purple_LHS= 3*b1.*b2.*b4.*b5 - b1.*b4.*b5 - 4*b2.*b4.*b5;
purple_RHS= b1 + 4*b2 + 3*b1.*b2 - b1.*b4 - b1.*b5 - 4*b2.*b4 - 4*b2.*b5 + ba3.*(-4*b1 - 7*b2 + 5*b4 + 5*b5 + 3);

green_LHS= 2*b1.*b3.*b4.*b5 - 3*b3.*b4.*b5;
green_RHS= ba4.*(2*b1 - 3*b3 - 3*b4 - 3*b5 + 6);

yellow_LHS= b2.*b3.*b4.*b5;
yellow_RHS= b2.*b3 + b2.*b4 + b2.*b5 + b3.*b4 + b3.*b5 + b4.*b5 + ba5.*(3 - 2*b2 - 2*b3 - 2*b4 - 2*b5);

LHS= min(reshape(blue_LHS + red_LHS + purple_LHS + green_LHS + yellow_LHS,32,[]));
RHS= min(reshape(blue_RHS + red_RHS + purple_RHS + green_RHS + yellow_RHS,32,[]));
isequal(LHS,RHS) % Gives 1

%% Pg. 7, Eqs 43, 46
b= dec2bin(2^5-1:-1:0)-'0';
b1=b(:,1);b2=b(:,2);b3=b(:,3);b4=b(:,4);ba=b(:,5);

LHS= min(reshape(sqrt(5)*(atan(2) - pi/2)*b1.*b2.*b4 + (sqrt(5)*pi/4)*(exp(1) - 1)*b2.*b3.*b4 + sqrt(5)*(exp(1) - 1)*(atan(2) - pi/4)*b1.*b2.*b3.*b4,2,[]));
RHS= min(reshape(ba.*(5.6896 - 4.4534*b4 - 4.4534*b2 - 1.4357*b1 - 5.4901*b3) + 0.1995*b1.*b2 + 1.2362*b1.*b3 + 0.1995*b1.*b4 + 4.2539*b2.*b3 + 3.2172*b2.*b4  + 4.2539*b3.*b4,2,[])); % Note that some coefficients in the paper (eq. 46) are different that the values here. It is probably a typo in the paper.
max(LHS-RHS)<1e-30 % Gives 1