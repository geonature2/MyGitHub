function col = getColorTable(colpalname,crange,value,nmaxcol,scale)
if (nargin < 5)
  scale = 'linear';
end
if (nargin < 4)
  colarray = eval([colpalname ';']);
  nmaxcol = length(colarray);
else 
  colarray = eval([colpalname '(' num2str(nmaxcol) ');']);
end

if (length(crange) ~= 2) 
  error('crange = [cmin cmax]');
end

if (findstr(scale,'log'))
  crange = log10(crange);
  value  = log10(value);
end

cmin = min(crange);
cmax = max(crange);
dc = (cmax-cmin)/(nmaxcol-2);
carr = cmin:dc:cmax;

[mm,nn]=size(value);
col = cell(mm,nn);
for ii=1:mm
  for jj=1:nn
    mlower  = find(carr <  value(ii,jj));
    mhigher = find(carr >= value(ii,jj));
    if (isempty(mhigher))
      col{ii,jj} = colarray(max(mlower),:);
    else
      col{ii,jj} = colarray(min(mhigher),:);
    end
  end
end
