%Oumaima Lamaakel - 2017
%Chapter 1: Introduction, concept of stress
%% 
%Problem 1: A solid steel rod consisting of n cylindrical elements welded together is subjected to vertical loading. 
%Take input from user
n=input('enter the number of elements:');
%Take input for the load on the i_th element
%Calculate the cross-sectional area
fprintf('-------------------')
for i=1:1:n
	fprintf('\nEnter force on element %d in [N] = ', i)
    %KIPS> fprintf('\nEnter force on element %d in [kips] = ', i)
	F(i)=input('');
	fprintf('Enter diameter for the element %d [mm] = ', i)
    %INCHES> fprintf('Enter diameter for the element %d [in] = ', i)
	d(i)=input('');
	Area(i)=(pi*((d(i))^2))/4;
end

%Calculate and print results
fprintf('\n-------------------\n')
fprintf('Element\t\tStress(MPa)\n')
%fprintf('Element\t\tStress(Ksi)\n')
fprintf('-------------------\n')
for i=1:1:n
	if 1==1
		Load(i)=F(i);
	else
		Load(i)=F(i)+Load(i-1);
	end

	Stress(i)=Load(i)/Area(i);
	fprintf('%2.0f\t\t% 2.2f\n', i, Stress(i))
end
