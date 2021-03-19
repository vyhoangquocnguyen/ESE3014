clc, clear

[e, n, d] = KeyGenerator(); %running KeyGenerator function to get e, n and d value

m = input('Enter your secret message ');

encryptmessage = encrypt(m, e, n); %encrypting the message

disp('Encrypted Message is: ')
disp(encryptmessage)

pause(1) %for speacial effect

disp('Decrypting...')

pause(2)
decryoedmessage = decrypted(encryptmessage, d, n); %decrypting the message
disp('Secret message is ')
disp(decryoedmessage)
