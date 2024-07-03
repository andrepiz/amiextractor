function img = bin2img(bin, number_records, bytes_per_px, flag_ibmformat)

if ~exist('flag_ibmformat','var')
    flag_ibmformat = false;
end

pxs = length(bin)/bytes_per_px;
rows = number_records;
cols = fix(pxs/rows);
img = zeros(rows, cols);

jj = 1;
kk = 1;
for ii = 1:pxs
    sb = bin(bytes_per_px*ii-[0:1:bytes_per_px-1]); % from msb to lsb
    b = dec2bin(sb, 8);
    bin_temp = strjoin(reshape(string(b), 1, []),'');
    if flag_ibmformat
        pixVal = ibm2ieee(char(bin_temp));
    else
        pixVal = bin2dec(bin_temp);
    end
    img(jj, kk) = pixVal; %Reconstruct image row by row
    kk = kk + 1;
    if mod(ii, cols) == 0
        jj = jj + 1;
        kk = 1;
    end
end

% [XX, YY] = meshgrid(1:size(img, 2), 1:size(img, 1));
% figure()
% grid on, hold on
% surf(XX, YY, img, 'EdgeColor','none')
% set(gca,'YDir','reverse')
% colorbar
% clim([min(img,[],'all'), max(img,[],'all')])
% xlim([1, size(img, 1)])
% ylim([1, size(img, 2)])

% if ~flag_ibmformat
%     switch bytes_per_px
%         case 1
%             img = uint8(img);
%         case 2
%             img = uint16(img);
%         case 4
%             img = uint32(img);
%         otherwise
%     end
% end

end