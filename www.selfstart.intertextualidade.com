<!DOCTYPE html>
<html lang="pt-br">
<head>
  <meta charset="UTF-8">
  <title>Self Start - Intertextualidade</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #2e004f; /* Roxo escuro */
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }
    .chat {
      background: white;
      width: 350px;
      padding: 20px;
      border-radius: 15px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.3);
    }
    .messages {
      max-height: 300px;
      overflow-y: auto;
      margin-bottom: 15px;
    }
    .msg {
      margin: 10px 0;
      padding: 10px;
      border-radius: 10px;
    }
    .user {
      background: #d1e7dd;
      text-align: right;
    }
    .bot {
      background: #e2e3e5;
      text-align: left;
    }
    input, button, select {
      padding: 10px;
      border-radius: 8px;
      border: 1px solid #ccc;
      margin-top: 5px;
    }
    button {
      background: #6a0dad; /* Roxo vibrante */
      color: white;
      border: none;
      cursor: pointer;
    }
    button:hover {
      background: #580b91;
    }
  </style>
</head>
<body>
  <div class="chat">
    <div class="messages" id="messages">
      <div class="msg bot">Oi! Bem-vindo à Intertextualidade. Antes de tudo, me conte sobre você e o que você quer aprender!</div>
    </div>
    <select id="interesse">
      <option value="futebol">⚽ Futebol</option>
      <option value="musica">🎵 Música</option>
      <option value="games">🎮 Games</option>
      <option value="series">📺 Séries</option>
      <option value="moda">👗 Moda</option>
    </select>
    <input type="text" id="input" placeholder="Digite sua mensagem...">
    <button onclick="enviarMensagem()">Enviar</button>
  </div>

  <script>
    function enviarMensagem() {
      const input = document.getElementById('input');
      const interesse = document.getElementById('interesse').value;
      const messages = document.getElementById('messages');
      const userMsg = document.createElement('div');
      userMsg.className = 'msg user';
      userMsg.textContent = input.value;
      messages.appendChild(userMsg);

      const botMsg = document.createElement('div');
      botMsg.className = 'msg bot';

      if (interesse === 'futebol') {
        botMsg.textContent = `Legal! Que tal aprender ${input.value} usando exemplos de futebol? Por exemplo, calcular a média de gols de um time.`;
      } else if (interesse === 'musica') {
        botMsg.textContent = `Show! Vamos ligar ${input.value} com música. Que tal aprender ritmo e matemática com batidas de uma canção?`;
      } else if (interesse === 'games') {
        botMsg.textContent = `Top! Você pode aprender ${input.value} com games, como calcular a vida restante do personagem em porcentagem.`;
      } else if (interesse === 'series') {
        botMsg.textContent = `Boa! Podemos usar séries para entender ${input.value}, como relacionar episódios a linhas do tempo em história.`;
      } else if (interesse === 'moda') {
        botMsg.textContent = `Adorei! Dá pra aprender ${input.value} com moda, como usar proporções para criar combinações de looks.`;
      }

      messages.appendChild(botMsg);
      input.value = '';
      messages.scrollTop = messages.scrollHeight;
    }
  </script>
</body>
</html>
