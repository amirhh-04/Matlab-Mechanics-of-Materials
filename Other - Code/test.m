
handel()
function handel()
   playersData = fopen('players.txt','a+');
   %loadedData = fscanf(playersData, "Id: %g\nName: %s\nLicense: %s\nIdentifire: %s\n---------------------\n", Inf);

   inid = input("Input Id: ");
   %if isnumeric(inid) ~= 1; disp("not number!"); return; end;

   inname = input("Input Name: ");

   [id, name, license, identifire] = getPlayerIdentifires(inid, inname);

   disp("---------------------");
   fprintf("Id: %g\nName: %s\nLicense: %s\nIdentifire: %s\n", id, name, license, identifire);
   fprintf(playersData, "Id: %g\nName: %s\nLicense: %s\nIdentifire: %s\n---------------------\n", id, name, license, identifire);
   disp("---------------------");
end


function [id, name, license, identifire] = getPlayerIdentifires(clid, clname)
   id = clid;
   name = clname;
   license = "license:" + clid;
   identifire = "steam:" + clid;
end

