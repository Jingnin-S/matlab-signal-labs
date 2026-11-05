sys = tf([2 1],[1 3 2]);
t = 0:0.01:6;
x = (e^-3*t)*u(t);
y = lsim(sys,x,t);
plot(t,y);
xlabel('time(s)');
ylabel('y(t)')
