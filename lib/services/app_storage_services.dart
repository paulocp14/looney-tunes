import 'package:shared_preferences/shared_preferences.dart';

enum STORAGE_CHAVES {
  CHAVE_DADOS_CADASTRAIS_NOME,
  CHAVE_DADOS_CADASTRAIS_NASCIMENTO,
  CHAVE_DADOS_CADASTRAIS_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_LINGUAGEM,
  CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA,
  CHAVE_DADOS_CADASTRAIS_SALARIO,
  CHAVE_DADOS_CADASTRAIS_DATA_NASCIMNETO,

  CHAVE_NOME_USUARIO,
  CHAVE_RECEBER_NOTIFICACOES,
  CHAVE_TEMA_ESCURO,
  CHAVE_ALTURA,
  CHAVE_NUMERO_ALEATORIO,
  TOTALDECLIQUES,
}

class AppStorigeService {
  Future<void> setDadosCadastraisNome(String nome) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString(), nome);
  }

  Future<String> getDadosCadastraisNome() async {
    return _getString(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_NOME.toString());
  }

  Future<void> setDadosCadstraisDataNascimento(String data) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMNETO.toString(),
        data.toString());
  }

  Future<String> getDadosCadstraisDataNascimento(String nascimento) async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_DATA_NASCIMNETO.toString());
  }

  Future<void> setDadosCadstraisDataNivelExperiencia(String value) async {
    await _setString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_EXPERIENCIA.toString(),
        value.toString());
  }

  Future<String> getDadosCadstraisDataNivelExperiencia(
      String nascimento) async {
    return _getString(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_EXPERIENCIA.toString());
  }

  Future<void> setDadosCadstraisLinguagens(List<String> values) async {
    await _setStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGEM.toString(), values);
  }

  Future<List<String>> getDadosCadstraisLinguagens() async {
    return _getStringList(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_LINGUAGEM.toString());
  }

  Future<void> setDadosCadstraisTempoexperiencia(int values) async {
    await _setint(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString(),
        values);
  }

  Future<int> getDadosCadstraisTempoexperiencia() async {
    return _getint(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_TEMPO_EXPERIENCIA.toString());
  }

  Future<void> setDadosCadstraisSalario(double values) async {
    await _setdouble(
        STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString(), values);
  }

  Future<double> getDadosCadstraisSalario() async {
    return _getdouble(STORAGE_CHAVES.CHAVE_DADOS_CADASTRAIS_SALARIO.toString());
  }

  Future<void> setDadosCadastraisNomeUsuario(String nome) async {
    await _setString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString(), nome);
  }

  Future<String> getDadosCadastraisNomeUsuario() async {
    return _getString(STORAGE_CHAVES.CHAVE_NOME_USUARIO.toString());
  }

  Future<void> setDadosCadastraisChaveAltura(double value) async {
    await _setdouble(STORAGE_CHAVES.CHAVE_ALTURA.toString(), value);
  }

  Future<double> getDadosCadastraisChaveAltura(String value) async {
    return _getdouble(STORAGE_CHAVES.CHAVE_ALTURA.toString());
  }

  Future<void> setDadosCadstraisNotificacoes(bool values) async {
    await _setBool(
        STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString(), values);
  }

  Future<bool> getDadosCadstraisNotificacoes() async {
    return _getbool(STORAGE_CHAVES.CHAVE_RECEBER_NOTIFICACOES.toString());
  }

  Future<void> setDadosCadstraisTema(bool values) async {
    await _setBool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString(), values);
  }

  Future<bool> getDadosCadstraisTema() async {
    return _getbool(STORAGE_CHAVES.CHAVE_TEMA_ESCURO.toString());
  }

  Future<void> setNumeroAleatorio(int values) async {
    await _setint(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString(), values);
  }

  Future<int> getNumeroAleatorio() async {
    return _getint(STORAGE_CHAVES.CHAVE_NUMERO_ALEATORIO.toString());
  }

  Future<void> setcliques(int values) async {
    await _setint(STORAGE_CHAVES.TOTALDECLIQUES.toString(), values);
  }

  Future<int> getCliques() async {
    return _getint(STORAGE_CHAVES.TOTALDECLIQUES.toString());
  }
  // hahahaha//ahahahah//jahahahahah

  _setString(String chave, String value) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  Future<String> _getString(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getString(chave) ?? "";
  }

  _setStringList(String chave, List<String> value) async {
    var storage = await SharedPreferences.getInstance();
    return storage.setStringList(chave, value);
  }

  Future<List<String>> _getStringList(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getStringList(chave) ?? [];
  }

  _setint(String chave, int value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setInt(chave, value);
  }

  Future<int> _getint(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getInt(chave) ?? 0;
  }

  _setdouble(String chave, double value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setDouble(chave, value);
  }

  Future<double> _getdouble(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getDouble(chave) ?? 0;
  }

  _setBool(String chave, bool value) async {
    var storage = await SharedPreferences.getInstance();
    storage.setBool(chave, value);
  }

  Future<bool> _getbool(String chave) async {
    var storage = await SharedPreferences.getInstance();
    return storage.getBool(chave) ?? false;
  }
}
