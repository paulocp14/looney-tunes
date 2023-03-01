import 'dart:math';

class GeradorNumeroAleatoriService {
  static int gerarNumeroAleatorio(int numeroMaximo) {
    Random numeroAleatorio = Random();
    return numeroAleatorio.nextInt(numeroMaximo);
  }
}
