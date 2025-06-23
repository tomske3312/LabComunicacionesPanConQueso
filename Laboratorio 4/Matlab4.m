% Comparación teórica de BER para BPSK, QPSK y 8-PSK
EbN0_dB = 0:1:11;                            % Rango de Eb/N0 en dB
EbN0 = 10.^(EbN0_dB/10);                     % Conversión a escala lineal

% Función Q
Q = @(x) 0.5*erfc(x/sqrt(2));

% BER teórico
ber_bpsk = Q(sqrt(2*EbN0));                  % BPSK
ber_qpsk = Q(sqrt(2*EbN0));                  % QPSK (igual a BPSK en AWGN)
ber_8psk = 2 * Q(sqrt(2*EbN0) * sin(pi/8));  % Aproximación para 8-PSK

% Gráfico
semilogy(EbN0_dB, ber_bpsk, '-o', ...
         EbN0_dB, ber_qpsk, '-s', ...
         EbN0_dB, ber_8psk, '-^', 'LineWidth', 1.5)
grid on
xlabel('E_b/N_0 (dB)')
ylabel('BER')
legend('BPSK', 'QPSK', '8-PSK')
title('BER teórico en canal AWGN para distintas modulaciones')