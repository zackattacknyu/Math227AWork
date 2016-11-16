%Part A
Nvals = 20000;
lambda = 0.8;
res = sampleFromDist(lambda,Nvals);
%%

%Part B
nn = 5;
qMatrix = floor(rand(nn,nn).*10); %example trans probs

initState = 4;
numSteps = 100;

numPlots = 3;
timesArr = cell(1,numPlots);
statesArr = cell(1,numPlots);
for jj = 1:numPlots
    [timesArr{jj},statesArr{jj}] = computeTimecourse(qMatrix,initState,numSteps);
end

figure
hold on
for kk = 1:numPlots
   plot(timesArr{kk},statesArr{kk}); 
end
hold off

