%Part A
Nvals = 20000;
lambda = 0.8;
res = sampleFromDist(lambda,Nvals);
%%

%Part B

%nn = 5;
%qMatrix = floor(rand(nn,nn).*10); %example trans probs
qMatrix = [0 5 0 0;2 0 1 0;0 0 0 7;1 0 3 0];

initState = 1;
numSteps = 30;

numPlots = 3;
timesArr = cell(1,numPlots);
statesArr = cell(1,numPlots);
for jj = 1:numPlots
    [timesArr{jj},statesArr{jj}] = computeTimecourse(qMatrix,initState,numSteps);
end
%%
figure
hold on
stairs(timesArr{1},statesArr{1},'r','LineWidth',5)
stairs(timesArr{2},statesArr{2},'g','LineWidth',3)
stairs(timesArr{3},statesArr{3},'b')
axis([0 inf 0 5])
hold off

