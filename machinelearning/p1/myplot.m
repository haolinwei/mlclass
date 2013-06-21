function [rx,ry,bx,by] = myplot(X)

indexOne = 50
rx=X(1:50,1)
ry=X(1:50,2)
bx=X(51:99,1)
by=X(51:99,2)

plot(rx,ry,'r+')
hold all
plot(bx,by,'b+')
