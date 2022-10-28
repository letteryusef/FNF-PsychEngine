package;

class Language
{
    public static var uiTexts:Map<String, Dynamic> = [];
    public static var pauseTranslation:Array<String> = [];
    public static var additionalPauseTranslation:Array<String> = [];
    public static var titleWindow:Array<String> = [];
    
    public static function reloadTextTranslation()
    {
        switch(ClientPrefs.language)
        {
            case 'PT-BR':
                uiTexts = [
                    'score' => 'Pontuação',
                    'misses' => 'Erros',
                    'accuracy' => 'Precisão',
                    'ratingSuck' => 'Você é um Lixo!',
                    'ratingShit' => 'Merda',
                    'ratingBad' => 'Ruim',
                    'ratingBruh' => 'Bruh',
                    'ratingMeh' => 'Meh',
                    'ratingNice' => 'Boa',
                    'ratingGood' => 'Beleza',
                    'ratingGreat' => 'Ótimo',
                    'ratingSick' => 'Maneiro!',
                    'ratingPerfect' => 'Perfeito!!',
                    'bestScoreFreeplay' => 'MELHOR PONTUAÇÃO',
                    'weekScore' => 'PONTUAÇÃO DA SEMANA',
                    'downTextFreeplayPRELOAD' => ['Aperte ESPAÇO para escutar a música / Aperte CTRL para abrir o menu de Modificadores / Aperte RESET para resetar sua Pontuação e Precisão.', 16],
                    'downTextFreeplay' => ['Aperte CTRL para abrir o menu de Modificadores / Aperte RESET para resetar sua Pontuação e Precisão.', 18],
                    'searchInput' => 'Clique aqui para Procurar...',
                    'optionsTitles' => ['Gameplay', 'Visuais e UI', 'Gráficos', 'Controles', 'Ajustar Delay e Combo'],
                    'curTitleOption' => [
                        'Ajustes de Gameplay'
                    ],
                    'curOptionNames' => [
                        'Modo Controle', // Ajustes de Gameplay
                        'Downscroll',
                        'Middlescroll',
                        'Notas do Oponente',
                        'Ghost Tapping',
                        'Movimentos da Câmera',
                        'Tipo de Movimento da Câmera:',
                        'Desativar Botão de Resetar',
                        'Volume do Hitsound',
                        'Offset da Precisão',
                        'Maneiro! Hit Window',
                        'Ótimo Hit Window',
                        'Ruim Hit Window',
                        'Frames Seguros',
                        'Língua:', // 14
                        'Tema Escuro',
                        'Efeitos de Onda no Hold',
                        'Splash de Notas',
                        'Esconder HUD',
                        'Estilo do Combo',
                        'Barra de Tempo',
                        'Luzes Piscantes'
                    ],
                    'curOptionDescription' => [
                        'Marque aqui se você quer jogar\ncom um Controle ao invés de usar o Teclado.', // Ajustes de Gameplay
                        'Se marcado, notas irão pra baixo ao invés de ir pra cima, simples não é?',
                        'Se marcado, suas notas ficarão no centro.',
                        'Se não marcado, notas do oponente ficarão escondidos.',
                        'Se marcado, você não irá pegar erros se clicar alguma tecla\nenquanto não tiver nenhuma nota para acertar.',
                        'Se marcado, câmera irá se mover enquanto você acerta as notas.',
                        'Selecione o modo que a câmera irá se mover.',
                        'Se marcado, apertar RESET irá fazer nada.',
                        'Notas engraçadinhas irão fazer um \"Tick!\" quando acertar-los.',
                        'Muda o quão tarde/cedo você irá acertar para um \"Maneiro!\"\nValores altos significam que você irá acertar mais tarde.',
                        'Muda a quantia de tempo para você ter\n um \"Maneiro!\" em milisegundos.',
                        'Muda a quantia de tempo para você ter\n um \"Ótimo\" em milisegundos.',
                        'Muda a quantia de tempo para você ter\n um \"Ruim\" em milisegundos.',
                        'Muda a quantia de frames você irá precisar para\nacertar uma nota mais cedo ou mais tarde.',
                        'Auto explanatório não é?, escolha sua língua com preferência.', // 14
                        'Se marcado, a janela do jogo ficará com um Tema Escuro.',
                        'Se marcado, sprites de "hold" irão ter um efeito de Ondas.',
                        'Se marcado, acertando notas "Maneiro!" não irá mostrar partículas.',
                        'Se marcado, alguns elementos da HUD ficarão escondidos.',
                        'Qual estilo dos Combos você quer que apareça?',
                        'Como irá ser o texto da Barra de Tempo?',
                        'Desmarque se você é sensivo a luzes piscantes!'
                    ],
                    'secretOptionTitle' => 'Segredos Escondidos'
                ];
                pauseTranslation = ['Resumir', 'Reniciar a Música', 'Mudar a Dificuldade', 'Ajustes', 'Sair para o Menu'];
                additionalPauseTranslation = ['Sair do Modo Charting', 'Pular Tempo', 'Acabar a Música', 'Mudar Modo Prática', 'Mudar Modo Botplay', 'Bolazuladas', 'MODO PRÁTICA', 'MODO CHARTING'];
                titleWindow = ['Inicio', 'Menu Principal', 'Modo História', 'FreePlay: Carregando!', 'Creditos', 'Ajustes'];
            case 'English':
                uiTexts = [
                    'score' => 'Score',
                    'misses' => 'Misses',
                    'accuracy' => 'Rating',
                    'ratingSuck' => 'You Suck!',
                    'ratingShit' => 'Shit',
                    'ratingBad' => 'Bad',
                    'ratingBruh' => 'Bruh',
                    'ratingMeh' => 'Meh',
                    'ratingNice' => 'Nice',
                    'ratingGood' => 'Good',
                    'ratingGreat' => 'Great',
                    'ratingSick' => 'Sick!',
                    'ratingPerfect' => 'Perfect!!',
                    'bestScoreFreeplay' => 'PERSONAL BEST',
                    'weekScore' => 'WEEK SCORE',
                    'downTextFreeplayPRELOAD' => ['Press SPACE to listen to the Song / Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.', 16],
                    'downTextFreeplay' => ['Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.', 18],
                    'searchInput' => 'Click here to search...',
                    'optionsTitles' => ['Gameplay', 'Visuals and UI', 'Graphics', 'Controls', 'Adjust Delay and Combo'],
                    'curTitleOption' => [
                        'Gameplay Settings'
                    ],
                    'curOptionNames' => [
                        'Controller Mode',
                        'Downscroll',
                        'Middlescroll',
                        'Opponent Notes',
                        'Ghost Tapping',
                        'Camera Movement',
                        'Camera Move Type:',
                        'Disable Reset Button',
                        'Hitsound Volume',
                        'Rating Offset',
                        'Sick! Hit Window',
                        'Good Hit Window',
                        'Bad Hit Window',
                        'Safe Frames'
                    ],
                    'curOptionDescription' => [
                        'Check this if you want to play with\na controller instead of using your Keyboard.',
                        'If checked, notes go Down instead of Up, simple enough.',
                        'If checked, your notes get centered.',
                        'If unchecked, opponent notes get hidden.',
                        "If checked, you won't get misses from pressing keys\nwhile there are no notes able to be hit.",
                        'If checked, camera will move if you hit a certain note.',
                        'Select the way that the camera moves.',
                        "If checked, pressing Reset won't do anything.",
                        'Funny notes does \"Tick!\" when you hit them.',
                        'Changes how late/early you have to hit for a "Sick!"\nHigher values mean you have to hit later.',
                        'Changes the amount of time you have\nfor hitting a "Sick!" in milliseconds.',
                        'Changes the amount of time you have\nfor hitting a "Good" in milliseconds.',
                        'Changes the amount of time you have\nfor hitting a "Bad" in milliseconds.',
                        'Changes how many frames you have for\nhitting a note earlier or late.'
                    ],
                    'secretOptionTitle' => 'Secret Stuff'
                ];
                pauseTranslation = ['Resume', 'Restart Song', 'Change Difficulty', 'Options', 'Exit to menu'];
                additionalPauseTranslation = ['Leave Charting Mode', 'Skip Time', 'End Song', 'Toggle Practice Mode', 'Toggle Botplay', 'Blueballed', 'PRACTICE MODE', 'CHARTING MODE'];
                titleWindow = ['Title', 'Main Menu', 'Story Mode', 'FreePlay: On Load!', 'Credits', 'Options'];
        }
    }
}