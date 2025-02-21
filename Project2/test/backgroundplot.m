function A=backgroundplot(A,E,z0)
xlabel('x-axis')
ylabel('y-axis')
plot(800*(-sin(pi/3)),800*cos(pi/3),'k.','MarkerSize',7);text(800*(-sin(pi/3))-10,800*cos(pi/3)-15,'B')
hold on
plot(-500,350,'k.','MarkerSize',7);text(-510,340,'E')
plot(0,0,'k.','MarkerSize',7);text(0,10,'F')
plot(-350,620,'k.','MarkerSize',7);text(-350,630,'A')
plot(0,800,'k.','MarkerSize',7);text(0,810,'R')
plot(0,300,'k.','MarkerSize',7);text(5,310,'G')
ylim([-100,900]);
xlim([-800,400]);
plot([-500,-350],[350,620]);
end