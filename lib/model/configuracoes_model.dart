class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    _nomeUsuario = "";
    _altura = 0;
    _receberNotificacoes = false;
    _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNotificacoes,
      this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;

  set nomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  double get altura => _altura;

  set altura(double _altura) {
    _altura = altura;
  }

  bool get receberNotificacoes => _receberNotificacoes;

  set receberNotificacoes(bool _receberNotificacoes) {
    _receberNotificacoes = receberNotificacoes;
  }

  bool get temaEscuro => _temaEscuro;

  set temaEscuro(bool _temaEscuro) {
    _temaEscuro = temaEscuro;
  }
}
