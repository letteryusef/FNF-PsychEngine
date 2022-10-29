package;

class Language
{
    public static var availableLanguages:Array<String> = ['English', 'PT-BR'];
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
                    'nowPlayingText' => 'AGORA TOCANDO',
                    'bestScoreFreeplay' => 'MELHOR PONTUAÇÃO',
                    'weekScore' => 'PONTUAÇÃO DA SEMANA',
                    'downTextFreeplayPRELOAD' => ['Aperte ESPAÇO para escutar a música / Aperte CTRL para abrir o menu de Modificadores / Aperte RESET para resetar sua Pontuação e Precisão.', 16],
                    'downTextFreeplay' => ['Aperte CTRL para abrir o menu de Modificadores / Aperte RESET para resetar sua Pontuação e Precisão.', 18],
                    'searchInput' => 'Clique aqui para Procurar...',
                    'optionsTitles' => ['Gameplay', 'Visuais e UI', 'Gráficos', 'Controles', 'Ajustar Delay e Combo'],
                    'curTitleOption' => [
                        'Ajustes de Gameplay',
                        'Visuais e UI',
                        'Gráficos',
                        'Segredos Escondidos'
                    ],
                    'curOptionNames' => [
                        'Modo Controle',
                        'Downscroll',
                        'Middlescroll',
                        'Notas do Oponente',
                        'Ghost Tapping',
                        'Movimentos da Câmera',
                        'Tipo de Movimento da Câmera:',
                        'Desativar Botão de Resetar',
                        'Volume do Hitsound',
                        'Offset da Avaliação',
                        'Maneiro! Hit Window',
                        'Ótimo Hit Window',
                        'Ruim Hit Window',
                        'Frames Seguros',
                        'Língua:',
                        'Tema Escuro',
                        'Efeitos de Onda no Hold',
                        'Splash de Notas',
                        'Esconder HUD',
                        'Estilo do Combo:',
                        'Barra de Tempo:',
                        'Luzes Piscantes',
                        'Zooms de Câmera',
                        'Zoom do Texto de Pontuação no Acerto',
                        'Transparência da Barra de Vida',
                        'Contador de FPS',
                        'Contador de Memória',
                        'Contador de Limite de Memória',
                        'Música de Pausa',
                        'Checar as Atualizações',
                        'Pilha de Combos',
                        'Baixa Qualidade',
                        'Anti-Aliasing',
                        'Shaders',
                        'Taxa de Quadros',
                        'Modo Mosaico',
                        'Modo Luta',
                        'Concentração do Mosaico'
                    ],
                    'curOptionDescription' => [
                        'Marque aqui se você quer jogar\ncom um Controle ao invés de usar o Teclado.',
                        'Se marcado, notas irão pra baixo ao invés de ir pra cima, simples não é?',
                        'Se marcado, suas notas ficarão no centro.',
                        'Se desmarcado, notas do oponente ficarão escondidos.',
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
                        'Auto-explicativo, não é?',
                        'Se marcado, a janela do jogo ficará com um Tema Escuro.',
                        'Se marcado, sprites de "hold" irão ter um efeito de Ondas.',
                        'Se marcado, acertando notas "Maneiro!" não irá mostrar partículas.',
                        'Se marcado, alguns elementos da HUD ficarão escondidos.',
                        'Qual estilo dos Combos você quer que apareça?',
                        'Como irá ser o texto da Barra de Tempo?',
                        'Desmarque-a se você é sensivo a luzes piscantes!',
                        'Se desmarcado, a câmera não irá dar zooms na batida da música.',
                        'Se desmarcado, desativará o zoom do texto de Pontuação\ntoda vez que você acertar uma nota.',
                        'Quão transparente você quer que a Barra de Vida e os Icones fiquem?',
                        'Se desmarcado, esconderá o Contador de FPS.',
                        'Se desmarcado, esconderá o Contador de Memória.',
                        'Se desmarcado, esconderá o Contador de Limite de Memória.',
                        'Qual Música você quer que a Tela de Pausa toque?',
                        'Em Builds de Lançamento, Marque essa opção para checar se há\natualizações recentes no início.',
                        'Se desmarcado, Avaliações e Combos não irão empilhar, salvando Memória do Sistema e facilitando-os de ler.',
                        'Se marcado, desativará alguns detalhes do fundo, diminui o tempo de carregamento e melhora o Performance.',
                        'Se desmarcado, desativará o Anti-Aliasing, melhora a Performance ao custo dos Visuais Afiados.',
                        'Se desmarcado, desativará Shaders. É utilizado para alguns Efeitos Visuais, e também CPU Intensivo para PCs Fracos.',
                        'Muito auto-explicativo, não é?',
                        'Você quer que a tela esteja mais pixelizado?, bem agora você tem!',
                        'l-luta??',
                        'Quão pixelizado você quer que a tela seja. (SÓ FUNCIONA COM O MODO MOSAICO ATIVADO)'
                    ],
                    'controlsDescription' => [
                        'NOTAS',
                        'Esquerda',
                        'Baixo',
                        'Cima',
                        'Direita',
                        'Aceitar',
                        'Voltar',
                        'Pausa',
                        'TELA-CHEIA',
                        'Teclas',
                        'Mutar',
                        'Aumentar',
                        'Diminuir',
                        'Tecla'
                    ],
                    'noteOffsetUI' => [
                        'Batida!',
                        'Aperte CTRL para mudar a câmera dos Sprites do COMBO',
                        'Offset da Avaliação:',
                        'Offset dos Números:',
                        'Offset Atual',
                        '< Offset do Combo (Clique em Aceitar para Mudar) >',
                        '< Delay de Nota/Batida (Clique em Aceitar para Mudar) >'
                    ],
                    'secretOptionTitle' => 'Segredos Escondidos',
                    'warn' => "Eaí companheiro!\n
                    Esse Mod foi programado em outra versão de Psych\n
                    (Você meio que precisa ir pros Ajustes para alterar algumas Opções)\n
                    Ele também contém Luzes Piscantes!\n
                    Aperte ENTER para desativar-lás agora ou ESCAPE para ignorar a mensagem.\n
                    Você foi Avisado!"
                ];
                pauseTranslation = ['Resumir', 'Reniciar a Música', 'Mudar a Dificuldade', 'Ajustes', 'Sair para o Menu'];
                additionalPauseTranslation = ['Sair do Modo Charting', 'Pular Tempo', 'Acabar a Música', 'Mudar Modo Prática', 'Mudar Modo Botplay', 'Bolazuladas', 'MODO PRÁTICA', 'MODO CHARTING'];
                titleWindow = ['Inicio', 'Menu Principal', 'Modo Historia', 'FreePlay: Carregando!', 'Creditos', 'Ajustes']; // Infelizmente os nomes das janelas não aceitam acentos, representação de uma xenofobia :)
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
                    'nowPlayingText' => 'NOW PLAYING',
                    'bestScoreFreeplay' => 'PERSONAL BEST',
                    'weekScore' => 'WEEK SCORE',
                    'downTextFreeplayPRELOAD' => ['Press SPACE to listen to the Song / Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.', 16],
                    'downTextFreeplay' => ['Press CTRL to open the Gameplay Changers Menu / Press RESET to Reset your Score and Accuracy.', 18],
                    'searchInput' => 'Click here to search...',
                    'optionsTitles' => ['Gameplay', 'Visuals and UI', 'Graphics', 'Controls', 'Adjust Delay and Combo'],
                    'curTitleOption' => [
                        'Gameplay Settings',
                        'Visuals and UI',
                        'Graphics',
                        'Secret Stuff'
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
                        'Safe Frames',
                        'Language:',
                        'Dark Theme',
                        'Wavy Holds',
                        'Note Splashes',
                        'Hide HUD',
                        'Combo Style:',
                        'Time Bar:',
                        'Flashing Lights',
                        'Camera Zooms',
                        'Score Text Zoom on Hit',
                        'Health Bar Transparency',
                        'FPS Counter',
                        'Memory Counter',
                        'Memory Peak Counter',
                        'Pause Screen Song:',
                        'Check for Updates',
                        'Combo Stacking',
                        'Low Quality',
                        'Anti-Aliasing',
                        'Shaders',
                        'Framerate',
                        'Mosaic Mode',
                        'Fight Mode',
                        'Mosaic Strength'
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
                        'Changes how many frames you have for\nhitting a note earlier or late.',
                        "Self explaining isn't it?",
                        "If checked, the current window theme will be Dark.",
                        "If checked, hold sprites will have a wavy effect.",
                        "If unchecked, hitting \"Sick!\" notes won't show particles.",
                        'If checked, hides most HUD elements.',
                        "What Combo Style you want to display?",
                        "What should the Time Bar display?",
                        "Uncheck this if you're sensitive to flashing lights!",
                        "If unchecked, the camera won't zoom in on a beat hit.",
                        "If unchecked, disables the Score text zooming\neverytime you hit a note.",
                        'How much transparent should the health bar and icons be.',
                        'If unchecked, hides the FPS Counter.',
                        'If unchecked, hides the Memory Counter.',
                        'If unchecked, hides the Memory Peak Counter.',
                        "What song do you prefer for the Pause Screen?",
                        'On Release builds, turn this on to check for updates when you start the game.',
                        "If unchecked, Ratings and Combo won't stack, saving on System Memory and making them easier to read",
                        'If checked, disables some background details,\ndecreases loading times and improves performance.',
                        'If unchecked, disables anti-aliasing, increases performance\nat the cost of sharper visuals.',
                        'If unchecked, disables shaders.\nIt\'s used for some visual effects, and also CPU intensive for weaker PCs.',
                        "Pretty self explanatory, isn't it?",
                        "You want your game to be more pixelated?, then now you have it!",
                        "f-fight??",
                        'How pixelated you want your screen to be. (ONLY WORKS WITH MOSAIC MODE)'
                    ],
                    'controlsDescription' => [
                        'NOTES',
                        'Left',
                        'Down',
                        'Up',
                        'Right',
                        'Accept',
                        'Back',
                        'Pause',
                        'FULLSCREEN',
                        'Keybinds',
                        'Mute',
                        'Up',
                        'Down',
                        'Key'
                    ],
                    'noteOffsetUI' => [
                        'Beat Hit!',
                        "Press CTRL to change COMBO Sprites's Camera",
                        'Rating Offset:',
                        'Numbers Offset:',
                        'Current offset',
                        '< Combo Offset (Press Accept to Switch) >',
                        '< Note/Beat Delay (Press Accept to Switch) >'
                    ],
                    'secretOptionTitle' => 'Secret Stuff',
                    'warn' => "Hey Partner!\n
                    This Mod was programmed on a different version of Psych\n
                    (You may need to go to the Options to change some of the Settings!)\n
                    It also contains some flashing lights!\n
                    Press ENTER to disable them now or Press ESCAPE to ignore this message.\n
                    You've been warned!"
                ];
                pauseTranslation = ['Resume', 'Restart Song', 'Change Difficulty', 'Options', 'Exit to menu'];
                additionalPauseTranslation = ['Leave Charting Mode', 'Skip Time', 'End Song', 'Toggle Practice Mode', 'Toggle Botplay', 'Blueballed', 'PRACTICE MODE', 'CHARTING MODE'];
                titleWindow = ['Title', 'Main Menu', 'Story Mode', 'FreePlay: On Load!', 'Credits', 'Options'];
        }
    }
}