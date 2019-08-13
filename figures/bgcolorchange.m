fname = {'anthology-01.jpg',
'anthology-02.jpg',
'anthology-03.jpg',
'anthology-04.jpg',
'anthology-05.jpg',
'anthology-06.jpg',
'anthology-07.jpg',
'anthology-08.jpg',
'anthology-09.jpg',
'anthology-10.jpg',
'anthology-11.jpg',
'anthology-12.jpg',
'anthology-13.jpg',
'anthology-14.jpg',
'anthology-15.jpg',
'anthology-16.jpg',
'anthology-17.jpg',
'anthology-18.jpg',
'anthology-19.jpg',
'anthology-20.jpg',
'masaoka.png',
'matsuo.png',
'kawahigashi.png',
'mizuhara.png',
'natsume.png',
'kobayashi.png',
'takahama.png',
'yosa.png',
'santoka.png'
};
bgcolor = [230, 230, 207];
for i = 1:length(fname)
    currentfig = fname{i};
    A = imread(['original/', currentfig]);
    if size(A, 3) == 3
        bgmask = sum(A, 3) > 720;
        bgmask = + bgmask;
        B = A;
        B(:, :, 1) = B(:, :, 1) .* uint8(1 - bgmask) + bgcolor(1) * uint8(bgmask);
        B(:, :, 2) = B(:, :, 2) .* uint8(1 - bgmask) + bgcolor(2) * uint8(bgmask);
        B(:, :, 3) = B(:, :, 3) .* uint8(1 - bgmask) + bgcolor(3) * uint8(bgmask);
        %         imshow(B)
        %         pause
    else if size(A, 3) == 1
        bgmask = A > 240;
        bgmask = + bgmask;
        B = repmat(A, 1, 1, 3);
        B(:, :, 1) = B(:, :, 1) .* uint8(1 - bgmask) + bgcolor(1) * uint8(bgmask);
        B(:, :, 2) = B(:, :, 1) .* uint8(1 - bgmask) + bgcolor(2) * uint8(bgmask);
        B(:, :, 3) = B(:, :, 1) .* uint8(1 - bgmask) + bgcolor(3) * uint8(bgmask);
        %         imshow(B)
        %         pause
    end
end
imwrite(B, currentfig);
end
