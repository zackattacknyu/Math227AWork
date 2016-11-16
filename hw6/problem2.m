%Part A
Nvals = 20000;
lambda = 0.8;
res = sampleFromDist(lambda,Nvals);
%%

%Part B

qMatrix = [0 5 0 0;2 0 1 0;0 0 0 7;1 0 3 0];

initState = 1;
numSteps = 30;

numPlots = 3;
timesArr = cell(1,numPlots);
statesArr = cell(1,numPlots);
for jj = 1:numPlots
    [timesArr{jj},statesArr{jj}] = computeTimecourse(qMatrix,initState,numSteps);
end

figure
hold on
stairs(timesArr{1},statesArr{1},'r','LineWidth',5)
stairs(timesArr{2},statesArr{2},'g','LineWidth',3)
stairs(timesArr{3},statesArr{3},'k')
xlabel('Time elapsed');
ylabel('Current state');
legend('Timecourse 1','Timecourse 2','Timecourse 3');
axis([0 inf 0 5])
hold off
%%
%Part C

%k1,k2 values
k1=2;
k2=3;

%A,B,C values in each state
Avals=100:-1:20;
Bvals=80:-1:0;
Cvals=0:1:80;

%initialize transition matrix
qMatrix=zeros(length(Avals));

%assign transition values correctly
for state=1:80
   qMatrix(state,state+1)=k1*Avals(state)*Bvals(state);
   qMatrix(state+1,state)=k2*Cvals(state+1);
end

%initial state of 1, do 100 time steps
[chemTimes,chemStates]=computeTimecourse(qMatrix,1,100);

%make array for A,B,C values
Acourse = Avals(chemStates);
Bcourse = Bvals(chemStates);
Ccourse = Cvals(chemStates);

%plot the results
figure
hold on
stairs(chemTimes,Acourse,'r','LineWidth',2)
stairs(chemTimes,Bcourse,'g','LineWidth',2)
stairs(chemTimes,Ccourse,'k','LineWidth',2)
xlabel('Time elapsed');
ylabel('Number of Elements');
legend('chemical A','chemical B','chemical C');
hold off