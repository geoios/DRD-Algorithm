function [As Ls Ps] = IsotropyTrans(Zs,As,Ls,Ps)
n = length(Zs);
if nargin == 2
   for i=1:n
       Zsi = Zs{i};
       for j=1:length(Zsi)
           Ps{i}(j) = Zs{i}(j)^2;
           As{i}(j,:) = As{i}(j,:)/Zs{i}(j);
           Ls{i}(j,:) = Ls{i}(j,:)/Zs{i}(j);
       end
   end
else
   for i=1:n
       Zsi = Zs{i};
       for j=1:length(Zsi)
           Ps{i}(j)   = Zs{i}(j)^2 * Ps{i}(j);
           As{i}(j,:) = As{i}(j,:)/Zs{i}(j);
           Ls{i}(j,:) = Ls{i}(j,:)/Zs{i}(j);
       end
   end
end

end