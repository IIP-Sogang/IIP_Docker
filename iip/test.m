
disp('parallel cumputation check')
parpool(3);
parfor i=1:3, c(:,i) = eig(rand(1000));end

disp('gpu check')
disp(gpuDevice)

A = gpuArray([1 0 1; -1 -2 0; 0 1 -1]);
e = eig(A)

